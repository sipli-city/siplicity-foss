package siplicity

import (
	"fmt"
	"hash"
	"io"
	"os"
	"time"

	"github.com/richardlehane/siegfried"
	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

type Action interface {
	Do(rec *pb.GetRecordResponse) error
}

type siegfriedAction struct {
	sf *siegfried.Siegfried
}

func (sa *siegfriedAction) Do(rec *pb.GetRecordResponse) error {
	if rec.GetTyp() != pb.RecordType_RECORD_TYPE_FILE {
		return nil
	}
	f, err := os.Open(rec.GetPath())
	if err != nil {
		return err
	}
	defer f.Close()
	var puid string
	ids, err := sa.sf.Identify(f, rec.GetPath(), "")
	if err != nil {
		return err
	}
	if len(ids) != 1 {
		puid = "UNKNOWN"
	} else {
		puid = ids[0].String()
	}
	rec.Metadata = append(rec.Metadata, &pb.Metadata{
		Field: &pb.Field{Namespace: "siplicity", Name: "format_identification"},
		Children: []*pb.Metadata{
			{Field: &pb.Field{Namespace: "siplicity", Name: "PRONOM_version", Value: "v118"}},
			{Field: &pb.Field{Namespace: "siplicity", Name: "siegfried_version", Value: "1.11.1"}},
			{Field: &pb.Field{Namespace: "siplicity", Name: "PUID", Value: puid}},
		},
	})
	return nil
}

type hashAction struct {
	label string
	hash.Hash
}

func (h *hashAction) Do(rec *pb.GetRecordResponse) error {
	if rec.GetTyp() != pb.RecordType_RECORD_TYPE_FILE {
		return nil
	}
	f, err := os.Open(rec.GetPath())
	if err != nil {
		return err
	}
	defer f.Close()
	if _, err := io.Copy(h, f); err != nil {
		return err
	}
	rec.Metadata = append(rec.Metadata, &pb.Metadata{
		Field: &pb.Field{Namespace: "siplicity", Name: "checksum"},
		Children: []*pb.Metadata{
			{Field: &pb.Field{Namespace: "siplicity", Name: "algorithm", Value: h.label}},
			{Field: &pb.Field{Namespace: "siplicity", Name: "hash", Value: fmt.Sprintf("%x", h.Sum(nil))}},
			{Field: &pb.Field{Namespace: "siplicity", Name: "calculated_at", Value: time.Now().Format(time.RFC3339)}},
		},
	})
	h.Reset()
	return nil
}
