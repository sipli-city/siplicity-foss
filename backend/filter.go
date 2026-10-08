package siplicity

import (
	"slices"
	"strings"

	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

func Filter(filter string, rec *pb.GetRecordResponse) bool {
	if filter == "" || filter == "*" {
		return true
	}
	parts := strings.SplitN(filter, ":", 2)
	switch parts[0] {
	case "puid":
		ns := "pronom"
		if slices.Contains(getFieldValues(rec.GetMetadata(), &pb.FieldPath{Entries: []*pb.FieldPath_Entry{{Namespace: &ns, Name: "puid"}}}), parts[1]) {
			return true
		}
	}
	return false
}
