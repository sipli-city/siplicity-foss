//go:build (aix || dragonfly || freebsd || nacl || linux || netbsd || openbsd || solaris) && !brew

package siplicity

func userDataDir(home string) string {
	return xdgPath(home, ".local/share")
}
