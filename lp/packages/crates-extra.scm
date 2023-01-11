(define module (lp packages crates-extra)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:))

(define-public rust-serial-test-derive-0.3
  (package
    (name "rust-serial-test-derive")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "serial_test_derive" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0h07fl8mij36n6h8gvfj1l5ncchhqajdfs615649j05pr1wq861w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/palfrey/serial_test/")
    (synopsis "Helper crate for serial_test")
    (description "Helper crate for serial_test")
    (license license:expat)))

(define-public rust-serial-test-0.3
  (package
    (name "rust-serial-test")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "serial_test" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0k0isw90nap3avqn8jq6gqaz12kgj1663ppgvrrhr0spcpqn4j7p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.9)
                       ("rust-serial-test-derive" ,rust-serial-test-derive-0.3))))
    (home-page "https://github.com/palfrey/serial_test/")
    (synopsis "Allows for the creation of serialised Rust tests")
    (description "Allows for the creation of serialised Rust tests")
    (license license:expat)))

(define-public rust-escargot-0.4
  (package
    (name "rust-escargot")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "escargot" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "15s5x2z3i5ygwy7wkj955cjqh6dp4afp7ig4nlld1mblk2zsvfff"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1))))
    (home-page "https://github.com/crate-ci/escargot")
    (synopsis "Cargo API written in Paris")
    (description "Cargo API written in Paris")
    (license (list license:expat license:asl2.0))))

(define-public rust-assert-cmd-0.11
  (package
    (name "rust-assert-cmd")
    (version "0.11.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "assert_cmd" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "07jsda2nbb3yh7plj3dbybyk51ckckgv7xmnk6bw6bnq7dwpgi1d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-escargot" ,rust-escargot-0.4)
                       ("rust-predicates" ,rust-predicates-1)
                       ("rust-predicates-core" ,rust-predicates-core-1)
                       ("rust-predicates-tree" ,rust-predicates-tree-1))))
    (home-page "https://github.com/assert-rs/assert_cmd")
    (synopsis "Test CLI Applications.")
    (description "Test CLI Applications.")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-ignored-0.0.4
  (package
    (name "rust-serde-ignored")
    (version "0.0.4")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "serde_ignored" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0hmi3z05scaadrrh98qnl1qv1qy70sh962bf7gk6pdgdvijrf3hr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/dtolnay/serde-ignored")
    (synopsis "Find out about keys that are ignored when deserializing data")
    (description
     "Find out about keys that are ignored when deserializing data")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-urlencoded-0.5
  (package
    (name "rust-serde-urlencoded")
    (version "0.5.5")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "serde_urlencoded" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0nhnzllx5xrij4x17g351n14md691r95mxr7sbpz4sl80n8xcbb4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-dtoa" ,rust-dtoa-0.4)
                       ("rust-itoa" ,rust-itoa-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-url" ,rust-url-1))))
    (home-page "https://github.com/nox/serde_urlencoded")
    (synopsis "`x-www-form-urlencoded` meets Serde")
    (description "`x-www-form-urlencoded` meets Serde")
    (license (list license:expat license:asl2.0))))

(define-public rust-hyper-tls-0.3
  (package
    (name "rust-hyper-tls")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "hyper-tls" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0kqp4sz8613j6nv375wfj3gh95ff4nb6a3rb1f2vbx0almm0v01s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-0.4)
                       ("rust-futures" ,rust-futures-0.1)
                       ("rust-hyper" ,rust-hyper-0.12)
                       ("rust-native-tls" ,rust-native-tls-0.2)
                       ("rust-tokio-io" ,rust-tokio-io-0.1))))
    (home-page "https://hyper.rs")
    (synopsis "Default TLS implementation for use with hyper")
    (description "Default TLS implementation for use with hyper")
    (license (list license:expat license:asl2.0))))

(define-public rust-hyper-old-types-0.11
  (package
    (name "rust-hyper-old-types")
    (version "0.11.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "hyper-old-types" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1i69sks0bwamzqdbx8ffgkssxffv6crdmwjgl47nr5pkxi8vx5k8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-base64" ,rust-base64-0.9)
                       ("rust-bytes" ,rust-bytes-0.4)
                       ("rust-http" ,rust-http-0.1)
                       ("rust-httparse" ,rust-httparse-1)
                       ("rust-language-tags" ,rust-language-tags-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-percent-encoding" ,rust-percent-encoding-1)
                       ("rust-time" ,rust-time-0.1)
                       ("rust-unicase" ,rust-unicase-2))))
    (home-page "https://hyper.rs")
    (synopsis "HTTP types from hyper 0.11.x")
    (description "HTTP types from hyper 0.11.x")
    (license license:expat)))

(define-public rust-try-from-0.3
  (package
    (name "rust-try-from")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "try_from" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "12wdd4ja7047sd3rx70hv2056hyc8gcdllcx3a41g1rnw64kng98"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-0.1))))
    (home-page "https://github.com/derekjw/try_from")
    (synopsis
     "TryFrom and TryInto traits for failable conversions that return a Result.")
    (description
     "TryFrom and TryInto traits for failable conversions that return a Result.")
    (license license:expat)))

(define-public rust-cookie-store-0.7
  (package
    (name "rust-cookie-store")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "cookie_store" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "174i9k9g62pfx7y1nqynywdpjplkl3j4hi3ck6bz2r996qzhnxa6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cookie" ,rust-cookie-0.12)
                       ("rust-failure" ,rust-failure-0.1)
                       ("rust-idna" ,rust-idna-0.1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-publicsuffix" ,rust-publicsuffix-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-time" ,rust-time-0.1)
                       ("rust-try-from" ,rust-try-from-0.3)
                       ("rust-url" ,rust-url-1))))
    (home-page "https://github.com/pfernie/cookie_store")
    (synopsis "Implementation of Cookie storage and retrieval")
    (description "Implementation of Cookie storage and retrieval")
    (license (list license:expat license:asl2.0))))

(define-public rust-reqwest-0.9
  (package
    (name "rust-reqwest")
    (version "0.9.24")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "reqwest" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1aql4wpmf1cfl09xddlxnmd7y1nj7fcbzmsh9603qd61lfp471pq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-base64" ,rust-base64-0.10)
                       ("rust-bytes" ,rust-bytes-0.4)
                       ("rust-cookie" ,rust-cookie-0.12)
                       ("rust-cookie-store" ,rust-cookie-store-0.7)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-futures" ,rust-futures-0.1)
                       ("rust-http" ,rust-http-0.1)
                       ("rust-hyper" ,rust-hyper-0.12)
                       ("rust-hyper-old-types" ,rust-hyper-old-types-0.11)
                       ("rust-hyper-rustls" ,rust-hyper-rustls-0.17)
                       ("rust-hyper-tls" ,rust-hyper-tls-0.3)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-mime-guess" ,rust-mime-guess-2)
                       ("rust-native-tls" ,rust-native-tls-0.2)
                       ("rust-rustls" ,rust-rustls-0.16)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-serde-urlencoded" ,rust-serde-urlencoded-0.5)
                       ("rust-socks" ,rust-socks-0.3)
                       ("rust-time" ,rust-time-0.1)
                       ("rust-tokio" ,rust-tokio-0.1)
                       ("rust-tokio-executor" ,rust-tokio-executor-0.1)
                       ("rust-tokio-io" ,rust-tokio-io-0.1)
                       ("rust-tokio-rustls" ,rust-tokio-rustls-0.10)
                       ("rust-tokio-threadpool" ,rust-tokio-threadpool-0.1)
                       ("rust-tokio-timer" ,rust-tokio-timer-0.2)
                       ("rust-trust-dns-resolver" ,rust-trust-dns-resolver-0.11)
                       ("rust-url" ,rust-url-1)
                       ("rust-uuid" ,rust-uuid-0.7)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.17)
                       ("rust-winreg" ,rust-winreg-0.6))))
    (home-page "https://github.com/seanmonstar/reqwest")
    (synopsis "higher level HTTP client library")
    (description "higher level HTTP client library")
    (license (list license:expat license:asl2.0))))

(define-public rust-parking-lot-core-0.3
  (package
    (name "rust-parking-lot-core")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "parking_lot_core" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "130by1bszx1iaav33sz3i6lzfx01c9dsb1ybzpvdz7n7pmp7wzxd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-petgraph" ,rust-petgraph-0.4)
                       ("rust-rand" ,rust-rand-0.5)
                       ("rust-rustc-version" ,rust-rustc-version-0.2)
                       ("rust-smallvec" ,rust-smallvec-0.6)
                       ("rust-thread-id" ,rust-thread-id-3)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/Amanieu/parking_lot")
    (synopsis
     "An advanced API for creating custom synchronization primitives.")
    (description
     "An advanced API for creating custom synchronization primitives.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-parking-lot-0.6
  (package
    (name "rust-parking-lot")
    (version "0.6.4")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "parking_lot" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1rfd4h24kvvxhjzaz53ycqqwql9y65wpxp2nlwdjjfq017zjp07h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-lock-api" ,rust-lock-api-0.1)
                       ("rust-parking-lot-core" ,rust-parking-lot-core-0.3))))
    (home-page "https://github.com/Amanieu/parking_lot")
    (synopsis
     "More compact and efficient implementations of the standard synchronization primitives.")
    (description
     "More compact and efficient implementations of the standard synchronization
primitives.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-os-type-2
  (package
    (name "rust-os-type")
    (version "2.6.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "os_type" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "19bv5jq9z04bw3kf9qdxw76yngjy9g5dmxnqdr8nf0d3xv048kg2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-regex" ,rust-regex-1))))
    (home-page "https://github.com/schultyy/os_type")
    (synopsis "Detect the operating system type")
    (description "Detect the operating system type")
    (license license:expat)))

(define-public rust-human-panic-1
  (package
    (name "rust-human-panic")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "human-panic" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0djfad84iwl86kabj8rqfhv5nn1qi1fd9hb7z72xgjxb02jmgwrr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-os-type" ,rust-os-type-2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-termcolor" ,rust-termcolor-1)
                       ("rust-toml" ,rust-toml-0.5)
                       ("rust-uuid" ,rust-uuid-0.8))))
    (home-page "https://github.com/yoshuawuyts/human-panic")
    (synopsis "Panic messages for humans")
    (description "Panic messages for humans")
    (license (list license:expat license:asl2.0))))

(define-public rust-tempfile-2
  (package
    (name "rust-tempfile")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "tempfile" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1q61byf232rra0vqxp4qp10wwwqsqqd45qjj80ql5f34vgljzkhi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-kernel32-sys" ,rust-kernel32-sys-0.2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-rand" ,rust-rand-0.3)
                       ("rust-redox-syscall" ,rust-redox-syscall-0.1)
                       ("rust-winapi" ,rust-winapi-0.2))))
    (home-page "http://stebalien.com/projects/tempfile-rs")
    (synopsis "A library for managing temporary files and directories.")
    (description
     "This package provides a library for managing temporary files and directories.")
    (license (list license:expat license:asl2.0))))

(define-public rust-dialoguer-0.3
  (package
    (name "rust-dialoguer")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "dialoguer" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1a9gqvqp83gg4jbm286q5ab3l44zyyzlsdaiqmw8x4k80fdc5l8s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-console" ,rust-console-0.15)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-tempfile" ,rust-tempfile-2))))
    (home-page "https://github.com/mitsuhiko/dialoguer")
    (synopsis "A command line prompting library.")
    (description "This package provides a command line prompting library.")
    (license license:expat)))

(define-public rust-clicolors-control-0.2
  (package
    (name "rust-clicolors-control")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "clicolors-control" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1lfmk9sfw55cy15qvgsldzd67lwbz5d31k88758f4g08pk4xx10z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-kernel32-sys" ,rust-kernel32-sys-0.2)
                       ("rust-lazy-static" ,rust-lazy-static-0.2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/mitsuhiko/clicolors-control")
    (synopsis "A common utility library to control CLI colorization")
    (description
     "This package provides a common utility library to control CLI colorization")
    (license license:expat)))

(define-public rust-console-0.6
  (package
    (name "rust-console")
    (version "0.6.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "console" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1rhkrdplqhdadn7d0yyfbv4d7h1wqjsc6nz196drfcv72ggqmm7c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-atty" ,rust-atty-0.2)
                       ("rust-clicolors-control" ,rust-clicolors-control-0.2)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-termios" ,rust-termios-0.3)
                       ("rust-unicode-width" ,rust-unicode-width-0.1)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/console-rs/console")
    (synopsis "A terminal and console abstraction for Rust")
    (description
     "This package provides a terminal and console abstraction for Rust")
    (license license:expat)))

(define-public rust-cargo-metadata-0.8
  (package
    (name "rust-cargo-metadata")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "cargo_metadata" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "09n4fp9hrg0z84y5q0q98rlinh0832zls3q0s0ip4dbxzlqkf2vh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-semver" ,rust-semver-0.9)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-serde-json" ,rust-serde-json-1))))
    (home-page "https://github.com/oli-obk/cargo_metadata")
    (synopsis "structured access to the output of `cargo metadata`")
    (description "structured access to the output of `cargo metadata`")
    (license license:expat)))

(define-public rust-is-executable-0.1
  (package
    (name "rust-is-executable")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "is_executable" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0xy516afjh79a0d53j9v4w5mgi2s0r6f6qynnyz8g0dwi8xmab9h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/fitzgen/is_executable")
    (synopsis "Is there an executable file at the given path?")
    (description "Is there an executable file at the given path?")
    (license (list license:asl2.0 license:expat))))

(define-public rust-binary-install-0.0.2
  (package
    (name "rust-binary-install")
    (version "0.0.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "binary-install" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1m2czm8wa8pnxh3q3mj3zm9cppa2kyvxlg9h1c6simhdqpwcanvv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-curl" ,rust-curl-0.4)
                       ("rust-dirs" ,rust-dirs-1)
                       ("rust-failure" ,rust-failure-0.1)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-hex" ,rust-hex-0.3)
                       ("rust-is-executable" ,rust-is-executable-0.1)
                       ("rust-siphasher" ,rust-siphasher-0.2)
                       ("rust-tar" ,rust-tar-0.4)
                       ("rust-zip" ,rust-zip-0.5))))
    (home-page "https://github.com/rustwasm/binary-install")
    (synopsis "Install a binary from a path to a global cache")
    (description "Install a binary from a path to a global cache")
    (license (list license:expat license:asl2.0))))
