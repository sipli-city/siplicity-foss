package siplicity

import (
	"errors"
	"os"
	"path/filepath"

	"github.com/keygen-sh/keygen-go/v3"
	"github.com/pelletier/go-toml/v2"
)

const sipl_conf = "siplicity.toml"
const sipl_license = "siplicity.lic"

var LICENSED bool
var LICENSED_MESSAGE string
var KEYGEN_PUBLIC_KEY = "e440fb92a0a01524da14cde07fb28c54a9a564173513dcc34deee60f81e651e1"

func init() {
	k, c, err := LoadLicense()
	if err != nil {
		LICENSED_MESSAGE = err.Error()
	} else {
		LICENSED, LICENSED_MESSAGE = licenseCheck(k, c)
	}
}

type Config struct {
	Key string
}

func config(path string) Config {
	c := Config{}
	conf, err := os.ReadFile(path)
	if err != nil {
		return c
	}
	toml.Unmarshal(conf, &c)
	return c
}

func PutLicense(key, license string) {
	if key == "" || license == "" {
		k, c, err := LoadLicense()
		if err == nil {
			if key == "" {
				key = k
			}
			if license == "" {
				license = c
			}
		}
	}
	LICENSED, LICENSED_MESSAGE = licenseCheck(key, license)
	if !LICENSED {
		return
	}
	if err := os.MkdirAll(home(), 0666); err != nil {
		return
	}
	c := Config{Key: key}
	byts, err := toml.Marshal(&c)
	if err != nil {
		return
	}
	f, err := os.Create(filepath.Join(home(), sipl_conf))
	if err != nil {
		return
	}
	_, err = f.Write(byts)
	if err != nil {
		return
	}
	f.Close()
	f1, err := os.Create(filepath.Join(home(), sipl_license))
	if err != nil {
		return
	}
	_, err = f1.WriteString(license)
	if err != nil {
		return
	}
	f1.Close()
}

func LoadLicense() (string, string, error) {
	c := config(filepath.Join(home(), sipl_conf))
	if c.Key == "" {
		return "", "", errors.New("no license key")
	}
	cert, err := os.ReadFile(filepath.Join(home(), sipl_license))
	if err != nil {
		return "", "", errors.New("error loading license file")
	}
	return c.Key, string(cert), nil
}

func licenseCheck(key, license string) (bool, string) {
	keygen.PublicKey = KEYGEN_PUBLIC_KEY
	// Verify the license file's signature
	lic := &keygen.LicenseFile{Certificate: license}
	err := lic.Verify()
	switch {
	case err == keygen.ErrLicenseFileNotGenuine:
		return false, "not a genuine license"
	case err != nil:
		return false, err.Error()
	}
	// Use the license key to decrypt the license file
	dataset, err := lic.Decrypt(key)
	switch {
	case err == keygen.ErrSystemClockUnsynced:
		return false, "system clock tampering detected!"
	case err == keygen.ErrLicenseFileExpired:
		return false, "license file is expired"
	case err == nil:
		return true, dataset.License.Name
	}
	return false, err.Error()
}
