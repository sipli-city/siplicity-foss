package siplicity

import (
	"path/filepath"
)

func userDataDir(home string) string {
	return xdgPath(home, filepath.Join("Library", "Application Support"))
}
