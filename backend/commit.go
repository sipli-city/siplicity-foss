package siplicity

import (
	"errors"
	"os"
	"path/filepath"

	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

func commit(dir string, rec *pb.GetRecordResponse) (string, error) {
	switch rec.Typ {
	case pb.RecordType_RECORD_TYPE_ROOT:
		path := getFieldValue(rec.GetMetadata(), makePath([][2]string{{"siplicity", "output_location"}}, nil))
		if path == "" {
			return "", errors.New("output path not set")
		}
		return path, os.MkdirAll(path, 0777)
	case pb.RecordType_RECORD_TYPE_DIRECTORY, pb.RecordType_RECORD_TYPE_VIRTUAL_DIRECTORY:
		path := filepath.Join(dir, filepath.Base(rec.GetPath()))
		return path, os.Mkdir(path, 0777)
	case pb.RecordType_RECORD_TYPE_VIRTUAL_FILE:
		path := filepath.Join(dir, filepath.Base(rec.GetPath()))
		f, err := os.Create(path)
		if err != nil {
			return path, err
		}
		f.WriteString("to do!")
		return path, f.Close()
	case pb.RecordType_RECORD_TYPE_FILE:
		path := filepath.Join(dir, filepath.Base(rec.GetPath()))
		return path, Copy(path, rec.GetPath())
	}
	return "", nil
}
