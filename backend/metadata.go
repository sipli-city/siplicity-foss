package siplicity

import (
	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

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

func getField(meta []*pb.Metadata, path *pb.FieldPath) string {
	entries := path.GetEntries()
	for idx, entry := range entries {
		m := findMeta(meta, entry)
		if m == nil {
			return ""
		}
		if idx == len(entries)-1 {
			return m.GetField().GetValue()
		}
		meta = m.GetChildren()
	}
	return ""
}
