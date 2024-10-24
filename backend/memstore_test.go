package siplicity

import (
	"testing"

	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

var TEST_RECORD_SCHEMA = &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_SCHEMA}
var TEST_RECORD_INPUT = &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_ROOT}
var TEST_RECORD_OUTPUT = &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_ROOT}

var TEST_RECORD_A = &pb.GetRecordResponse{
	Typ:  pb.RecordType_RECORD_TYPE_DIRECTORY,
	Path: "/test/path/",
	Size: 0,
}

var TEST_RECORD_B = &pb.GetRecordResponse{
	Typ:  pb.RecordType_RECORD_TYPE_DIRECTORY,
	Path: "/test/path/to",
	Size: 0,
}

var TEST_RECORD_C = &pb.GetRecordResponse{
	Typ:      pb.RecordType_RECORD_TYPE_FILE,
	Path:     "/test/path/to/file.png",
	Size:     20,
	Metadata: TEST_METADATA,
}

var TEST_RECORD_D = &pb.GetRecordResponse{
	Typ:      pb.RecordType_RECORD_TYPE_FILE,
	Path:     "/test/path/to/file2.png",
	Size:     40,
	Metadata: TEST_METADATA_A,
}

var TEST_RECORD_E = &pb.GetRecordResponse{
	Typ:      pb.RecordType_RECORD_TYPE_FILE,
	Path:     "/test/path/file3.png",
	Size:     60,
	Metadata: TEST_METADATA_B,
}

var TEST_MEMSTORE = &MemStore{
	records: []*pb.GetRecordResponse{
		TEST_RECORD_SCHEMA,
		TEST_RECORD_INPUT,
		TEST_RECORD_OUTPUT,
		TEST_RECORD_A,
		TEST_RECORD_B,
		TEST_RECORD_C,
		TEST_RECORD_D,
		TEST_RECORD_E,
	},
	lTree: &tree{
		root: INPUT_GRAPH,
		parents: map[int32]int32{
			3: 1,
			4: 3,
			5: 4,
			6: 4,
			7: 3,
		},
		children: map[int32][]int32{
			1: {3},
			3: {4, 7},
			4: {5, 6},
		},
	},
	rTree: &tree{
		root: OUTPUT_GRAPH,
	},
	reports: map[string]map[string]int32{},
}

func TestQueryList(t *testing.T) {
	qf := parseQuery(":id=fmt/412")
	ret := make([]int32, 0, 5)
	TEST_MEMSTORE.queryNodes(&ret, TEST_MEMSTORE.lTree.root, TEST_MEMSTORE.lTree.children, qf)
	if len(ret) != 2 {
		t.Fatalf("expected two matches, got %d", len(ret))
	}
	if ret[0] != 5 || ret[1] != 7 {
		t.Fatalf("expected matches at 5 and 7, got %d and %d", ret[0], ret[1])
	}
}
