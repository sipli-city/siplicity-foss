//go:build !windows

package siplicity

import (
	"io/fs"
	"time"

	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

func fileinfoSchema() *pb.Metadata {
	return &pb.Metadata{
		Field: &pb.Field{
			Namespace: "siplicity",
			Name:      "FileModifiedTime",
		},
	}
}

func fileinfo(_ string, info fs.FileInfo) (*pb.Metadata, time.Time) {
	modtime := info.ModTime()
	return &pb.Metadata{
		Field: &pb.Field{
			Namespace: "siplicity",
			Name:      "FileModifiedTime",
			Value:     modtime.Format(time.RFC3339),
		},
	}, modtime
}
