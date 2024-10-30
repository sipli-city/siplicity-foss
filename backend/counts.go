package siplicity

import (
	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

func totalVolume(query string, sz *int64) walkFunc {
	qf := parseQuery(query)
	return func(rec *pb.GetRecordResponse, _ int32, _ int) error {
		if qf(rec) {
			*sz += rec.GetSize()
		}
		return nil
	}
}

func countRecords(query string, typs []pb.RecordType, count *int) walkFunc {
	qf := jointQuery(parseQuery(query), recordTypQuery(typs))
	return func(rec *pb.GetRecordResponse, _ int32, _ int) error {
		if qf(rec) {
			*count += 1
		}
		return nil
	}
}

func countFeatures(feature *pb.FieldPath, count *map[string]int32) walkFunc {
	return func(rec *pb.GetRecordResponse, _ int32, _ int) error {
		vals := getFieldValues(rec.GetMetadata(), feature)
		for _, v := range vals {
			(*count)[v] += 1
		}
		return nil
	}
}
