package siplicity

import (
	"slices"

	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

type MemStore struct {
	records   []*pb.GetRecordResponse
	lParent   map[int32]int32
	rParent   map[int32]int32
	dParent   map[int32]int32
	lChildren map[int32][]int32
	rChildren map[int32][]int32
	dChildren map[int32][]int32
}

func NewMemStore() *MemStore {
	records := make([]*pb.GetRecordResponse, 2, 1000)
	records[0] = &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_ROOT, Path: "Input - Add files or directories"}
	records[1] = &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_ROOT, Path: "Output - Move files or directories from the input graph here"}
	return &MemStore{
		records:   records,
		lParent:   make(map[int32]int32), // child -> parent
		rParent:   make(map[int32]int32),
		dParent:   make(map[int32]int32),
		lChildren: make(map[int32][]int32), // parent -> children
		rChildren: make(map[int32][]int32),
		dChildren: make(map[int32][]int32),
	}
}

func (m *MemStore) PutChild(n int32, r *pb.GetRecordResponse, graph pb.GraphType) int32 {
	m.records = append(m.records, r)
	idx := int32(len(m.records) - 1)
	if graph == pb.GraphType_GRAPH_TYPE_OUTPUT {
		if n == -1 {
			n = 1
		}
		m.rParent[idx] = n
		m.rChildren[n] = append(m.rChildren[n], idx)
		return idx
	}
	if n == -1 {
		n = 0
	}
	m.lParent[idx] = n
	m.lChildren[n] = append(m.lChildren[n], idx)
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
	if graph == pb.GraphType_GRAPH_TYPE_OUTPUT {
		m.rParent[child] = parent
		m.rChildren[parent] = append(m.rChildren[parent], child)
		return
	}
	m.lParent[child] = parent
	m.lChildren[parent] = append(m.lChildren[parent], child)
}

// For a set of children, give them a new parent, and remove them from the list of children of their old parent(s)
func (m *MemStore) AttachParent(parent int32, children []int32, graph pb.GraphType) {
	if graph == pb.GraphType_GRAPH_TYPE_OUTPUT {
		var grandparent int32
		for i, child := range children {
			if i == 0 {
				grandparent = m.rParent[child]
				m.AttachChild(grandparent, parent, graph) // give the new parent a parent
				m.rChildren[grandparent] = slices.DeleteFunc(m.rChildren[grandparent], func(e int32) bool { return slices.Contains(children, e) })
			} else {
				if grandparent != m.rParent[child] {
					grandparent = m.rParent[child]
					m.rChildren[grandparent] = slices.DeleteFunc(m.rChildren[grandparent], func(e int32) bool { return slices.Contains(children, e) })
				}
			}
			m.AttachChild(parent, child, graph)
		}
		return
	}
	var grandparent int32
	for i, child := range children {
		if i == 0 {
			grandparent = m.lParent[child]
			m.AttachChild(grandparent, parent, graph) // give the new parent a parent
			m.lChildren[grandparent] = slices.DeleteFunc(m.lChildren[grandparent], func(e int32) bool { return slices.Contains(children, e) })
		} else {
			if grandparent != m.lParent[child] {
				grandparent = m.lParent[child]
				m.lChildren[grandparent] = slices.DeleteFunc(m.lChildren[grandparent], func(e int32) bool { return slices.Contains(children, e) })
			}
		}
		m.AttachChild(parent, child, graph)
	}
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

func (m *MemStore) ListRecords(id int32, graphtyp pb.GraphType, filter string, display *pb.FieldPath, fields []*pb.FieldPath) *pb.ListRecordsResponse {
	if len(m.records) == 2 && id > 1 {
		return nil
	}
	if graphtyp == pb.GraphType_GRAPH_TYPE_OUTPUT {
		if id < 0 {
			id = 1
		}
		return m.addNode(id, m.rChildren, filter, display, fields)
	}
	if id < 0 {
		id = 0
	}
	return m.addNode(id, m.lChildren, filter, display, fields)
}

func (m *MemStore) Drop(n int32, output bool) {
	if output {
		if n == 1 {
			return
		}
		delete(m.rChildren, n)
		parent := m.rParent[n]
		m.rChildren[parent] = slices.DeleteFunc(m.rChildren[parent], func(v int32) bool { return n == v })
		return
	}
	if n == 0 {
		return
	}
	delete(m.lChildren, n)
	parent := m.lParent[n]
	m.lChildren[parent] = slices.DeleteFunc(m.lChildren[parent], func(v int32) bool { return n == v })
}

func (m *MemStore) Ids(filter string) []int32 {
	ret := make([]int32, 0, len(m.records)-2)
	for i, rec := range m.records {
		if Filter(filter, rec) {
			ret = append(ret, int32(i))
		}
	}
	return ret
}
