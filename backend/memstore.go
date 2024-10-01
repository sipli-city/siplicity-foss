package siplicity

import (
	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

type MemStore struct {
	records []*pb.GetRecordResponse
	lTree   *tree
	rTree   *tree
	dTree   *tree //duplicates (unused)
}

func NewMemStore() *MemStore {
	records := make([]*pb.GetRecordResponse, 3, 1000)
	records[0] = &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_ROOT, Path: "Input - Add files or directories"}
	records[1] = &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_ROOT, Path: "Output - Move files or directories from the input graph here"}
	return &MemStore{
		records: records,
		lTree:   newTree(0),
		rTree:   newTree(1),
		dTree:   newTree(2),
	}
}

func (m *MemStore) getTree(graph pb.GraphType) *tree {
	switch graph {
	case pb.GraphType_GRAPH_TYPE_OUTPUT:
		return m.rTree
	case pb.GraphType_GRAPH_TYPE_DUPLICATE:
		return m.dTree
	}
	return m.lTree // default to input tree
}

func (m *MemStore) PutChild(n int32, r *pb.GetRecordResponse, graph pb.GraphType) int32 {
	m.records = append(m.records, r)
	idx := int32(len(m.records) - 1)
	t := m.getTree(graph)
	if n == -1 {
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

func (m *MemStore) UpdateField(id int32, p *pb.FieldPath, f *pb.Field) {
	if id > 0 && int(id) < len(m.records) {
		meta := &pb.Metadata{}
		if p != nil {
			parent := getParent(m.records[int(id)].GetMetadata(), p)
			parent.Children = append(parent.Children, meta)
		} else {
			m.records[int(id)].Metadata = append(m.records[int(id)].Metadata, meta)
		}
		meta.Field = f
	}
}

func (m *MemStore) AttachChild(parent, child int32, graph pb.GraphType) {
	m.getTree(graph).link(parent, child)
}

func (m *MemStore) Get(n int32) *pb.GetRecordResponse {
	return m.records[int(n)]
}

// recursive function to build a tree of records based on a given hierarchy
func (m *MemStore) addNode(id int32, hierarchy map[int32][]int32, filter string, display *pb.FieldPath, fields []*pb.FieldPath) *pb.ListRecordsResponse {
	name := m.records[int(id)].GetPath()
	if display != nil {
		nm := getField(m.records[int(id)].GetMetadata(), display)
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
