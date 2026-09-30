package siplicity

import (
	"fmt"
	"io/fs"
	"path/filepath"

	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

type Store interface {
	PutChild(int32, *pb.GetRecordResponse, pb.GraphType) int32 // -1 = root
	UpdateRecord(int32, *pb.GetRecordResponse)
	UpdateField(int32, *pb.FieldPath, *pb.Field)
	AttachChild(int32, int32, pb.GraphType)
	Get(int32) *pb.GetRecordResponse
	ListRecords(int32, pb.GraphType, string, *pb.FieldPath, []*pb.FieldPath) *pb.ListRecordsResponse
	Ids(string) []int32
}

func AddPath(path string, s Store) error {
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
			Field: &pb.Field{Namespace: "siplicity", Name: "base_name", Value: filepath.Base(p)},
		})
		fi := fileinfo(path, info)
		if fi != nil {
			rec.Metadata = append(rec.Metadata, fi)
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
