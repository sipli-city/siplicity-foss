package siplicity

import (
	"fmt"
	"io/fs"
	"os"
	"path/filepath"

	msoleps "github.com/richardlehane/msoleps/types"
	"golang.org/x/sys/windows"

	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

type Store interface {
	PutChild(int32, *pb.GetRecordResponse, bool) int32 // -1 = root
	AttachChild(int32, int32, bool)
	Get(int32) *pb.GetRecordResponse
	ListRecords(int32, bool) *pb.ListRecordsResponse
	Ids(string) []int32
}

func winMetatadata(path string) (string, string, string, string) {
	f, err := os.Open(path)
	if err != nil {
		return "", "", "", ""
	}
	defer f.Close()
	buf := make([]byte, 40)
	if err := windows.GetFileInformationByHandleEx(
		windows.Handle(f.Fd()),
		windows.FileBasicInfo,
		&buf,
		uint32(len(buf)),
	); err != nil {
		return "", "", "", ""
	}
	creationTime := msoleps.MustFileTime(buf[0:8])
	lastAccessTime := msoleps.MustFileTime(buf[8:16])
	lastWriteTime := msoleps.MustFileTime(buf[16:24])
	changeTime := msoleps.MustFileTime(buf[24:32])
	return creationTime.String(), lastAccessTime.String(), lastWriteTime.String(), changeTime.String()
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
			//Modtime: info.ModTime().Format(time.RFC3339),
		}
		rec.Metadata = append(rec.Metadata, &pb.Metadata{
			Field: &pb.Field{Namespace: "siplicity", Name: "base_name", Value: filepath.Base(p)},
		})
		creation, access, write, change := winMetatadata(p)
		rec.Metadata = append(rec.Metadata, &pb.Metadata{
			Field: &pb.Field{
				Namespace: "siplicity_windows",
				Name:      "file_information_basic",
			},
			Children: []*pb.Metadata{
				&pb.Metadata{
					Field: &pb.Field{
						Namespace: "siplicity_windows",
						Name:      "CreationTime",
						Value:     creation,
					},
				},
				&pb.Metadata{
					Field: &pb.Field{
						Namespace: "siplicity_windows",
						Name:      "LastAccessTime",
						Value:     access,
					},
				},
				&pb.Metadata{
					Field: &pb.Field{
						Namespace: "siplicity_windows",
						Name:      "LastWriteTime",
						Value:     write,
					},
				},
				&pb.Metadata{
					Field: &pb.Field{
						Namespace: "siplicity_windows",
						Name:      "ChangeTime",
						Value:     change,
					},
				},
			},
		})
		if root {
			strStack[idx] = p
			nidStack[idx] = s.PutChild(-1, rec, false)
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
		nid := s.PutChild(nidStack[idx], rec, false)
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
