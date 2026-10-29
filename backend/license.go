package siplicity

import (
	"os"
	"path/filepath"

	"github.com/keygen-sh/keygen-go/v3"
)

func licenseCheck() (bool, string) {
	keygen.PublicKey = "YOUR_KEYGEN_PUBLIC_KEY"

	cert, err := os.ReadFile(filepath.Join(home(), "siplicity.lic"))
	if err != nil {
		return false, "No license file"
	}

	// Verify the license file's signature
	lic := &keygen.LicenseFile{Certificate: string(cert)}
	err = lic.Verify()
	switch {
	case err == keygen.ErrLicenseFileNotGenuine:
		return false, "Not a genuine license"
	case err != nil:
		return false, "Cannot verify license"
	}

	// Use the license key to decrypt the license file
	dataset, err := lic.Decrypt("A_KEYGEN_LICENSE_KEY")
	switch {
	case err == keygen.ErrSystemClockUnsynced:
		return false, "System clock tampering detected!"
	case err == keygen.ErrLicenseFileExpired:
		return false, "License file is expired"
	case err != nil:
		return false, "Unable to decrpty license file"
	}

	return true, dataset.License.Name
}
