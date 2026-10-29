package siplicity

import (
	"os"
	"path/filepath"
	"strings"
)

func home() string {
	// users can override the default home location with the SIPLICITY_HOME env var
	if siplicity_home, ok := os.LookupEnv("SIPLICITY_HOME"); ok {
		return siplicity_home
	}
	user_home, _ := os.UserHomeDir()
	// XDG-aware OS-specific application data directory is the default, return it first if it exists
	xdg_home := filepath.Join(userDataDir(user_home), "siplicity")
	if _, err := os.Stat(xdg_home); err == nil {
		return xdg_home
	}
	// check if XDG_DATA_DIRS exist
	if data_dir, found := xdgDataDirs(user_home); found {
		return data_dir
	}
	// if no directories exist, xdg_home is the default
	return xdg_home
}

func xdgPath(home string, defaultPath string) string {
	dataHome, found := os.LookupEnv("XDG_DATA_HOME")
	if found && dataHome != "" {
		if strings.HasPrefix(dataHome, "~") {
			dataHome = filepath.Join(home, strings.TrimPrefix(dataHome, "~"))
		}
		// environment variable might contain variables like $HOME itself, let's expand
		dataHome = os.ExpandEnv(dataHome)
	}
	// XDG Base Directory Specification demands relative paths to be ignored, fall back to default in that case
	if filepath.IsAbs(dataHome) {
		return dataHome
	} else if filepath.IsAbs(defaultPath) {
		return defaultPath
	} else {
		return filepath.Join(home, defaultPath)
	}
}

func xdgDataDirs(home string) (string, bool) {
	data_dirs, found := os.LookupEnv("XDG_DATA_DIRS")
	if found && data_dirs != "" {
		for _, dir := range strings.Split(data_dirs, ":") {
			if strings.HasPrefix(dir, "~") {
				dir = filepath.Join(home, strings.TrimPrefix(dir, "~"))
			}
			// environment variable might contain variables like $HOME itself, let's expand
			dir = os.ExpandEnv(dir)
			data_dir := filepath.Join(dir, "siplicity")
			if _, err := os.Stat(data_dir); err == nil {
				return data_dir, true
			}
		}
		return "", false
	}
	//if XDG_DATA_DIRS unset or empty, try defaults /usr/local/share/ and /usr/share/
	if _, err := os.Stat(filepath.Join("/usr/local/share", "siplicity")); err == nil {
		return filepath.Join("/usr/local/share", "siplicity"), true
	}
	if _, err := os.Stat(filepath.Join("/usr/share", "siplicity")); err == nil {
		return filepath.Join("/usr/share", "siplicity"), true
	}
	return "", false
}
