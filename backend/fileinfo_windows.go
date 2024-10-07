package siplicity

import (
	"io/fs"
	"log"
	"os"
	"time"
	"unsafe"

	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"

	msoleps "github.com/richardlehane/msoleps/types"
	"golang.org/x/sys/windows"
)

func fileinfoSchema() *pb.Metadata {
	return &pb.Metadata{
		Field: &pb.Field{
			Namespace: "siplicity_windows",
			Name:      "file_information_basic",
		},
		Children: []*pb.Metadata{
			{
				Field: &pb.Field{
					Namespace: "siplicity_windows",
					Name:      "CreationTime",
				},
			},
			{
				Field: &pb.Field{
					Namespace: "siplicity_windows",
					Name:      "LastAccessTime",
				},
			},
			{
				Field: &pb.Field{
					Namespace: "siplicity_windows",
					Name:      "LastWriteTime",
				},
			},
			{
				Field: &pb.Field{
					Namespace: "siplicity_windows",
					Name:      "ChangeTime",
				},
			},
		},
	}
}

type basicInfo struct {
	CreationTime, LastAccessTime, LastWriteTime, ChangeTime uint64
	FileAttributes                                          uint32
	_                                                       uint32
}

func toTime(in uint64) msoleps.FileTime {
	return msoleps.FileTime{
		Low:  uint32(in),
		High: uint32(in >> 32),
	}
}

func fileinfo(path string, _ fs.FileInfo) (*pb.Metadata, time.Time) {
	fi := &basicInfo{}
	f, err := os.Open(path)
	if err != nil {
		log.Println(err)
		return nil, time.Time{}
	}
	defer f.Close()
	if err := windows.GetFileInformationByHandleEx(
		windows.Handle(f.Fd()),
		windows.FileBasicInfo,
		(*byte)(unsafe.Pointer(fi)),
		uint32(unsafe.Sizeof(*fi)),
	); err != nil {
		return nil, time.Time{}
	}
	modtime := toTime(fi.LastWriteTime).Time()
	return &pb.Metadata{
		Field: &pb.Field{
			Namespace: "siplicity_windows",
			Name:      "file_information_basic",
		},
		Children: []*pb.Metadata{
			{
				Field: &pb.Field{
					Namespace: "siplicity_windows",
					Name:      "CreationTime",
					Value:     toTime(fi.CreationTime).Time().Format(time.RFC3339),
				},
			},
			{
				Field: &pb.Field{
					Namespace: "siplicity_windows",
					Name:      "LastAccessTime",
					Value:     toTime(fi.LastAccessTime).Time().Format(time.RFC3339),
				},
			},
			{
				Field: &pb.Field{
					Namespace: "siplicity_windows",
					Name:      "LastWriteTime",
					Value:     modtime.Format(time.RFC3339),
				},
			},
			{
				Field: &pb.Field{
					Namespace: "siplicity_windows",
					Name:      "ChangeTime",
					Value:     toTime(fi.ChangeTime).Time().Format(time.RFC3339),
				},
			},
		},
	}, modtime
}
