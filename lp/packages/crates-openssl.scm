(define-module (lp packages crates-openssl)
  #:use-module (gnu packages crates-io)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:))

(define-public rust-openssl-sys-0.9.103
  (package
    (name "rust-openssl-sys")
    (version "0.9.103")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "openssl-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1mi9r5vbgqqwfa2nqlh2m0r1v5abhzjigfbi7ja0mx0xx7p8v7kz"))
       (snippet
        #~(begin
            (use-modules (guix build utils))
            ;; Remove dependency on boringssl and vendor openssl source.
            (substitute* "Cargo.toml.orig"
              ;; (("vendored = .*") "vendored = []\n")
              ((".*bssl.*") "")
              ;; ((".*openssl-src.*") "")
              ;; Allow any version of bindgen.
              (("(bindgen = \\{ version =) \".*\"," _ bindgen)
               (string-append bindgen "\"*\",")))
            ;; (substitute* "build/main.rs"
            ;;   ((".*openssl_src.*") ""))
            (copy-file "Cargo.toml.orig" "Cargo.toml")))
       ;; (snippet #~(begin (display "test")))
       ;; (patches (search-patches "lolidk"))
       ))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bindgen" ,rust-bindgen-0.69)
                       ("rust-cc" ,rust-cc-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-pkg-config" ,rust-pkg-config-0.3)
                       ("rust-openssl-src" ,rust-openssl-src-300)
                       ("rust-vcpkg" ,rust-vcpkg-0.2))))
    (native-inputs
     (list pkg-config))
    (propagated-inputs
     (list openssl perl))
    (home-page "https://github.com/sfackler/rust-openssl")
    (synopsis "FFI bindings to OpenSSL")
    (description "This package provides FFI bindings to @code{OpenSSL}.")
    (license license:expat)))

(define-public rust-openssl-src-300
  (package
    (name "rust-openssl-src")
    (version "300.2.0+3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "openssl-src" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jlzhp1hddy17j93260iikcz74hhzv0xcwyd5d6dck4c30fyvsxi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-cc" ,rust-cc-1))))
    (native-inputs
     (list gcc-toolchain))
    (inputs
     (list openssl))
    (home-page "https://github.com/alexcrichton/openssl-src-rs")
    (synopsis "Source of OpenSSL and logic to build it.")
    (description
     "This package provides Source of @code{OpenSSL} and logic to build it.")
    (license (list license:expat license:asl2.0))))

