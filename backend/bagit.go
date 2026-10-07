package siplicity

import (
	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

func Bagit(filter string, store Store) {
	data := store.PutChild(OUTPUT_GRAPH, &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_VIRTUAL_DIRECTORY, Path: "data"}, pb.GraphType_GRAPH_TYPE_OUTPUT)
	store.AdoptChildren(OUTPUT_GRAPH, data, pb.GraphType_GRAPH_TYPE_OUTPUT)
	_ = store.PutChild(OUTPUT_GRAPH, &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_VIRTUAL_FILE, Path: "bagit.txt"}, pb.GraphType_GRAPH_TYPE_OUTPUT)
	_ = store.PutChild(OUTPUT_GRAPH, &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_VIRTUAL_FILE, Path: "manifest-sha256.txt"}, pb.GraphType_GRAPH_TYPE_OUTPUT)
}
