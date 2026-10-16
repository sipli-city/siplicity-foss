package siplicity

import (
	"errors"
	"os"
	"path/filepath"

	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

func commit() walkFunc {
	closure_paths := make([]string, 1, 5)

	return func(rec *pb.GetRecordResponse, depth int) error {
		switch rec.Typ {
		case pb.RecordType_RECORD_TYPE_ROOT:
			paths := getFieldValues(rec.GetMetadata(), makePath([][2]string{{"siplicity", "output_location"}}, nil))
			if len(paths) == 0 {
				return errors.New("output path not set")
			}
			closure_paths[depth] = paths[0] // only need the first value
			return os.MkdirAll(paths[0], 0777)
		case pb.RecordType_RECORD_TYPE_DIRECTORY, pb.RecordType_RECORD_TYPE_VIRTUAL_DIRECTORY:
			base := filepath.Base(rec.GetPath())
			path := filepath.Join(filepath.Join(closure_paths[:depth]...), base)
			if depth < len(closure_paths) {
				closure_paths[depth] = base
			} else {
				closure_paths = append(closure_paths, base)
			}
			return os.Mkdir(path, 0777)
		case pb.RecordType_RECORD_TYPE_VIRTUAL_FILE:
			path := filepath.Join(filepath.Join(closure_paths[:depth]...), filepath.Base(rec.GetPath()))
			f, err := os.Create(path)
			if err != nil {
				return err
			}
			f.WriteString("to do!")
			return f.Close()
		case pb.RecordType_RECORD_TYPE_FILE:
			path := filepath.Join(filepath.Join(closure_paths[:depth]...), filepath.Base(rec.GetPath()))
			return Copy(path, rec.GetPath())
		}
		return nil
	}
}
