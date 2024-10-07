package siplicity

import (
	"maps"
	"slices"
	"strings"

	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

type MemStore struct {
	records []*pb.GetRecordResponse
	lTree   *tree
	rTree   *tree
	reports map[string]map[string]int32
}

const (
	SCHEMA int32 = iota
	INPUT_GRAPH
	OUTPUT_GRAPH
)

func NewMemStore() *MemStore {
	records := make([]*pb.GetRecordResponse, 3, 1000)
	records[int(SCHEMA)] = &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_SCHEMA, Metadata: []*pb.Metadata{{Field: &pb.Field{Namespace: "siplicity", Name: "display_name", Value: "Schema"}}}}
	records[int(INPUT_GRAPH)] = &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_ROOT, Metadata: []*pb.Metadata{{Field: &pb.Field{Namespace: "siplicity", Name: "display_name", Value: "Input - add content to get started"}}}}
	records[int(OUTPUT_GRAPH)] = &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_ROOT, Metadata: []*pb.Metadata{{Field: &pb.Field{Namespace: "siplicity", Name: "display_name", Value: "Output"}}}}
	// populate schema
	records[int(SCHEMA)].Metadata = append(records[int(SCHEMA)].Metadata, fileinfoSchema())
	return &MemStore{
		records: records,
		lTree:   newTree(INPUT_GRAPH),
		rTree:   newTree(OUTPUT_GRAPH),
		reports: make(map[string]map[string]int32),
	}
}

func (m *MemStore) getTree(graph pb.GraphType) *tree {
	if graph == pb.GraphType_GRAPH_TYPE_OUTPUT {
		return m.rTree
	}
	return m.lTree // default to input tree
}

func (m *MemStore) PutChild(n int32, r *pb.GetRecordResponse, graph pb.GraphType) int32 {
	m.records = append(m.records, r)
	idx := int32(len(m.records) - 1)
	t := m.getTree(graph)
	if n < 0 {
		n = t.root
	}
	t.link(n, idx)
	return idx
}

func (m *MemStore) UpdateRecord(id int32, r *pb.GetRecordResponse) {
	if id > 0 && int(id) < len(m.records) {
		m.records[int(id)] = r
	}
}

func (m *MemStore) UpdateField(id int32, p *pb.FieldPath, overwrite bool, f *pb.Field) {
	if id < 0 && int(id) >= len(m.records) {
		return
	}
	meta := &pb.Metadata{}
	if p != nil {
		parent := getMeta(m.records[int(id)].GetMetadata(), p)
		if parent == nil {
			return
		}
		if overwrite {
			meta = parent
		} else {
			parent.Children = append(parent.Children, meta)
		}
	} else {
		if overwrite {
			existing := getMeta(m.records[int(id)].GetMetadata(), makePath([][2]string{{f.GetNamespace(), f.GetName()}}, nil))
			if existing != nil {
				existing.Field = f
				if f.GetName() == "output_location" {
					m.UpdateField(OUTPUT_GRAPH, makePath([][2]string{{"siplicity", "display_name"}}, nil),
						true,
						&pb.Field{Namespace: "siplicity", Name: "display_name", Value: "Output - " + f.Value},
					)
				}
				return
			}
		}
		m.records[int(id)].Metadata = append(m.records[int(id)].Metadata, meta)
	}
	meta.Field = f
	if f.GetName() == "output_location" {
		m.UpdateField(OUTPUT_GRAPH, makePath([][2]string{{"siplicity", "display_name"}}, nil),
			true,
			&pb.Field{Namespace: "siplicity", Name: "display_name", Value: "Output - " + f.Value},
		)
	}
}

func (m *MemStore) AddReport(k1, k2 string) {
	m2, ok := m.reports[k1]
	if !ok {
		m2 = make(map[string]int32)
		m.reports[k1] = m2
	}
	m2[k2]++
}

func (m *MemStore) Report(typ pb.ReportType, max int32) *pb.PreparedFeatureCountResponse {
	var t string
	switch typ {
	case pb.ReportType_REPORT_TYPE_MODIFIED:
		t = "modtime"
	case pb.ReportType_REPORT_TYPE_EXTENSIONS:
		t = "extension"
	case pb.ReportType_REPORT_TYPE_FORMAT_CLASS:
		t = "class"
	case pb.ReportType_REPORT_TYPE_FILE_FORMAT:
		t = "id"
	case pb.ReportType_REPORT_TYPE_MIME_TYPE:
		t = "mime"
	}
	rep, ok := m.reports[t]
	if !ok {
		return nil
	}
	if empty, ok := rep[""]; ok {
		rep["empty"] += empty
		delete(rep, "")
	}
	var feats []*pb.PreparedFeatureCountResponse_Feature
	if max > 0 && int(max) < len(rep) {
		var others int32
		feats = make([]*pb.PreparedFeatureCountResponse_Feature, int(max))
		for i, val := range slices.SortedFunc(
			maps.Values(rep),
			func(a, b int32) int {
				return int(b - a)
			},
		) {
			if i >= int(max)-1 {
				others += val
				continue
			}
			feats[i] = &pb.PreparedFeatureCountResponse_Feature{Count: val}
		}
		feats[len(feats)-1] = &pb.PreparedFeatureCountResponse_Feature{Value: "other", Count: others}
		if len(feats) > 1 {
			for k, v := range rep {
				if v >= feats[len(feats)-2].Count {
					for ii, vv := range feats {
						if vv.Count == v && vv.Value == "" {
							feats[ii].Value = k
							break
						}
					}
				}
			}
		}
	} else {
		feats = make([]*pb.PreparedFeatureCountResponse_Feature, len(rep))
		var i int
		for k, v := range rep {
			feats[i] = &pb.PreparedFeatureCountResponse_Feature{Value: k, Count: v}
			i++
		}
		if typ == pb.ReportType_REPORT_TYPE_MODIFIED {
			slices.SortFunc(feats, func(a, b *pb.PreparedFeatureCountResponse_Feature) int {
				return strings.Compare(a.Value, b.Value)
			})
		} else {
			slices.SortFunc(feats, func(a, b *pb.PreparedFeatureCountResponse_Feature) int {
				if a.Value == "empty" {
					return 1
				}
				if b.Value == "empty" {
					return -1
				}
				return int(b.Count - a.Count)
			})
		}
	}
	return &pb.PreparedFeatureCountResponse{Features: feats}
}

func (m *MemStore) AttachChild(parent, child int32, graph pb.GraphType) {
	m.getTree(graph).link(parent, child)
}

func (m *MemStore) AdoptChildren(old, new int32, graph pb.GraphType) {
	m.getTree(graph).adopt(old, new)
}

func (m *MemStore) Get(n int32) *pb.GetRecordResponse {
	if n < 0 || int(n) >= len(m.records) {
		return nil
	}
	return m.records[int(n)]
}

// recursive function to build a tree of records based on a given hierarchy
func (m *MemStore) addNode(id int32, hierarchy map[int32][]int32, filter string, display *pb.FieldPath, fields []*pb.FieldPath) *pb.ListRecordsResponse {
	name := m.records[int(id)].GetPath()
	if display != nil {
		nm := getFieldValue(m.records[int(id)].GetMetadata(), display)
		if nm != "" {
			name = nm
		}
	}
	ret := &pb.ListRecordsResponse{
		Id:   id,
		Typ:  m.records[int(id)].GetTyp(),
		Name: name,
	}
	children := hierarchy[id]
	ret.Children = make([]*pb.ListRecordsResponse, len(children))
	for i, v := range children {
		ret.Children[i] = m.addNode(v, hierarchy, filter, display, fields)
	}
	return ret
}

func (m *MemStore) ListRecords(id int32, graph pb.GraphType, filter string, display *pb.FieldPath, fields []*pb.FieldPath) *pb.ListRecordsResponse {
	if len(m.records) == 3 && id > 2 {
		return nil
	}
	t := m.getTree(graph)
	if id < 0 {
		id = t.root
	}
	return m.addNode(id, t.children, filter, display, fields)
}

func (m *MemStore) Drop(n int32, graph pb.GraphType) {
	m.getTree(graph).unlink(n)
}

func (m *MemStore) Ids(filter string) []int32 {
	ret := make([]int32, 0, len(m.records)-3)
	for i, rec := range m.records {
		if i < 3 {
			continue
		}
		if Filter(filter, rec) {
			ret = append(ret, int32(i))
		}
	}
	return ret
}

func (m *MemStore) LinkRecords(to pb.GraphType, from pb.GraphType, parent int32, nodes []int32, shift bool) {
	t := m.getTree(to)
	if parent < 0 {
		parent = t.root
	}
	if from == pb.GraphType_GRAPH_TYPE_UNSPECIFIED {
		t.linkList(parent, nodes)
		return
	}
	f := m.getTree(from)
	if shift {
		t.shift(f, parent, nodes)
		return
	}
	t.copy(f, parent, nodes)
}

func (m *MemStore) UnlinkRecords(g pb.GraphType, nodes []int32) {
	m.getTree(g).unlinkList(nodes)
}

func (m *MemStore) Purge(g pb.GraphType) {
	m.getTree(g).purge()
}

func (m *MemStore) walkChildren(t *tree, nodes []int32, str string, fn func(string, *pb.GetRecordResponse) (string, error)) error {
	for _, n := range nodes {
		nstr, err := fn(str, m.records[n])
		if err != nil {
			return err
		}
		if err = m.walkChildren(t, t.children[n], nstr, fn); err != nil {
			return err
		}
	}
	return nil
}

func (m *MemStore) Walk(g pb.GraphType, fn func(string, *pb.GetRecordResponse) (string, error)) error {
	t := m.getTree(g)
	str, err := fn("", m.records[t.root])
	if err != nil {
		return err
	}
	return m.walkChildren(t, t.children[t.root], str, fn)
}
