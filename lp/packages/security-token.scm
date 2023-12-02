(package
  (name "yubikey-manager")
  (version "5.2.1")
  (source
   (origin
     (method url-fetch)
     (uri (pypi-uri "yubikey_manager" version))
     (sha256
      (base32 "1qg4zgrkliikwn2zh25id4wjnc9xwg07s9ik9i1x4ks7mj1smi9m"))))
  (build-system pyproject-build-system)
  (propagated-inputs (list python-click
                           python-cryptography
                           python-fido2
                           python-keyring
                           python-pyscard
                           python-pywin32))
  (home-page "https://github.com/Yubico/yubikey-manager")
  (synopsis "Tool for managing your YubiKey configuration.")
  (description "Tool for managing your @code{YubiKey} configuration.")
  (license license:bsd-3))
