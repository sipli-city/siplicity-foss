//go:build !windows

package siplicity

import (
	"io"
	"os"
	"time"
)

var buf [4096]byte

func Copy(dest, source string) error {
	src, err := os.Open(source)
	if err != nil {
		return err
	}
	info, err := src.Stat()
	if err != nil {
		return err
	}
	defer src.Close()
	de, err := os.Create(dest)
	if err != nil {
		return err
	}
	defer de.Close()
	_, err = io.CopyBuffer(de, src, buf[:])
	if err != nil {
		return err
	}
	if err := os.Chtimes(dest, time.Time{}, info.ModTime()); err != nil {
		return err
	}
	return nil

}
