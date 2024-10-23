package siplicity

import (
	"fmt"
	"slices"
	"strings"

	"github.com/dustin/go-humanize"
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
	records[int(SCHEMA)] = &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_SCHEMA, Metadata: []*pb.Metadata{
		{Field: &pb.Field{Namespace: "siplicity", Name: "input_name", Value: "Schema"}},
		{Field: &pb.Field{Namespace: "siplicity", Name: "output_name"}}}}
	records[int(INPUT_GRAPH)] = &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_ROOT, Metadata: []*pb.Metadata{{Field: &pb.Field{Namespace: "siplicity", Name: "input_name", Value: "Input - add content to get started"}}}}
	records[int(OUTPUT_GRAPH)] = &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_ROOT, Metadata: []*pb.Metadata{{Field: &pb.Field{Namespace: "siplicity", Name: "output_name", Value: "Output"}}}}
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

func (m *MemStore) UpdateField(id int32, p *pb.FieldPath, overwrite bool, f *pb.Field) { // field is the last element of the fieldpath if overwrite == true; if overwrite is false, fieldpath should go to the parent
	if id < 0 && int(id) >= len(m.records) {
		return
	}
	meta := &pb.Metadata{}
	if p != nil {
		parent := getMetas(m.records[int(id)].GetMetadata(), p)
		if len(parent) != 1 {
			place := &(m.records[int(id)].Metadata)
			for idx, entry := range p.GetEntries() {
				parent = getMetas(*place, &pb.FieldPath{Entries: []*pb.FieldPath_Entry{entry}})
				if len(parent) == 1 {
					place = &(parent[0].Children)
				} else {
					if idx == len(p.GetEntries())-1 {
						*place = append(*place, meta)
					} else {
						child := &pb.Metadata{Field: &pb.Field{Namespace: *entry.Namespace, Name: entry.Name, Value: *entry.Value}}
						_ = append(*place, child)
						place = &(child.Children)
					}
				}
			}
		} else {
			if overwrite {
				meta = parent[0]
			} else {
				parent[0].Children = append(parent[0].Children, meta)
			}
		}
	} else {
		if overwrite {
			existing := getMetas(m.records[int(id)].GetMetadata(), makePath([][2]string{{f.GetNamespace(), f.GetName()}}, nil))
			if len(existing) == 1 {
				existing[0].Field = f
				if f.GetName() == "output_location" {
					m.UpdateField(OUTPUT_GRAPH, makePath([][2]string{{"siplicity", "output_name"}}, nil),
						true,
						&pb.Field{Namespace: "siplicity", Name: "output_name", Value: "Output - " + f.Value},
					)
				}
				return
			}
		}
		m.records[int(id)].Metadata = append(m.records[int(id)].Metadata, meta)
	}
	meta.Field = f
	if f.GetName() == "output_location" {
		m.UpdateField(OUTPUT_GRAPH, makePath([][2]string{{"siplicity", "output_name"}}, nil),
			true,
			&pb.Field{Namespace: "siplicity", Name: "output_name", Value: "Output - " + f.Value},
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

func (m *MemStore) Reports() *pb.PreparedFeatureAvailableResponse {
	ret := &pb.PreparedFeatureAvailableResponse{}
	ret.Report = make([]pb.ReportType, 0, len(m.reports))
	if _, ok := m.reports["sizes"]; ok {
		ret.Report = append(ret.Report, pb.ReportType_REPORT_TYPE_SIZES)
	}
	if _, ok := m.reports["modtime"]; ok {
		ret.Report = append(ret.Report, pb.ReportType_REPORT_TYPE_MODIFIED)
	}
	if _, ok := m.reports["extension"]; ok {
		ret.Report = append(ret.Report, pb.ReportType_REPORT_TYPE_EXTENSIONS)
	}
	if _, ok := m.reports["id"]; ok {
		ret.Report = append(ret.Report, pb.ReportType_REPORT_TYPE_FILE_FORMAT)
	}
	if _, ok := m.reports["mime"]; ok {
		ret.Report = append(ret.Report, pb.ReportType_REPORT_TYPE_MIME_TYPE)
	}
	if _, ok := m.reports["class"]; ok {
		ret.Report = append(ret.Report, pb.ReportType_REPORT_TYPE_FORMAT_CLASS)
	}
	if _, ok := m.reports["multiple"]; ok {
		ret.Report = append(ret.Report, pb.ReportType_REPORT_TYPE_MULTIPLE_IDENTIFICATION)
	}
	var dupes int32
	if _, ok := m.reports["duplicates"]; ok {
		for _, v := range m.reports["duplicates"] {
			if v > 1 {
				if dupes == 0 {
					ret.Report = append(ret.Report, pb.ReportType_REPORT_TYPE_DUPLICATES)
				}
				dupes += v
			}
		}
	}
	var message string
	if len(ret.Report) > 0 {
		inputCount := RecordCount(m, -1, pb.GraphType_GRAPH_TYPE_INPUT, "", []pb.RecordType{pb.RecordType_RECORD_TYPE_FILE})
		if inputCount > 0 {
			inputSize := TotalVolume(m, -1, pb.GraphType_GRAPH_TYPE_INPUT, "")
			message = fmt.Sprintf("%d files in the input pane, with a total size of %s.", inputCount, humanize.Bytes(uint64(inputSize)))
		}
		outputCount := RecordCount(m, -1, pb.GraphType_GRAPH_TYPE_OUTPUT, "", []pb.RecordType{pb.RecordType_RECORD_TYPE_FILE})
		if outputCount > 0 {
			if inputCount > 0 {
				message += "\n"
			}
			outputSize := TotalVolume(m, -1, pb.GraphType_GRAPH_TYPE_OUTPUT, "")
			message += fmt.Sprintf("%d files in the output pane, with a total size of %s.", outputCount, humanize.Bytes(uint64(outputSize)))
		}
		if dupes > 0 {
			message += fmt.Sprintf("\nThere are %d duplicates.", dupes)
		}
	}
	ret.Digest = message
	return ret
}

func (m *MemStore) Report(typ pb.ReportType) *pb.PreparedFeatureCountResponse {
	var t string
	switch typ {
	case pb.ReportType_REPORT_TYPE_SIZES:
		t = "sizes"
	case pb.ReportType_REPORT_TYPE_MODIFIED:
		t = "modtime"
	case pb.ReportType_REPORT_TYPE_EXTENSIONS:
		t = "extension"
	case pb.ReportType_REPORT_TYPE_FILE_FORMAT:
		t = "id"
	case pb.ReportType_REPORT_TYPE_MIME_TYPE:
		t = "mime"
	case pb.ReportType_REPORT_TYPE_FORMAT_CLASS:
		t = "class"
	case pb.ReportType_REPORT_TYPE_MULTIPLE_IDENTIFICATION:
		t = "multiple"
	case pb.ReportType_REPORT_TYPE_DUPLICATES:
		t = "duplicates"
	}
	rep, ok := m.reports[t]
	if !ok {
		return nil
	}
	if typ == pb.ReportType_REPORT_TYPE_DUPLICATES {
		dupes := make(map[string]int32)
		for k, v := range rep {
			if v > 1 {
				dupes[k] = v
			}
		}
		rep = dupes
	}
	if empty, ok := rep[""]; ok {
		rep["empty"] += empty
		delete(rep, "")
	}
	feats := make([]*pb.PreparedFeatureCountResponse_Feature, len(rep))
	var i int
	for k, v := range rep {
		feats[i] = &pb.PreparedFeatureCountResponse_Feature{Value: k, Count: v}
		i++
	}
	if typ == pb.ReportType_REPORT_TYPE_SIZES {
		slices.SortFunc(feats, func(a, b *pb.PreparedFeatureCountResponse_Feature) int {
			return slices.Index(sizeLabels[:], a.Value) - slices.Index(sizeLabels[:], b.Value)
		})
	} else if typ == pb.ReportType_REPORT_TYPE_MODIFIED {
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
	return &pb.PreparedFeatureCountResponse{Features: feats}
}

func (m *MemStore) FeatureReport(root int32, graph pb.GraphType, feature *pb.FieldPath) *pb.CountFeaturesResponse {
	count := make(map[string]int32)
	wf := countFeatures(feature, &count)
	m.Walk(root, graph, wf)
	if empty, ok := count[""]; ok {
		count["empty"] += empty
		delete(count, "")
	}
	feats := make([]*pb.CountFeaturesResponse_Feature, len(count))
	var i int
	for k, v := range count {
		feats[i] = &pb.CountFeaturesResponse_Feature{Value: k, Count: v}
		i++
	}
	slices.SortFunc(feats, func(a, b *pb.CountFeaturesResponse_Feature) int {
		if a.Value == "empty" {
			return 1
		}
		if b.Value == "empty" {
			return -1
		}
		return int(b.Count - a.Count)
	})
	return &pb.CountFeaturesResponse{Features: feats}
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

func sortFn(a, b *pb.ListRecordsResponse) int {
	return strings.Compare(a.GetName(), b.GetName())
}

var siplNamespace = "siplicity"

func (m *MemStore) makeResponse(id int32, display displayTyp, fields []*pb.FieldPath) *pb.ListRecordsResponse {
	name := m.records[int(id)].GetPath()
	if display > 0 {
		if display == OUTPUT_DISPLAY {
			nm := getFieldValues(m.records[int(id)].GetMetadata(), &pb.FieldPath{Entries: []*pb.FieldPath_Entry{{Namespace: &siplNamespace, Name: "output_name"}}})
			if len(nm) > 0 {
				name = nm[0]
			} else {
				nm = getFieldValues(m.records[int(id)].GetMetadata(), &pb.FieldPath{Entries: []*pb.FieldPath_Entry{{Namespace: &siplNamespace, Name: "input_name"}}})
				if len(nm) > 0 {
					name = nm[0]
				}
			}
		} else {
			nm := getFieldValues(m.records[int(id)].GetMetadata(), &pb.FieldPath{Entries: []*pb.FieldPath_Entry{{Namespace: &siplNamespace, Name: "input_name"}}})
			if len(nm) > 0 {
				name = nm[0]
			}
		}
	}
	ret := &pb.ListRecordsResponse{
		Id:   id,
		Typ:  m.records[int(id)].GetTyp(),
		Name: name,
	}
	if fields != nil {
		ret.Fields = make([]*pb.Field, len(fields))
		for i, f := range fields {
			ret.Fields[i] = getField(m.records[int(id)].GetMetadata(), f)
		}
	}
	return ret
}

// recursive function to build a tree of records based on a given hierarchy
func (m *MemStore) addNode(id int32, hierarchy map[int32][]int32, display displayTyp, fields []*pb.FieldPath) *pb.ListRecordsResponse {
	ret := m.makeResponse(id, display, fields)
	children := hierarchy[id]
	ret.Children = make([]*pb.ListRecordsResponse, len(children))
	for idx, v := range children {
		ret.Children[idx] = m.addNode(v, hierarchy, display, fields)
	}
	slices.SortFunc(ret.Children, sortFn)
	return ret
}

func (m *MemStore) queryNodes(ret *[]int32, id int32, hierarchy map[int32][]int32, qf queryFunc) {
	if qf(m.records[int(id)]) {
		*ret = append(*ret, id)
	}
	children := hierarchy[id]
	for _, v := range children {
		m.queryNodes(ret, v, hierarchy, qf)
	}
}

type displayTyp uint8

const (
	PATH_DISPLAY displayTyp = iota
	INPUT_DISPLAY
	OUTPUT_DISPLAY
)

func (m *MemStore) ListRecords(id int32, graph pb.GraphType, page int32, display bool, query string, typs []pb.RecordType, fields []*pb.FieldPath) *pb.ListRecordsResponse {
	if len(m.records) == 3 && id > 2 {
		return nil
	}
	t := m.getTree(graph)
	if id < 0 {
		id = t.root
	}
	var dtyp displayTyp
	if display {
		if graph == pb.GraphType_GRAPH_TYPE_OUTPUT {
			dtyp = OUTPUT_DISPLAY
		} else {
			dtyp = INPUT_DISPLAY
		}
	}
	if query != "" || len(typs) > 0 {
		qf := parseQuery(query, typs)
		ids := make([]int32, 0, 100)
		m.queryNodes(&ids, id, t.children, qf)
		resp := m.addNode(id, t.hierarchy(ids), dtyp, fields)
		switch resp.GetName() {
		case "Input":
			resp.Name = "Input - Query: " + query
		case "Output":
			resp.Name = "Input - Query: " + query
		}
		return resp
	}
	if page > 0 {
		ids := t.page(page)
		if ids == nil {
			return nil
		}
		root := m.makeResponse(t.root, dtyp, fields)
		root.Children = make([]*pb.ListRecordsResponse, len(ids))
		for i, id := range ids {
			root.Children[i] = m.makeResponse(id, dtyp, fields)
		}
		return root
	}
	return m.addNode(id, t.children, dtyp, fields)
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
		t.shift(f, parent, nodes, from == pb.GraphType_GRAPH_TYPE_INPUT)
		return
	}
	t.copy(f, parent, nodes)
}

func (m *MemStore) UnlinkRecords(g pb.GraphType, nodes []int32) {
	m.getTree(g).unlinkList(nodes, false)
}

func (m *MemStore) Purge(g pb.GraphType) {
	m.getTree(g).purge()
}

func (m *MemStore) walkChildren(t *tree, nodes []int32, depth int, fn walkFunc) error {
	for _, n := range nodes {
		if err := fn(m.records[n], depth); err != nil {
			return err
		}
		if err := m.walkChildren(t, t.children[n], depth+1, fn); err != nil {
			return err
		}
	}
	return nil
}

func (m *MemStore) Walk(root int32, g pb.GraphType, fn walkFunc) error {
	if g == pb.GraphType_GRAPH_TYPE_UNSPECIFIED {
		for i, rec := range m.records {
			if i <= int(OUTPUT_GRAPH) {
				continue
			}
			if err := fn(rec, 0); err != nil {
				return err
			}
		}
		return nil
	}
	t := m.getTree(g)
	if root < 0 {
		root = t.root
	}
	if err := fn(m.records[root], 0); err != nil {
		return err
	}
	return m.walkChildren(t, t.children[root], 1, fn)
}
