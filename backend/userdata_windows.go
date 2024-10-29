package siplicity

import (
	"os"
	"path/filepath"

	"golang.org/x/sys/windows"
)

func userDataDir(home string) string {
	path, _ := windows.KnownFolderPath(windows.FOLDERID_LocalAppData, windows.KF_FLAG_DEFAULT|windows.KF_FLAG_DONT_VERIFY)
	if path == "" {
		path, _ = windows.KnownFolderPath(windows.FOLDERID_LocalAppData, windows.KF_FLAG_DEFAULT_PATH|windows.KF_FLAG_DONT_VERIFY)
	}
	if path == "" {
		dataDir, found := os.LookupEnv("LOCALAPPDATA")
		if found && dataDir != "" {
			path = dataDir
		} else {
			path = filepath.Join("AppData", "Local")
		}
	}
	return xdgPath(home, path)
}
