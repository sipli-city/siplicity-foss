package siplicity

import (
	"strings"

	pb "github.com/sipli-city/siplicity/gen/siplicityv1"
)

func Filter(filter string, rec *pb.GetRecordResponse) bool {
	if filter == "" || filter == "*" {
		return true
	}
	parts := strings.SplitN(filter, ":", 2)
	switch parts[0] {
	case "puid":
		if getField(rec.GetMetadata(), "pronom", "puid") == parts[1] {
			return true
		}
	}
	return false
}
