package siplicity

import (
	"crypto/md5"
	"crypto/sha1"
	"crypto/sha256"
	"crypto/sha512"
	"fmt"
	"hash/crc32"

	"github.com/cespare/xxhash"
	"github.com/gofrs/uuid/v5"
	"github.com/richardlehane/siegfried/pkg/static"
	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
	"golang.org/x/crypto/blake2b"
)

func Job(action string, filter string, store Store) error {
	var act Action
	switch action {
	case "commit":
		store.Walk(pb.GraphType_GRAPH_TYPE_OUTPUT, commit)
		store.Purge(pb.GraphType_GRAPH_TYPE_OUTPUT)
		return nil
	case "bagit":
		Bagit(filter, store)
		return nil
	case "uuid4":
		gen := uuid.NewGen()
		act = &uuidAction{gen: gen, version: "v4", fn: gen.NewV4}
	case "uuid6":
		gen := uuid.NewGen()
		act = &uuidAction{gen: gen, version: "v6", fn: gen.NewV6}
	case "uuid7":
		gen := uuid.NewGen()
		act = &uuidAction{gen: gen, version: "v7", fn: gen.NewV7}
	case "siegfried":
		act = &siegfriedAction{sf: static.New()}
	case "sha512":
		act = &hashAction{label: "SHA512", Hash: sha512.New()}
	case "sha256":
		act = &hashAction{label: "SHA256", Hash: sha256.New()}
	case "sha1":
		act = &hashAction{label: "SHA1", Hash: sha1.New()}
	case "md5":
		act = &hashAction{label: "MD5", Hash: md5.New()}
	case "crc":
		act = &hashAction{label: "CRC", Hash: crc32.NewIEEE()}
	case "blake512":
		h, _ := blake2b.New512(nil)
		act = &hashAction{label: "blake2b-512", Hash: h}
	case "blake256":
		h, _ := blake2b.New256(nil)
		act = &hashAction{label: "blake2b-256", Hash: h}
	case "xx64":
		act = &hashAction{label: "XXH64", Hash: xxhash.New()}
	default:
		return fmt.Errorf("invalid action %s", action)
	}
	for _, id := range store.Ids(filter) {
		if err := act.Do(store.Get(id), store); err != nil {
			return err
		}
	}
	return nil
}
