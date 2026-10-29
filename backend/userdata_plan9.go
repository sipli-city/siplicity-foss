package siplicity

func userDataDir(home string) string {
	return xdgPath(home, "lib")
}
