package siplicity

import (
	"path/filepath"

	pb "github.com/sipli-city/siplicity/gen/siplicityv1"
)

func Bagit(filter string, store Store) {
	root := store.PutChild(-1, &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_VIRTUAL_DIRECTORY, Name: "Output"}, true)
	_ = store.PutChild(root, &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_VIRTUAL_FILE, Name: "bagit.txt"}, true)
	_ = store.PutChild(root, &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_VIRTUAL_FILE, Name: "manifest-sha256.txt"}, true)
	data := store.PutChild(root, &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_VIRTUAL_DIRECTORY, Name: "data"}, true)
	ids := store.Ids(filter)
	for _, id := range ids {
		rec := store.Get(id)
		rec.Metadata = append(rec.Metadata, &pb.Metadata{
			Field: &pb.Field{Namespace: "siplicity", Name: "display_name", Value: filepath.Base(rec.GetName())},
		})
		store.AttachChild(data, id, true)
	}
}
