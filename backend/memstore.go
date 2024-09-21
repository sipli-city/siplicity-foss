package siplicity

import (
	"slices"

	pb "github.com/sipli-city/siplicity/gen/siplicityv1"
)

type MemStore struct {
	records   []*pb.GetRecordResponse
	lRoot     int32
	rRoot     int32
	lParent   map[int32]int32
	rParent   map[int32]int32
	lChildren map[int32][]int32
	rChildren map[int32][]int32
}

func NewMemStore() *MemStore {
	return &MemStore{
		records:   make([]*pb.GetRecordResponse, 0, 1000),
		lParent:   make(map[int32]int32), // child -> parent
		rParent:   make(map[int32]int32),
		lChildren: make(map[int32][]int32), // parent -> children
		rChildren: make(map[int32][]int32),
	}
}

func (m *MemStore) PutChild(n int32, r *pb.GetRecordResponse, output bool) int32 {
	m.records = append(m.records, r)
	idx := int32(len(m.records) - 1)
	if n == -1 {
		//	if idx == 0 { // we've only got one, root record
		if output {
			m.rRoot = idx
		} else {
			m.lRoot = idx
		}
		return idx
		//	}
		/*	if output {
				m.rParent[m.rRoot] = idx
				m.rChildren[idx] = append(m.rChildren[idx], m.rRoot)
				m.rRoot = idx
				return idx
			}
			m.lParent[m.lRoot] = idx
			m.lChildren[idx] = append(m.lChildren[idx], m.lRoot)
			m.lRoot = idx
			return idx*/
	}
	if output {
		m.rParent[idx] = n
		m.rChildren[n] = append(m.rChildren[n], idx)
		return idx
	}
	m.lParent[idx] = n
	m.lChildren[n] = append(m.lChildren[n], idx)
	return idx
}

func (m *MemStore) AttachChild(parent, child int32, output bool) {
	if output {
		m.rParent[child] = parent
		m.rChildren[parent] = append(m.rChildren[parent], child)
		return
	}
	m.lParent[child] = parent
	m.lChildren[parent] = append(m.lChildren[parent], child)
}

func (m *MemStore) Get(n int32) *pb.GetRecordResponse {
	return m.records[int(n)]
}

func (m *MemStore) Root(output bool) int32 {
	if output {
		return m.rRoot
	}
	return m.lRoot
}

func (m *MemStore) addNode(id int32, hierarchy map[int32][]int32) *pb.ListRecordsResponse {
	name := m.records[int(id)].GetName()
	display := getField(m.records[int(id)].GetMetadata(), "siplicity", "display_name")
	if display != "" {
		name = display
	}
	ret := &pb.ListRecordsResponse{
		Id:   id,
		Typ:  m.records[int(id)].GetTyp(),
		Name: name,
	}
	children := hierarchy[id]
	ret.Children = make([]*pb.ListRecordsResponse, len(children))
	for i, v := range children {
		ret.Children[i] = m.addNode(v, hierarchy)
	}
	return ret
}

func (m *MemStore) ListRecords(id int32, output bool) *pb.ListRecordsResponse {
	if len(m.records) == 0 {
		return nil
	}
	if output {
		if id == -1 {
			id = m.rRoot
		}
		return m.addNode(id, m.rChildren)
	}
	if id == -1 {
		id = m.lRoot
	}
	return m.addNode(id, m.lChildren)
}

func (m *MemStore) Drop(n int32, output bool) {
	if output {
		if n == m.rRoot {
			return
		}
		delete(m.rChildren, n)
		parent := m.rParent[n]
		m.rChildren[parent] = slices.DeleteFunc(m.rChildren[parent], func(v int32) bool { return n == v })
		return
	}
	if n == m.lRoot {
		return
	}
	delete(m.lChildren, n)
	parent := m.lParent[n]
	m.lChildren[parent] = slices.DeleteFunc(m.lChildren[parent], func(v int32) bool { return n == v })
}

func (m *MemStore) Ids(filter string) []int32 {
	ret := make([]int32, 0, len(m.records))
	for i, rec := range m.records {
		if Filter(filter, rec) {
			ret = append(ret, int32(i))
		}
	}
	return ret
}
