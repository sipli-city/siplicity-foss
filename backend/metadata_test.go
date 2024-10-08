package siplicity

import (
	"testing"

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
	},
	{Field: &pb.Field{
		Namespace: "siplicity",
		Name:      "format_identification",
	},
		Children: []*pb.Metadata{
			{
				Field: &pb.Field{
					Namespace: "siegfried",
					Name:      "signature_details",
					Value:     "DROID_SignatureFile_V118.xml; container-signature-20240501.xml",
				},
			},
			{
				Field: &pb.Field{
					Namespace: "siegfried",
					Name:      "version",
					Value:     "1.11.1",
				},
			},
			{
				Field: &pb.Field{
					Namespace: "siegfried",
					Name:      "identifications",
				},
				Children: []*pb.Metadata{
					{
						Field: &pb.Field{
							Namespace: "siegfried",
							Name:      "identification",
						},
						Children: []*pb.Metadata{
							{
								Field: &pb.Field{
									Namespace: "pronom",
									Name:      "id",
									Value:     "fmt/412",
								},
							},
							{
								Field: &pb.Field{
									Namespace: "pronom",
									Name:      "format",
									Value:     "Microsoft Word for Windows",
								},
							},
							{
								Field: &pb.Field{
									Namespace: "pronom",
									Name:      "version",
									Value:     "2007 onwards",
								},
							},
							{
								Field: &pb.Field{
									Namespace: "pronom",
									Name:      "mime",
									Value:     "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
								},
							},
							{
								Field: &pb.Field{
									Namespace: "pronom",
									Name:      "class",
									Value:     "Word Processor",
								},
							},
							{
								Field: &pb.Field{
									Namespace: "pronom",
									Name:      "basis",
									Value:     "extension match docx; container name [Content_Types].xml with byte match at 515, 94 (signature 1/3)",
								},
							},
							{
								Field: &pb.Field{
									Namespace: "pronom",
									Name:      "warning",
									Value:     "",
								},
							},
						},
					},
				},
			},
		},
	},
	{
		Field: &pb.Field{Namespace: "siplicity", Name: "checksum"},
		Children: []*pb.Metadata{
			{Field: &pb.Field{
				Namespace: "siplicity",
				Name:      "algorithm",
				Value:     "XXH64",
			},
			},
			{Field: &pb.Field{
				Namespace: "siplicity",
				Name:      "hash",
				Value:     "b7b88e84357eb1c7",
			},
			},
			{Field: &pb.Field{
				Namespace: "siplicity",
				Name:      "calculated_at",
				Value:     "2024-10-07T18:04:27+11:00",
			},
			},
		},
	},
	{
		Field: &pb.Field{Namespace: "siplicity", Name: "checksum"},
		Children: []*pb.Metadata{
			{Field: &pb.Field{
				Namespace: "siplicity",
				Name:      "algorithm",
				Value:     "MD5",
			},
			},
			{Field: &pb.Field{
				Namespace: "siplicity",
				Name:      "hash",
				Value:     "686a54d206f7a37325242b21702f21c5",
			},
			},
			{Field: &pb.Field{
				Namespace: "siplicity",
				Name:      "calculated_at",
				Value:     "2024-10-07T18:18:17+11:00",
			},
			},
		},
	},
}

func TestFindMetas(t *testing.T) {
	ns := "siplicity"
	// Simple search namespace/name
	metas := findMetas(TEST_METADATA, &pb.FieldPath_Entry{Namespace: &ns, Name: "hash"})
	if len(metas) != 2 {
		t.Fatalf("Expecting two metas, got %d\n", len(metas))
	}
	// Search for entry at a particular index
	var idx int32 = 1
	metas = findMetas(TEST_METADATA, &pb.FieldPath_Entry{Namespace: &ns, Name: "checksum", Index: &idx})
	if len(metas) != 1 || metas[0].Field.Value != "" {
		t.Fatalf("Expecting one metas, got %d\n", len(metas))
	}
	// Search for entry where parent contains an entry. E.g. find hash value for the checksum that has algorithm set to MD5
	algo := "MD5"
	metas = getMetas(TEST_METADATA, &pb.FieldPath{Entries: []*pb.FieldPath_Entry{
		{Namespace: &ns, Name: "checksum", Contains: &pb.FieldPath_Entry{Name: "algorithm", Value: &algo}},
		{Namespace: &ns, Name: "hash"},
	}})
	if len(metas) != 1 || metas[0].Field.Value != "686a54d206f7a37325242b21702f21c5" {
		t.Fatalf("Expecting one metas, got %d\n", len(metas))
	}
}
