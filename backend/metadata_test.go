package siplicity

import (
	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

var TEST_METADATA = []*pb.Metadata{
	{
		Field: &pb.Field{Namespace: "siplicity", Name: "display_name", Value: "file.pdf"},
	},
	{
		Field: &pb.Field{
			Namespace: "siplicity",
			Name:      "FileModifiedTime",
			Value:     "2023-10-16T22:45:47+11:00",
		},
	},
	{
		Field: &pb.Field{
			Namespace: "siplicity_windows",
			Name:      "file_information_basic",
		},
		Children: []*pb.Metadata{
			{
				Field: &pb.Field{
					Namespace: "siplicity_windows",
					Name:      "CreationTime",
					Value:     "2023-10-17T22:45:47+11:00",
				},
			},
			{
				Field: &pb.Field{
					Namespace: "siplicity_windows",
					Name:      "LastAccessTime",
					Value:     "2023-10-18T22:45:47+11:00",
				},
			},
			{
				Field: &pb.Field{
					Namespace: "siplicity_windows",
					Name:      "LastWriteTime",
					Value:     "2023-10-19T22:45:47+11:00",
				},
			},
			{
				Field: &pb.Field{
					Namespace: "siplicity_windows",
					Name:      "ChangeTime",
					Value:     "2023-10-20T22:45:47+11:00",
				},
			},
		},
	}}
