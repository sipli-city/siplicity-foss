package siplicity

import (
	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

func findMetas(metas []*pb.Metadata, entry *pb.FieldPath_Entry) []*pb.Metadata {
	var ret []*pb.Metadata
	for _, m := range metas {
		f := m.GetField()
		if entry.GetName() == f.GetName() {
			if entry.GetNamespace() == "" || entry.GetNamespace() == f.GetNamespace() {
				ret = append(ret, m)
			}
		}
		if children := m.GetChildren(); children != nil {
			if nret := findMetas(children, entry); len(nret) != 0 {
				ret = append(ret, nret...)
			}
		}
	}
	return ret
}

// find first *pb.Metadata which matches the entry
func findMeta(meta []*pb.Metadata, entry *pb.FieldPath_Entry) *pb.Metadata {
	var n int32
	for _, m := range meta {
		f := m.GetField()
		if entry.GetName() == f.GetName() {
			if entry.GetNamespace() == "" || entry.GetNamespace() == f.GetNamespace() {
				if entry.Index == nil || entry.GetIndex() == n {
					return m
				} else if entry.Index != nil {
					n++
				}
			}
		}
		if n == 0 {
			if children := m.GetChildren(); children != nil {
				if ret := findMeta(children, entry); ret != nil {
					return ret
				}
			}
		}
	}
	return nil
}

func getMeta(meta []*pb.Metadata, path *pb.FieldPath) *pb.Metadata {
	entries := path.GetEntries()
	for idx, entry := range entries {
		m := findMeta(meta, entry)
		if m == nil {
			return nil
		}
		if idx == len(entries)-1 {
			return m
		}
		meta = m.GetChildren()
	}
	return nil
}

func getFieldValue(meta []*pb.Metadata, path *pb.FieldPath) string {
	p := getMeta(meta, path)
	if p == nil {
		return ""
	}
	return p.GetField().GetValue()
}

func makePath(entries [][2]string, indexes []int32) *pb.FieldPath {
	e := make([]*pb.FieldPath_Entry, len(entries))
	for i, v := range entries {
		e[i] = &pb.FieldPath_Entry{}
		if v[0] != "" {
			e[i].Namespace = &v[0]
		}
		e[i].Name = v[1]
		if indexes != nil && indexes[i] >= 0 {
			e[i].Index = &indexes[i]
		}
	}
	return &pb.FieldPath{Entries: e}
}
