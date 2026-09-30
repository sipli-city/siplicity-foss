//go:build !windows

package siplicity

import (
	"io/fs"
	"time"

	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

func fileinfo(_ string, info fs.FileInfo) *pb.Metadata {
	return &pb.Metadata{
		Field: &pb.Field{
			Namespace: "siplicity",
			Name:      "FileModifiedTime",
			Value:     info.ModTime().Format(time.RFC3339),
		},
	}
}
