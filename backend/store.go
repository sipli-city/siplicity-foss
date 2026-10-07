package siplicity

import (
	"fmt"
	"io/fs"
	"path/filepath"
	"strings"

	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

const MonthOnly = "2006-01"

type Store interface {
	AddReport(string, string)
	Report(pb.ReportType, int32) *pb.PreparedFeatureCountResponse
	PutChild(int32, *pb.GetRecordResponse, pb.GraphType) int32 // -1 = root
	UpdateRecord(int32, *pb.GetRecordResponse)
	UpdateField(int32, *pb.FieldPath, bool, *pb.Field)
	AttachChild(int32, int32, pb.GraphType)
	AdoptChildren(int32, int32, pb.GraphType)
	Get(int32) *pb.GetRecordResponse
	ListRecords(int32, pb.GraphType, string, *pb.FieldPath, []*pb.FieldPath) *pb.ListRecordsResponse
	Ids(string) []int32
	LinkRecords(to pb.GraphType, from pb.GraphType, parent int32, nodes []int32, shift bool)
	UnlinkRecords(graph pb.GraphType, nodes []int32)
	Purge(graph pb.GraphType)
	Walk(pb.GraphType, func(string, *pb.GetRecordResponse) (string, error)) error
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
			ext := strings.TrimPrefix(filepath.Ext(p), ".")
			if ext != "" {
				s.AddReport("extension", ext)
			}
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
