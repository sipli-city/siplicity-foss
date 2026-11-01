package siplicity

import (
	"fmt"
	"syscall"
	"unsafe"
)

var copyfileW = syscall.NewLazyDLL("kernel32.dll").NewProc("CopyFileW")

func Copy(dest, source string) error {
	var overwrite uint32
	destName, err := syscall.UTF16PtrFromString(dest)
	if err != nil {
		return fmt.Errorf("error creating destination name %s, got %s", dest, err.Error())
	}
	sourceNm, err := syscall.UTF16PtrFromString(source)
	if err != nil {
		return fmt.Errorf("error creating source name %s, got %s", source, err.Error())
	}
	r1, _, err := syscall.SyscallN(
		copyfileW.Addr(),
		uintptr(unsafe.Pointer(sourceNm)),
		uintptr(unsafe.Pointer(destName)),
		uintptr(overwrite))
	if r1 == 0 {
		return fmt.Errorf("error executing copy from %s to %s, got %s", source, dest, err.Error())
	}
	return nil
}
