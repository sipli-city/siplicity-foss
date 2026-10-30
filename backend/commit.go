package siplicity

import (
	"errors"
	"io"
	"os"
	"path/filepath"

	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

func outputName(rec *pb.GetRecordResponse) string {
	outs := getFieldValues(rec.GetMetadata(), makePath([][2]string{{"siplicity", "output_name"}}, nil))
	if len(outs) >= 1 {
		return outs[0]
	}
	ins := getFieldValues(rec.GetMetadata(), makePath([][2]string{{"siplicity", "input_name"}}, nil))
	if len(ins) >= 1 {
		return ins[0]
	}
	return filepath.Base(rec.GetPath())
}

func commit(s Store) walkFunc {
	closure_paths := make([]string, 1, 5)

	return func(rec *pb.GetRecordResponse, id int32, depth int) error {
		switch rec.Typ {
		case pb.RecordType_RECORD_TYPE_ROOT:
			paths := getFieldValues(rec.GetMetadata(), makePath([][2]string{{"siplicity", "output_location"}}, nil))
			if len(paths) == 0 {
				return errors.New("output path not set")
			}
			closure_paths[depth] = paths[0] // only need the first value
			return os.MkdirAll(paths[0], 0777)
		case pb.RecordType_RECORD_TYPE_DIRECTORY, pb.RecordType_RECORD_TYPE_VIRTUAL_DIRECTORY:
			base := outputName(rec)
			path := filepath.Join(filepath.Join(closure_paths[:depth]...), base)
			if depth < len(closure_paths) {
				closure_paths[depth] = base
			} else {
				closure_paths = append(closure_paths, base)
			}
			return os.Mkdir(path, 0777)
		case pb.RecordType_RECORD_TYPE_VIRTUAL_FILE:
			path := filepath.Join(filepath.Join(closure_paths[:depth]...), outputName(rec))
			f, err := os.Create(path)
			if err != nil {
				return err
			}
			r := s.Contents(id)
			_, err = io.Copy(f, r)
			if err != nil {
				return err
			}
			return f.Close()
		case pb.RecordType_RECORD_TYPE_FILE:
			path := filepath.Join(filepath.Join(closure_paths[:depth]...), outputName(rec))
			return Copy(path, rec.GetPath())
		}
		return nil
	}
}
