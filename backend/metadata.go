package siplicity

import (
	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

func matches(field *pb.Field, entry *pb.FieldPath_Entry, index int32) (bool, int32) {
	if (entry.GetName() != field.GetName()) ||
		(entry.GetNamespace() != "" && entry.GetNamespace() != field.GetNamespace()) ||
		(entry.GetValue() != "" && entry.GetValue() != field.GetValue()) {
		return false, index
	}
	if entry.Index == nil || entry.GetIndex() == index {
		return true, index
	}
	index += 1
	return false, index
}

func contains(meta *pb.Metadata, entry *pb.FieldPath_Entry) bool {
	var n int32
	var match bool
	for _, m := range meta.GetChildren() {
		match, n = matches(m.GetField(), entry, n)
		if match {
			return true
		}
		if n == 0 {
			for _, mm := range m.GetChildren() {
				if delve := contains(mm, entry); delve {
					return true
				}
			}
		}
	}
	return false
}

func queryMetas(metas []*pb.Metadata, entry *pb.FieldPath_Entry) bool {
	var n int32
	var match bool
	for _, m := range metas {
		if match, n = matches(m.GetField(), entry, n); match {
			return true
		}
		if n == 0 {
			if children := m.GetChildren(); children != nil {
				if cmatch := queryMetas(children, entry); cmatch {
					return true
				}
			}
		}
	}
	return false
}

func findMetas(metas []*pb.Metadata, entry *pb.FieldPath_Entry) []*pb.Metadata {
	var n int32
	var match bool
	var ret []*pb.Metadata
	for _, m := range metas {
		match, n = matches(m.GetField(), entry, n)
		if match {
			if entry.Contains == nil || contains(m, entry.GetContains()) {
				ret = append(ret, m)
			}
		}
		if n == 0 {
			if children := m.GetChildren(); children != nil {
				if nret := findMetas(children, entry); len(nret) != 0 {
					ret = append(ret, nret...)
				}
			}
		}
	}
	return ret
}

func getMetas(meta []*pb.Metadata, path *pb.FieldPath) []*pb.Metadata {
	entries := path.GetEntries()
	for idx, entry := range entries {
		m := findMetas(meta, entry)
		if len(m) == 0 {
			return nil
		}
		if idx == len(entries)-1 {
			return m
		}
		meta = meta[:0]
		for _, mm := range m {
			meta = append(meta, mm.GetChildren()...)
		}
	}
	return nil
}

func getFieldValues(meta []*pb.Metadata, path *pb.FieldPath) []string {
	p := getMetas(meta, path)
	if len(p) == 0 {
		return nil
	}
	ret := make([]string, len(p))
	for i, v := range p {
		ret[i] = v.GetField().GetValue()
	}
	return ret
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
