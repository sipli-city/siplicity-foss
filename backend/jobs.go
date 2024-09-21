package siplicity

import (
	"crypto/sha256"
	"fmt"

	"github.com/richardlehane/siegfried/pkg/static"
)

func Job(action string, filter string, store Store) error {
	var act Action
	switch action {
	case "bagit":
		Bagit(filter, store)
		return nil
	case "siegfried":
		act = &siegfriedAction{sf: static.New()}
	case "sha256":
		act = &hashAction{sha256.New()}
	default:
		return fmt.Errorf("invalid action %s", action)
	}
	for _, id := range store.Ids(filter) {
		if err := act.Do(store.Get(id)); err != nil {
			return err
		}
	}
	return nil
}
