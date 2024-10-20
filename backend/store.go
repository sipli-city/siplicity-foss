package siplicity

import (
	"fmt"
	"io/fs"
	"path/filepath"
	"strings"

	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

const MonthOnly = "2006-01"

type walkFunc func(*pb.GetRecordResponse, int) error

type Store interface {
	AddReport(string, string)
	Report(pb.ReportType) *pb.PreparedFeatureCountResponse
	Reports() *pb.PreparedFeatureAvailableResponse
	FeatureReport(int32, pb.GraphType, *pb.FieldPath) *pb.CountFeaturesResponse
	PutChild(int32, *pb.GetRecordResponse, pb.GraphType) int32 // -1 = root
	UpdateRecord(int32, *pb.GetRecordResponse)
	UpdateField(int32, *pb.FieldPath, bool, *pb.Field)
	AttachChild(int32, int32, pb.GraphType)
	AdoptChildren(int32, int32, pb.GraphType)
	Get(int32) *pb.GetRecordResponse
	ListRecords(int32, pb.GraphType, int32, string, *pb.FieldPath, []*pb.FieldPath) *pb.ListRecordsResponse
	Ids(string) []int32
	LinkRecords(to pb.GraphType, from pb.GraphType, parent int32, nodes []int32, shift bool)
	UnlinkRecords(graph pb.GraphType, nodes []int32)
	Purge(graph pb.GraphType)
	Walk(int32, pb.GraphType, walkFunc) error
}

const (
	B int64 = 1 << (10 * iota)
	KB
	MB
	GB
)

var sizeLabels = [...]string{"0", "<1KB", "<100KB", "<1MB", "<10MB", "<100MB", "<1GB", ">1GB"}

func sizeBucket(sz int64) string {
	switch {
	case sz == 0:
		return sizeLabels[0]
	case sz < KB:
		return sizeLabels[1]
	case sz < 100*KB:
		return sizeLabels[2]
	case sz < MB:
		return sizeLabels[3]
	case sz < 10*MB:
		return sizeLabels[4]
	case sz < 100*MB:
		return sizeLabels[5]
	case sz < GB:
		return sizeLabels[6]
	default:
		return sizeLabels[7]
	}
}

func AddPath(path string, s Store) error {
	s.UpdateField(INPUT_GRAPH, &pb.FieldPath{Entries: []*pb.FieldPath_Entry{{Name: "display_name"}}}, true, &pb.Field{Namespace: "siplicity", Name: "display_name", Value: "Input"})
	stackSize := 20
	strStack := make([]string, stackSize)
	nidStack := make([]int32, stackSize)
	var idx int
	root := true
	wf := func(p string, d fs.DirEntry, err error) error {
		if err != nil {
			return err
		}
		info, err := d.Info()
		if err != nil {
			return err
		}
		typ := pb.RecordType_RECORD_TYPE_FILE
		if info.IsDir() {
			typ = pb.RecordType_RECORD_TYPE_DIRECTORY
		}
		rec := &pb.GetRecordResponse{
			Typ:  typ,
			Path: p,
			Size: info.Size(),
		}
		rec.Metadata = append(rec.Metadata, &pb.Metadata{
			Field: &pb.Field{Namespace: "siplicity", Name: "display_name", Value: filepath.Base(p)},
		})
		if typ == pb.RecordType_RECORD_TYPE_FILE {
			s.AddReport("sizes", sizeBucket(rec.Size))
			s.AddReport("extension", strings.TrimPrefix(filepath.Ext(p), "."))
		}
		fi, mod := fileinfo(p, info)
		if fi != nil {
			rec.Metadata = append(rec.Metadata, fi)
			s.AddReport("modtime", mod.Format(MonthOnly))
		}
		if root {
			strStack[idx] = p
			nidStack[idx] = s.PutChild(-1, rec, pb.GraphType_GRAPH_TYPE_INPUT)
			root = false
			return nil
		}
		for idx >= -1 {
			if idx < 0 {
				return fmt.Errorf("couldn't find a parent for %s", p)
			}
			if filepath.Dir(p) == strStack[idx] {
				break
			}
			idx -= 1
		}
		nid := s.PutChild(nidStack[idx], rec, pb.GraphType_GRAPH_TYPE_INPUT)
		idx += 1
		// expand stacks if needed
		if idx >= stackSize {
			stackSize *= 2
			nstrStack := make([]string, stackSize)
			copy(nstrStack, strStack)
			strStack = nstrStack
			nnidStack := make([]int32, stackSize)
			copy(nnidStack, nidStack)
			nidStack = nnidStack
		}
		strStack[idx] = p
		nidStack[idx] = nid
		return nil
	}
	return filepath.WalkDir(path, wf)
}

func TotalVolume(s Store, root int32, graph pb.GraphType, query string) int64 {
	var sz int64
	wf := totalVolume(query, &sz)
	s.Walk(root, graph, wf)
	return sz
}

func RecordCount(s Store, root int32, graph pb.GraphType, query string, typs []pb.RecordType) int {
	var count int
	wf := countRecords(query, typs, &count)
	s.Walk(root, graph, wf)
	return count
}
