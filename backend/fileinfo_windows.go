package siplicity

import (
	"io/fs"
	"os"
	"time"
	"unsafe"

	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"

	msoleps "github.com/richardlehane/msoleps/types"
	"golang.org/x/sys/windows"
)

var buf [40]byte

func fileinfo(path string, _ fs.FileInfo) *pb.Metadata {
	f, err := os.Open(path)
	if err != nil {
		return nil
	}
	defer f.Close()
	if err := windows.GetFileInformationByHandleEx(
		windows.Handle(f.Fd()),
		windows.FileBasicInfo,
		(*byte)(unsafe.Pointer(&buf)),
		uint32(len(buf)),
	); err != nil {
		return nil
	}
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
					Value:     msoleps.MustFileTime(buf[0:8]).Time().Format(time.RFC3339),
				},
			},
			{
				Field: &pb.Field{
					Namespace: "siplicity_windows",
					Name:      "LastAccessTime",
					Value:     msoleps.MustFileTime(buf[8:16]).Time().Format(time.RFC3339),
				},
			},
			{
				Field: &pb.Field{
					Namespace: "siplicity_windows",
					Name:      "LastWriteTime",
					Value:     msoleps.MustFileTime(buf[16:24]).Time().Format(time.RFC3339),
				},
			},
			{
				Field: &pb.Field{
					Namespace: "siplicity_windows",
					Name:      "ChangeTime",
					Value:     msoleps.MustFileTime(buf[24:32]).Time().Format(time.RFC3339),
				},
			},
		},
	}
}
