(define-module (lp packages rust-wasm)
  #:use-module (lp packages crates-extra)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:))

(define-public wasm-pack
  (package
    (name "wasm-pack")
    (version "0.10.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rustwasm/wasm-pack")
             (commit (string-append "v" version))))
       (file-name
        (git-file-name name version))
       (sha256
        (base32 "1rc92x1w77gvlsz5b31bqy98kk78srxlbx3x11hxi84wzj3lf274"))
       (patches (search-patches "wasm-pack-no-openssl-vendor.patch"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:install-source? #f
       #:cargo-inputs
       (("rust-atty" ,rust-atty-0.2)
        ("rust-binary-install" ,rust-binary-install-0.0.2)
        ("rust-cargo-metadata" ,rust-cargo-metadata-0.8)
        ("rust-chrono" ,rust-chrono-0.4)
        ("rust-console" ,rust-console-0.6)
        ("rust-curl" ,rust-curl-0.4)
        ("rust-dialoguer" ,rust-dialoguer-0.3)
        ("rust-env-logger" ,rust-env-logger-0.5)
        ("rust-failure" ,rust-failure-0.1)
        ("rust-glob" ,rust-glob-0.2)
        ("rust-human-panic" ,rust-human-panic-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-openssl" ,rust-openssl-0.10)
        ("rust-parking-lot" ,rust-parking-lot-0.6)
        ("rust-reqwest" ,rust-reqwest-0.9)
        ("rust-semver" ,rust-semver-0.9)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-derive" ,rust-serde-derive-1)
        ("rust-serde-ignored" ,rust-serde-ignored-0.0.4)
        ("rust-serde-json" ,rust-serde-json-1)
        ("rust-siphasher" ,rust-siphasher-0.2)
        ("rust-strsim" ,rust-strsim-0.8)
        ("rust-structopt" ,rust-structopt-0.3)
        ("rust-toml" ,rust-toml-0.4)
        ("rust-walkdir" ,rust-walkdir-2)
        ("rust-which" ,rust-which-2))
       #:cargo-development-inputs
       (("rust-assert-cmd" ,rust-assert-cmd-0.11)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-predicates" ,rust-predicates-1)
        ("rust-serial-test" ,rust-serial-test-0.3)
        ("rust-tempfile" ,rust-tempfile-3))))
    (inputs
     (list zlib openssl curl))
    (native-inputs
     (list pkg-config))
    (home-page "https://github.com/rustwasm/wasm-pack")
    (synopsis "ð¦â¨ Your favorite rust -> wasm workflow tool!")
    (description "ð¦â¨ Your favorite rust -> wasm workflow tool!")
    (license (list license:expat license:asl2.0))))

