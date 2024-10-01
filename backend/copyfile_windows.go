package siplicity

import (
	"syscall"
	"unsafe"
)

var copyfileW = syscall.NewLazyDLL("kernel32.dll").NewProc("CopyFileW")

func Copy(dest, source string) error {
	var overwrite uint32
	destName, err := syscall.UTF16PtrFromString(dest)
	if err != nil {
		return err
	}
	sourceNm, err := syscall.UTF16PtrFromString(source)
	if err != nil {
		return err
	}
	r1, _, err := syscall.SyscallN(
		copyfileW.Addr(),
		uintptr(unsafe.Pointer(sourceNm)),
		uintptr(unsafe.Pointer(destName)),
		uintptr(overwrite))
	if r1 == 0 {
		return err
	}
	return nil
}
