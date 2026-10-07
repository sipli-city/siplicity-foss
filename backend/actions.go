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

const (
	PRONOM_VERSION    string = "v118"
	SIEGFRIED_VERSION string = "1.11.1"
)

type Action interface {
	Do(rec *pb.GetRecordResponse, s Store) error
	Schema() *pb.Metadata
}

type siegfriedAction struct {
	sf *siegfried.Siegfried
}

func (sa *siegfriedAction) Do(rec *pb.GetRecordResponse, s Store) error {
	if rec.GetTyp() != pb.RecordType_RECORD_TYPE_FILE {
		return nil
	}
	f, err := os.Open(rec.GetPath())
	if err != nil {
		return err
	}
	defer f.Close()
	ids, err := sa.sf.Identify(f, rec.GetPath(), "")
	if err != nil {
		return err
	}
	identifications := make([]*pb.Metadata, len(ids))
	for i, v := range ids {
		idfields := make([]*pb.Metadata, len(v.Values())-1)
		for ii, vv := range v.Values()[1:] {
			idfields[ii] = &pb.Metadata{Field: &pb.Field{Namespace: v.Values()[0], Name: sa.sf.Fields()[0][ii+1], Value: vv}}
			switch sa.sf.Fields()[0][ii+1] {
			case "id":
				s.AddReport("id", vv)
			case "mime":
				s.AddReport("mime", vv)
			case "class":
				s.AddReport("class", vv)
			}
		}
		identifications[i] = &pb.Metadata{
			Field:    &pb.Field{Namespace: "siegfried", Name: "identification"},
			Children: idfields,
		}
	}
	rec.Metadata = append(rec.Metadata, &pb.Metadata{
		Field: &pb.Field{Namespace: "siplicity", Name: "format_identification"},
		Children: []*pb.Metadata{
			{Field: &pb.Field{Namespace: "siegfried", Name: "signature_details", Value: "DROID_SignatureFile_V118.xml; container-signature-20240501.xml"}},
			{Field: &pb.Field{Namespace: "siegfried", Name: "version", Value: "1.11.1"}},
			{Field: &pb.Field{Namespace: "siegfried", Name: "identifications"}, Children: identifications},
		},
	})
	return nil
}

// TODO - assumes a Fields length of 1 (static build of Siegfried with just pronom)
func (sa *siegfriedAction) Schema() *pb.Metadata {
	idFields := make([]*pb.Metadata, len(sa.sf.Fields()[0])-1)
	ns := sa.sf.Fields()[0][0]
	for ii, vv := range sa.sf.Fields()[0][1:] {
		idFields[ii] = &pb.Metadata{Field: &pb.Field{Namespace: ns, Name: vv}}
	}
	return &pb.Metadata{
		Field: &pb.Field{Namespace: "siplicity", Name: "format_identification"},
		Children: []*pb.Metadata{
			{Field: &pb.Field{Namespace: "siegfried", Name: "signature_details", Value: "DROID_SignatureFile_V118.xml; container-signature-20240501.xml"}},
			{Field: &pb.Field{Namespace: "siegfried", Name: "version", Value: "1.11.1"}},
			{Field: &pb.Field{Namespace: "siegfried", Name: "identifications"}, Children: []*pb.Metadata{
				{Field: &pb.Field{Namespace: "siegfried", Name: "identification"},
					Children: idFields},
			}},
		},
	}
}

type hashAction struct {
	label string
	hash.Hash
}

func (h *hashAction) Do(rec *pb.GetRecordResponse, s Store) error {
	if rec.GetTyp() != pb.RecordType_RECORD_TYPE_FILE {
		return nil
	}
	ns := "siplicity"
	if getFieldValue(rec.Metadata, &pb.FieldPath{Entries: []*pb.FieldPath_Entry{{Namespace: &ns, Name: "algorithm"}}}) == h.label {
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

func (h *hashAction) Schema() *pb.Metadata {
	return &pb.Metadata{
		Field: &pb.Field{Namespace: "siplicity", Name: "checksum"},
		Children: []*pb.Metadata{
			{Field: &pb.Field{Namespace: "siplicity", Name: "algorithm"}},
			{Field: &pb.Field{Namespace: "siplicity", Name: "hash"}},
			{Field: &pb.Field{Namespace: "siplicity", Name: "calculated_at"}},
		},
	}
}
