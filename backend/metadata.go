package siplicity

import (
	pb "github.com/sipli-city/siplicity/gen/siplicityv1"
)

func getField(meta []*pb.Metadata, ns, name string) string {
	for _, v := range meta {
		field := v.GetField()
		if field.GetNamespace() == ns && field.GetName() == name {
			return field.GetValue()
		}
		ret := getField(v.GetChildren(), ns, name)
		if ret != "" {
			return ret
		}
	}
	return ""
}
