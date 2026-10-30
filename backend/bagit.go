package siplicity

import (
	"bytes"
	"errors"
	"fmt"
	"slices"
	"strings"

	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

const baginfo = "BagIt-Version: 1.0\nTag-File-Character-Encoding: UTF-8"

func Bagit(filter string, store Store) error {
	data := store.PutChild(OUTPUT_GRAPH, &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_VIRTUAL_DIRECTORY, Path: "data"}, pb.GraphType_GRAPH_TYPE_OUTPUT)
	store.AdoptChildren(OUTPUT_GRAPH, data, pb.GraphType_GRAPH_TYPE_OUTPUT)
	info := store.PutChild(OUTPUT_GRAPH, &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_VIRTUAL_FILE, Path: "bagit.txt"}, pb.GraphType_GRAPH_TYPE_OUTPUT)
	store.PutContents(info, strings.NewReader(baginfo))
	manifests := make([]string, 0, 5)
	_ = store.Walk(data, pb.GraphType_GRAPH_TYPE_OUTPUT, manifestWalk(&manifests))
	if len(manifests) == 0 {
		return errors.New("need to run a checksum action before creating a bag")
	}
	for _, m := range manifests {
		mid := store.PutChild(OUTPUT_GRAPH, &pb.GetRecordResponse{Typ: pb.RecordType_RECORD_TYPE_VIRTUAL_FILE, Path: manifestName(m)}, pb.GraphType_GRAPH_TYPE_OUTPUT)
		store.PutContents(mid, newManifestContents(m, data, store))
	}
	return nil
}

func ptr(s string) *string {
	return &s
}

func manifestWalk(m *[]string) walkFunc {
	var first bool = true
	var empty bool

	return func(rec *pb.GetRecordResponse, _ int32, _ int) error {
		if empty {
			return nil
		}
		if rec.Typ == pb.RecordType_RECORD_TYPE_FILE {
			if first {
				empty = true
				if queryMetas(rec.Metadata, &pb.FieldPath_Entry{Namespace: &siplNamespace, Name: "algorithm", Value: ptr("SHA512")}) {
					this := append(*m, "SHA512")
					m = &this
					empty = false
				}
				if queryMetas(rec.Metadata, &pb.FieldPath_Entry{Namespace: &siplNamespace, Name: "algorithm", Value: ptr("SHA256")}) {
					this := append(*m, "SHA256")
					m = &this
					empty = false
				}
				if queryMetas(rec.Metadata, &pb.FieldPath_Entry{Namespace: &siplNamespace, Name: "algorithm", Value: ptr("SHA1")}) {
					this := append(*m, "SHA1")
					m = &this
					empty = false
				}
				if queryMetas(rec.Metadata, &pb.FieldPath_Entry{Namespace: &siplNamespace, Name: "algorithm", Value: ptr("MD5")}) {
					this := append(*m, "MD5")
					m = &this
					empty = false
				}
				if queryMetas(rec.Metadata, &pb.FieldPath_Entry{Namespace: &siplNamespace, Name: "algorithm", Value: ptr("blake2b-512")}) {
					this := append(*m, "blake2b-512")
					m = &this
					empty = false
				}
				if queryMetas(rec.Metadata, &pb.FieldPath_Entry{Namespace: &siplNamespace, Name: "algorithm", Value: ptr("blake2b-256")}) {
					this := append(*m, "blake2b-256")
					m = &this
					empty = false
				}
				first = false
				return nil
			}
			for _, v := range *m {
				if !queryMetas(rec.Metadata, &pb.FieldPath_Entry{Namespace: &siplNamespace, Name: "algorithm", Value: &v}) {
					this := slices.DeleteFunc(*m, func(e string) bool { return e == v })
					m = &this
				}
			}
			if len(*m) == 0 {
				empty = true
			}
			return nil
		}
		return nil
	}
}

func manifestName(algo string) string {
	switch algo {
	case "SHA512":
		return "manifest-sha512.txt"
	case "SHA256":
		return "manifest-sha256.txt"
	case "MD5":
		return "manifest-md5.txt"
	case "blake2b-512":
		return "manifest-blake2b512.txt"
	case "blake2b-256":
		return "manifest-blake2b256.txt"
	}
	return ""
}

func newManifestContents(algo string, data int32, s Store) *manifestContents {
	return &manifestContents{
		algo: algo,
		data: data,
		s:    s,
		buf:  &bytes.Buffer{},
	}
}

type manifestContents struct {
	ready bool
	algo  string
	data  int32
	s     Store
	buf   *bytes.Buffer
}

func (m *manifestContents) Read(p []byte) (int, error) {
	if m.ready {
		return m.buf.Read(p)
	}
	err := m.s.Walk(m.data, pb.GraphType_GRAPH_TYPE_OUTPUT, writeContents(m.buf, m.algo))
	if err != nil {
		return 0, err
	}
	m.ready = true
	return m.buf.Read(p)
}

func writeContents(buf *bytes.Buffer, algo string) walkFunc {
	closure_paths := make([]string, 0, 5)

	return func(rec *pb.GetRecordResponse, id int32, depth int) error {
		switch rec.Typ {
		case pb.RecordType_RECORD_TYPE_DIRECTORY, pb.RecordType_RECORD_TYPE_VIRTUAL_DIRECTORY:
			base := outputName(rec)
			if depth < len(closure_paths) {
				closure_paths[depth] = base
			} else {
				closure_paths = append(closure_paths, base)
			}
		case pb.RecordType_RECORD_TYPE_VIRTUAL_FILE:
			// path := strings.Join(closure_paths[:depth], "/") + "/" + outputName(rec)
			// unimplemented - may need to hash the contents of the virtual file as presumably don't have the checksum
		case pb.RecordType_RECORD_TYPE_FILE:
			path := strings.Join(closure_paths[:depth], "/") + "/" + outputName(rec)
			metas := getMetas(rec.Metadata, &pb.FieldPath{Entries: []*pb.FieldPath_Entry{
				{Namespace: &siplNamespace, Name: "checksum", Contains: &pb.FieldPath_Entry{Name: "algorithm", Value: &algo}},
				{Namespace: &siplNamespace, Name: "hash"},
			}})
			if len(metas) == 0 {
				return fmt.Errorf("missing %s hash for %s", algo, path)
			}
			buf.WriteString(path + " " + metas[0].Field.Value + "\n")
		}
		return nil
	}

}
