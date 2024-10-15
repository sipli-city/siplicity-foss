package siplicity

import (
	"slices"

	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

func totalVolume(query string, sz *int64) walkFunc {
	var qf queryFunc
	if query != "" {
		qf = parseQuery(query)
	}
	return func(rec *pb.GetRecordResponse, _ int) error {
		if qf != nil && !qf(rec) {
			return nil
		}
		*sz += rec.GetSize()
		return nil
	}
}

func countRecords(query string, typs []pb.RecordType, count *int) walkFunc {
	var qf queryFunc
	if query != "" {
		qf = parseQuery(query)
	}
	return func(rec *pb.GetRecordResponse, _ int) error {
		if qf != nil && !qf(rec) {
			return nil
		}
		if len(typs) > 0 && !slices.Contains(typs, rec.GetTyp()) {
			return nil
		}
		*count += 1
		return nil
	}
}

func countFeatures(feature *pb.FieldPath, count *map[string]int32) walkFunc {
	return func(rec *pb.GetRecordResponse, _ int) error {
		vals := getFieldValues(rec.GetMetadata(), feature)
		for _, v := range vals {
			(*count)[v] += 1
		}
		return nil
	}
}
