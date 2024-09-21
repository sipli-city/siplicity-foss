package siplicity

import (
	"fmt"
	"hash"
	"io"
	"os"

	"github.com/richardlehane/siegfried"
	pb "github.com/sipli-city/siplicity/gen/siplicityv1"
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
	f, err := os.Open(rec.GetName())
	if err != nil {
		return err
	}
	defer f.Close()
	var puid string
	ids, err := sa.sf.Identify(f, rec.GetName(), "")
	if err != nil {
		return err
	}
	if len(ids) != 1 {
		puid = "UNKNOWN"
	} else {
		puid = ids[0].String()
	}
	rec.Metadata = append(rec.Metadata, &pb.Metadata{
		Fields: []*pb.Field{{Namespace: "pronom", Name: "puid", Value: puid}},
	})
	return nil
}

type hashAction struct {
	hash.Hash
}

func (h *hashAction) Do(rec *pb.GetRecordResponse) error {
	if rec.GetTyp() != pb.RecordType_RECORD_TYPE_FILE {
		return nil
	}
	f, err := os.Open(rec.GetName())
	if err != nil {
		return err
	}
	defer f.Close()
	if _, err := io.Copy(h, f); err != nil {
		return err
	}
	rec.Metadata = append(rec.Metadata, &pb.Metadata{
		Fields: []*pb.Field{{Namespace: "checksum", Name: "sha256", Value: fmt.Sprintf("%x", h.Sum(nil))}},
	})
	h.Reset()
	return nil
}
