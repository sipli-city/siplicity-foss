package siplicity

import (
	"path/filepath"
	"strconv"
	"strings"

	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

type queryFunc func(*pb.GetRecordResponse) bool

func sizeQuery(sz int64) queryFunc {
	return func(rec *pb.GetRecordResponse) bool {
		if rec.GetTyp() != pb.RecordType_RECORD_TYPE_FILE {
			return false
		}
		return rec.GetSize() == sz
	}
}

func extQuery(ext string) queryFunc {
	return func(rec *pb.GetRecordResponse) bool {
		if rec.GetTyp() != pb.RecordType_RECORD_TYPE_FILE {
			return false
		}
		return strings.TrimPrefix(filepath.Ext(rec.Path), ".") == ext
	}
}

func metadataQuery(ns, name, val string) queryFunc {
	entry := &pb.FieldPath_Entry{Name: name}
	if ns != "" {
		entry.Namespace = &ns
	}
	if val != "" {
		entry.Value = &val
	}
	return func(rec *pb.GetRecordResponse) bool {
		if name == "hash" || name == "id" {
			if rec.GetTyp() != pb.RecordType_RECORD_TYPE_FILE {
				return false
			}
		}
		return queryMetas(rec.GetMetadata(), entry)
	}
}

func parseQuery(query string) queryFunc {
	spl := strings.SplitN(query, "=", 2)
	if len(spl) != 2 {
		return nil
	}
	spl2 := strings.SplitN(spl[0], ":", 2)
	if len(spl2) == 2 {
		return metadataQuery(spl2[0], spl2[1], spl[1])
	}
	if spl[0] == "Size" {
		sz, err := strconv.ParseInt(spl[1], 10, 64)
		if err != nil {
			return nil
		}
		return sizeQuery(sz)
	}
	if spl[0] == "Extension" {
		return extQuery(spl[1])
	}
	return nil
}
