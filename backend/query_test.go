package siplicity

import (
	"testing"

	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

var TEST_RECORD = &pb.GetRecordResponse{
	Typ:      pb.RecordType_RECORD_TYPE_FILE,
	Path:     "/test/path/to/file.png",
	Size:     20,
	Metadata: TEST_METADATA,
}

func TestQuery(t *testing.T) {
	qf := parseQuery("Extension=png")
	if qf == nil {
		t.Fatal("parsing extension query failed, got nil")
	}
	if !qf(TEST_RECORD) {
		t.Fatal("png extension match fail")
	}
	qf = parseQuery("Extension=jpg")
	if qf == nil {
		t.Fatal("parsing size query failed, got nil")
	}
	if qf(TEST_RECORD) {
		t.Fatal("bad extension should fail")
	}
	qf = parseQuery("Size=20")
	if qf == nil {
		t.Fatal("parsing size query failed, got nil")
	}
	if !qf(TEST_RECORD) {
		t.Fatal("size match fail")
	}
	qf = parseQuery("Size=30")
	if qf == nil {
		t.Fatal("parsing size query failed, got nil")
	}
	if qf(TEST_RECORD) {
		t.Fatal("bad size should fail")
	}
	qf = parseQuery("pronom:id=fmt/412")
	if qf == nil {
		t.Fatal("fmt metadata query failed, got nil")
	}
	if !qf(TEST_RECORD) {
		t.Fatal("fmt metadata query match fail")
	}
	qf = parseQuery("pronom:id=fmt/413")
	if qf == nil {
		t.Fatal("fmt metadata query failed, got nil")
	}
	if qf(TEST_RECORD) {
		t.Fatal("bad fmt should fail")
	}
	qf = parseQuery(":hash=b7b88e84357eb1c7")
	if qf == nil {
		t.Fatal("hash metadata query failed, got nil")
	}
	if !qf(TEST_RECORD) {
		t.Fatal("hash metadata query match fail")
	}
	qf = parseQuery(":hash=b7b88e84367eb1c7")
	if qf == nil {
		t.Fatal("hash metadata query failed, got nil")
	}
	if qf(TEST_RECORD) {
		t.Fatal("bad hash should fail")
	}
}
