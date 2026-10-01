package siplicity

import (
	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

func Bagit(filter string, store Store) {
	root := int32(-1)
	data := store.PutChild(root, &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_VIRTUAL_DIRECTORY, Path: "data"}, pb.GraphType_GRAPH_TYPE_OUTPUT)
	store.AdoptChildren(root, data, pb.GraphType_GRAPH_TYPE_OUTPUT)
	_ = store.PutChild(root, &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_VIRTUAL_FILE, Path: "bagit.txt"}, pb.GraphType_GRAPH_TYPE_OUTPUT)
	_ = store.PutChild(root, &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_VIRTUAL_FILE, Path: "manifest-sha256.txt"}, pb.GraphType_GRAPH_TYPE_OUTPUT)
}
