package siplicity

import (
	"path/filepath"
	"strconv"
	"strings"

	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

type queryFunc func(*pb.GetRecordResponse) bool

func modQuery(val string) queryFunc {
	if strings.Contains(val, ",") {
		months := strings.Split(val, ",")
		return func(rec *pb.GetRecordResponse) bool {
			if rec.GetTyp() != pb.RecordType_RECORD_TYPE_FILE {
				return false
			}
			mnths := getFieldValues(rec.GetMetadata(), &pb.FieldPath{Entries: []*pb.FieldPath_Entry{{Name: "LastWriteTime"}}})
			if len(mnths) < 1 || len(mnths[0]) < 6 {
				return false
			}
			mnth := string(mnths[0][:7])
			for _, v := range months {
				if mnth == v {
					return true
				}
			}
			return false
		}
	}
	return func(rec *pb.GetRecordResponse) bool {
		if rec.GetTyp() != pb.RecordType_RECORD_TYPE_FILE {
			return false
		}
		mnths := getFieldValues(rec.GetMetadata(), &pb.FieldPath{Entries: []*pb.FieldPath_Entry{{Name: "LastWriteTime"}}})
		if len(mnths) < 1 || len(mnths[0]) < 6 {
			return false
		}
		mnth := string(mnths[0][:7])
		return mnth == val
	}
}

type szrngquery func(int64) bool

func rngQuery(from, to int64) szrngquery {
	return func(this int64) bool {
		if this >= from && this < to {
			return true
		}
		return false
	}
}

func toRngQuery(label string) szrngquery {
	switch label {
	case "0":
		return func(this int64) bool { return this == 0 }
	case "<1KB":
		return rngQuery(1, KB)
	case "<100KB":
		return rngQuery(KB, 100*KB)
	case "<1MB":
		return rngQuery(100*KB, MB)
	case "<10MB":
		return rngQuery(MB, 10*MB)
	case "<100MB":
		return rngQuery(10*MB, 100*MB)
	case "<1GB":
		return rngQuery(100*MB, GB)
	case ">1GB":
		return func(this int64) bool { return this >= GB }
	}
	return nil
}

func sizesQuery(ssz string) queryFunc {
	if strings.Contains(ssz, ",") {
		sszs := strings.Split(ssz, ",")
		queries := make([]szrngquery, len(sszs))
		for i, v := range sszs {
			qry := toRngQuery(v)
			if qry == nil {
				return nil
			}
			queries[i] = qry
		}
		return func(rec *pb.GetRecordResponse) bool {
			if rec.GetTyp() != pb.RecordType_RECORD_TYPE_FILE {
				return false
			}
			for _, q := range queries {
				if q(rec.GetSize()) {
					return true
				}
			}
			return false
		}
	}
	single_q := toRngQuery(ssz)
	if single_q == nil {
		return nil
	}
	return func(rec *pb.GetRecordResponse) bool {
		if rec.GetTyp() != pb.RecordType_RECORD_TYPE_FILE {
			return false
		}
		return single_q(rec.GetSize())
	}
}

func sizeQuery(ssz string) queryFunc {
	if strings.Contains(ssz, ",") {
		sszs := strings.Split(ssz, ",")
		szs := make([]int64, len(sszs))
		for i, v := range sszs {
			vv, err := strconv.ParseInt(v, 10, 64)
			if err != nil {
				return nil
			}
			szs[i] = vv
		}
		return func(rec *pb.GetRecordResponse) bool {
			if rec.GetTyp() != pb.RecordType_RECORD_TYPE_FILE {
				return false
			}
			for _, sz := range szs {
				if rec.GetSize() == sz {
					return true
				}
			}
			return false
		}
	}
	this_sz, err := strconv.ParseInt(ssz, 10, 64)
	if err != nil {
		return nil
	}
	return func(rec *pb.GetRecordResponse) bool {
		if rec.GetTyp() != pb.RecordType_RECORD_TYPE_FILE {
			return false
		}
		return rec.GetSize() == this_sz
	}
}

func extQuery(ext string) queryFunc {
	if strings.Contains(ext, ",") {
		exts := strings.Split(ext, ",")
		for i, v := range exts {
			if v == "empty" {
				exts[i] = ""
			}
		}
		return func(rec *pb.GetRecordResponse) bool {
			if rec.GetTyp() != pb.RecordType_RECORD_TYPE_FILE {
				return false
			}
			for _, ext := range exts {
				if strings.TrimPrefix(filepath.Ext(rec.Path), ".") == ext {
					return true
				}
			}
			return false
		}
	}
	if ext == "empty" {
		ext = ""
	}
	return func(rec *pb.GetRecordResponse) bool {
		if rec.GetTyp() != pb.RecordType_RECORD_TYPE_FILE {
			return false
		}
		return strings.TrimPrefix(filepath.Ext(rec.Path), ".") == ext
	}
}

func metadataQuery(ns, name, val string) queryFunc {
	if strings.Contains(val, ",") {
		vals := strings.Split(val, ",")
		entries := make([]*pb.FieldPath_Entry, len(vals))
		for i, v := range vals {
			entries[i] = &pb.FieldPath_Entry{Name: name}
			if ns != "" {
				entries[i].Namespace = &ns
			}
			if v != "" {
				entries[i].Value = &v // requires go 1.22
			}
			if v == "empty" {
				v = ""
				entries[i].Value = &v
			}
		}
		return func(rec *pb.GetRecordResponse) bool {
			if rec.GetTyp() != pb.RecordType_RECORD_TYPE_FILE {
				return false
			}
			for _, e := range entries {
				if queryMetas(rec.GetMetadata(), e) {
					return true
				}
			}
			return false
		}
	}
	entry := &pb.FieldPath_Entry{Name: name}
	if ns != "" {
		entry.Namespace = &ns
	}
	if val != "" {
		entry.Value = &val
	}
	if val == "empty" {
		val = ""
		entry.Value = &val
	}
	return func(rec *pb.GetRecordResponse) bool {
		if rec.GetTyp() != pb.RecordType_RECORD_TYPE_FILE {
			return false
		}
		return queryMetas(rec.GetMetadata(), entry)
	}
}

/*
  ReportType.REPORT_TYPE_SIZES => "Sizes",
      ReportType.REPORT_TYPE_EXTENSIONS => "Extension",
      ReportType.REPORT_TYPE_MODIFIED => "Modified",
      ReportType.REPORT_TYPE_FILE_FORMAT => "Format",
      ReportType.REPORT_TYPE_FORMAT_CLASS => "Class",
      ReportType.REPORT_TYPE_MIME_TYPE => "Mime",
      ReportType.REPORT_TYPE_DUPLICATES => "Duplicates",
      ReportType.REPORT_TYPE_MULTIPLE_IDENTIFICATION => "MultipleID",
*/

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
		return sizeQuery(spl[1])
	}
	if spl[0] == "Sizes" {
		return sizesQuery(spl[1])
	}
	if spl[0] == "Modified" {
		return modQuery(spl[1])
	}
	if spl[0] == "Extension" {
		return extQuery(spl[1])
	}
	if spl[0] == "Format" {
		return metadataQuery("pronom", "id", spl[1])
	}
	if spl[0] == "Class" {
		return metadataQuery("pronom", "class", spl[1])
	}
	if spl[0] == "Mime" {
		return metadataQuery("pronom", "mime", spl[1])
	}
	if spl[0] == "Duplicates" {
		return metadataQuery("siplicity", "hash", spl[1])
	}
	return nil
}
