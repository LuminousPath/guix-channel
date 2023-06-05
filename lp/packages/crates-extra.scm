(define-module (lp packages crates-extra)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:))

(define-public rust-serial-test-derive-0.3
  (package
    (inherit rust-serial-test-derive-0.6)
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
    (inherit rust-serial-test-0.6)
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
    (inherit rust-escargot-0.5)
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
    (inherit rust-assert-cmd-2)
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
    (inherit rust-serde-ignored-0.1)
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
    (inherit rust-serde-urlencoded-0.7)
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
    (inherit rust-hyper-tls-0.5)
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
    (inherit rust-cookie-store-0.15)
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
    (inherit rust-reqwest-0.11)
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
    (inherit rust-parking-lot-core-0.9)
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
    (inherit rust-parking-lot-0.12)
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
    (inherit rust-tempfile-3)
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
    (inherit rust-clicolors-control-1)
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
    (inherit rust-console-0.15)
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
    (inherit rust-cargo-metadata-0.15)
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
    (inherit rust-is-executable-1)
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

(define-public rust-vte-0.10.1
  (package
    (inherit rust-vte-0.10)
    (name "rust-vte")
    (version "0.10.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "vte" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "10srmy9ssircrwsb5lpx3fbhx71460j77kvz0krz38jcmf9fdg3c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayvec" ,rust-arrayvec-0.5)
                       ("rust-utf8parse" ,rust-utf8parse-0.2)
                       ("rust-vte-generate-state-changes" ,rust-vte-generate-state-changes-0.1))))
    (home-page "https://github.com/alacritty/vte")
    (synopsis "Parser for implementing terminal emulators")
    (description "Parser for implementing terminal emulators")
    (license (list license:asl2.0 license:expat))))

(define-public rust-unicode-segmentation-1.10
  (package
    (inherit rust-unicode-segmentation-1)
    (name "rust-unicode-segmentation")
    (version "1.10.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "unicode-segmentation" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0nks0izrlfrc26hkbs3v3rdjk7lkrflffv2ajhgf0gbql19g1nqg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/unicode-rs/unicode-segmentation")
    (synopsis
     "This crate provides Grapheme Cluster, Word and Sentence boundaries
according to Unicode Standard Annex #29 rules.
")
    (description
     "This crate provides Grapheme Cluster, Word and Sentence boundaries according to
Unicode Standard Annex #29 rules.")
    (license (list license:expat license:asl2.0))))

(define-public rust-sysinfo-0.24
  (package
    (inherit rust-sysinfo-0.15)
    (name "rust-sysinfo")
    (version "0.24.7")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "sysinfo" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "07004ylrpf0bvcwprxp4231bvzg2i7lrbp79wscqnc297nzlxjsl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-core-foundation-sys" ,rust-core-foundation-sys-0.8)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-ntapi" ,rust-ntapi-0.3)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/GuillaumeGomez/sysinfo")
    (synopsis
     "Library to get system information such as processes, CPUs, disks, components and networks")
    (description
     "Library to get system information such as processes, CPUs, disks, components and
networks")
    (license license:expat)))

(define-public rust-proc-macro2-1.0.43
  (package
    (inherit rust-proc-macro2-1)
    (name "rust-proc-macro2")
    (version "1.0.49")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "proc-macro2" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "19b3xdfmnay9mchza82lhb3n8qjrfzkxwd23f50xxzy4z6lyra2p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-unicode-ident" ,rust-unicode-ident-1))))
    (home-page "https://github.com/dtolnay/proc-macro2")
    (synopsis
     "A substitute implementation of the compiler's `proc_macro` API to decouple token-based libraries from the procedural macro use case.")
    (description
     "This package provides a substitute implementation of the compiler's `proc_macro`
API to decouple token-based libraries from the procedural macro use case.")
    (license (list license:expat license:asl2.0))))

(define-public rust-syn-1.0.107
  (package
    (inherit rust-syn-1)
    (name "rust-syn")
    (version "1.0.107")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "syn" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1xg3315vx8civ8y0l5zxq5mkx07qskaqwnjak18aw0vfn6sn8h0z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1.0.43)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-unicode-ident" ,rust-unicode-ident-1))))
    (home-page "https://github.com/dtolnay/syn")
    (synopsis "Parser for Rust source code")
    (description "Parser for Rust source code")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-derive-1.0.152
  (package
    (inherit rust-serde-derive-1)
    (name "rust-serde-derive")
    (version "1.0.152")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "serde_derive" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "07jlbk3khspawlqayr5lhzgqirv031ap4p8asw199l7ciq8psj5g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1.0.107))))
    (home-page "https://serde.rs")
    (synopsis "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]")
    (description
     "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-1.0.152
  (package
    (inherit rust-serde-1)
    (name "rust-serde")
    (version "1.0.152")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "serde" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1ysykpc4a9f1yn7zikdwhyfs0bpa7mlc8vsm7sl4glr1606iyzdv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde-derive" ,rust-serde-derive-1.0.152))))
    (home-page "https://serde.rs")
    (synopsis "A generic serialization/deserialization framework")
    (description
     "This package provides a generic serialization/deserialization framework")
    (license (list license:expat license:asl2.0))))

(define-public rust-derive-arbitrary-1.2
  (package
    (inherit rust-derive-arbitrary-1)
    (name "rust-derive-arbitrary")
    (version "1.2.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "derive_arbitrary" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0l2k03sw9ia4vvx22ymignz3iwsrkxr04lfscb3vywgmynzhning"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/rust-fuzz/arbitrary")
    (synopsis "Derives arbitrary traits")
    (description "Derives arbitrary traits")
    (license (list license:expat license:asl2.0))))

(define-public rust-arbitrary-1.2
  (package
    (inherit rust-arbitrary-1)
    (name "rust-arbitrary")
    (version "1.2.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "arbitrary" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1rcy97lqnzn8w29a1x6xjh9mq4fiig8z4bxcbx8yyyifz4w4j8mh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-derive-arbitrary" ,rust-derive-arbitrary-1))))
    (home-page "https://github.com/rust-fuzz/arbitrary/")
    (synopsis
     "The trait for generating structured data from unstructured data")
    (description
     "The trait for generating structured data from unstructured data")
    (license (list license:expat license:asl2.0))))

(define-public rust-smol-str-0.1.2
  (package
    (inherit rust-smol-str-0.1)
    (name "rust-smol-str")
    (version "0.1.23")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "smol_str" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0i5b6mm2hbmvyvch3rhfx6bfl9jmijx320ffazhs5qxp52512xbl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/rust-analyzer/smol_str")
    (synopsis "small-string optimized string type with O(1) clone")
    (description "small-string optimized string type with O(1) clone")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-json-1.0.9
  (package
    (inherit rust-serde-json-1)
    (name "rust-serde-json")
    (version "1.0.91")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "serde_json" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "10v8vb4959ayycw1zmqvxxi758djqkskchj6qal0fjbi6daj6z47"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-indexmap" ,rust-indexmap-1)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-ryu" ,rust-ryu-1)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/serde-rs/json")
    (synopsis "A JSON serialization file format")
    (description "This package provides a JSON serialization file format")
    (license (list license:expat license:asl2.0))))

(define-public rust-phf-shared-0.11
  (package
    (inherit rust-phf-shared-0.10)
    (name "rust-phf-shared")
    (version "0.11.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "phf_shared" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0xp6krf3cd411rz9rbk7p6xprlz786a215039j6jlxvbh9pmzyz1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-siphasher" ,rust-siphasher-0.3)
                       ("rust-uncased" ,rust-uncased-0.9)
                       ("rust-unicase" ,rust-unicase-2))))
    (home-page "https://github.com/rust-phf/rust-phf")
    (synopsis "Support code shared by PHF libraries")
    (description "Support code shared by PHF libraries")
    (license license:expat)))

(define-public rust-criterion-0.3.6
  (package
    (inherit rust-criterion-0.3)
    (name "rust-criterion")
    (version "0.3.6")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "criterion" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "13yd64ah93gkbdv7qq4cr6rhgl9979jjcjk3gkhnav1b7glns7dh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-std" ,rust-async-std-1)
                       ("rust-atty" ,rust-atty-0.2)
                       ("rust-cast" ,rust-cast-0.3)
                       ("rust-clap" ,rust-clap-2)
                       ("rust-criterion-plot" ,rust-criterion-plot-0.4)
                       ("rust-csv" ,rust-csv-1)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-oorandom" ,rust-oorandom-11.1)
                       ("rust-plotters" ,rust-plotters-0.3)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-cbor" ,rust-serde-cbor-0.11)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-smol" ,rust-smol-1)
                       ("rust-tinytemplate" ,rust-tinytemplate-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-walkdir" ,rust-walkdir-2))))
    (home-page "https://bheisler.github.io/criterion.rs/book/index.html")
    (synopsis "Statistics-driven micro-benchmarking library")
    (description "Statistics-driven micro-benchmarking library")
    (license (list license:asl2.0 license:expat))))

(define-public rust-phf-generator-0.11
  (package
    (inherit rust-phf-generator-0.10)
    (name "rust-phf-generator")
    (version "0.11.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "phf_generator" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1gsgy5k45y937qnwp58dc05d63lwlfm3imqr1zslb8qgb2a1q65i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-criterion" ,rust-criterion-0.3)
                       ("rust-phf-shared" ,rust-phf-shared-0.11)
                       ("rust-rand" ,rust-rand-0.8))))
    (home-page "https://github.com/rust-phf/rust-phf")
    (synopsis "PHF generation logic")
    (description "PHF generation logic")
    (license license:expat)))

(define-public rust-phf-macros-0.11
  (package
    (inherit rust-phf-macros-0.10)
    (name "rust-phf-macros")
    (version "0.11.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "phf_macros" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0rncvjimjri2vancig85icbk8h03a5s3z4cyasd70s37y72wvalj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-phf-generator" ,rust-phf-generator-0.11)
                       ("rust-phf-shared" ,rust-phf-shared-0.11)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1)
                       ("rust-unicase" ,rust-unicase-2))))
    (home-page "https://github.com/rust-phf/rust-phf")
    (synopsis "Macros to generate types in the phf crate")
    (description "Macros to generate types in the phf crate")
    (license license:expat)))

(define-public rust-phf-0.11
  (package
    (inherit rust-phf-0.10)
    (name "rust-phf")
    (version "0.11.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "phf" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1354fbpb52cp9gs5mlkaygc5qhdx6r07rfv3xy482m4kvqsnb34j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-phf-macros" ,rust-phf-macros-0.11)
                       ("rust-phf-shared" ,rust-phf-shared-0.11)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/rust-phf/rust-phf")
    (synopsis "Runtime support for perfect hash function data structures")
    (description "Runtime support for perfect hash function data structures")
    (license license:expat)))

(define-public rust-find-crate-0.6
  (package
    (name "rust-find-crate")
    (version "0.6.3")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "find-crate" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1ljpkh11gj7940xwz47xjhsvfbl93c2q0ql7l2v0w77amjx8paar"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-toml" ,rust-toml-0.5))))
    (home-page "https://github.com/taiki-e/find-crate")
    (synopsis "Find the crate name from the current Cargo.toml.
")
    (description "Find the crate name from the current Cargo.toml.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-palette-derive-0.6
  (package
    (name "rust-palette-derive")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "palette_derive" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "09z4nd4sbmzqd1pqr48vrdca3v2c03dzr70cmxs7zhp7m13dzvh5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-find-crate" ,rust-find-crate-0.6)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/Ogeon/palette")
    (synopsis "Automatically implement traits from the palette crate.")
    (description "Automatically implement traits from the palette crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-palette-0.6
  (package
    (name "rust-palette")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "palette" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0jay4zbxfnz6hj9f78inb3n3hmaamivnrrapy4ri0n0jf67xd74g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-approx" ,rust-approx-0.5)
                       ("rust-bytemuck" ,rust-bytemuck-1)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-palette-derive" ,rust-palette-derive-0.6)
                       ("rust-phf" ,rust-phf-0.11)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/Ogeon/palette")
    (synopsis
     "Convert and manage colors with a focus on correctness, flexibility and ease of use.")
    (description
     "Convert and manage colors with a focus on correctness, flexibility and ease of
use.")
    (license (list license:expat license:asl2.0))))

(define-public rust-nix-0.26
  (package
    (inherit rust-nix-0.24)
    (name "rust-nix")
    (version "0.26.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "nix" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "155610n6bp37sqg7p0qihzi0jnvqkpqc40nyik89frbc6lfqv9a6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-memoffset" ,rust-memoffset-0.7)
                       ("rust-pin-utils" ,rust-pin-utils-0.1)
                       ("rust-static-assertions" ,rust-static-assertions-1))))
    (home-page "https://github.com/nix-rust/nix")
    (synopsis "Rust friendly bindings to *nix APIs")
    (description "Rust friendly bindings to *nix APIs")
    (license license:expat)))

(define-public rust-ctrlc-3.2
  (package
    (inherit rust-ctrlc-3)
    (name "rust-ctrlc")
    (version "3.2.4")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "ctrlc" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0wfxpdjhmn7qff51wcrirmxgf7sr45pxhzyqm40ja4ar7ipclc8n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-nix" ,rust-nix-0.26)
                       ("rust-windows-sys" ,rust-windows-sys-0.42))))
    (home-page "https://github.com/Detegr/rust-ctrlc")
    (synopsis "Easy Ctrl-C handler for Rust projects")
    (description "Easy Ctrl-C handler for Rust projects")
    (license (list license:expat license:asl2.0))))

(define-public rust-bytelines-2
  (package
    (name "rust-bytelines")
    (version "2.4.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "bytelines" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "17x55pg0k30wjqfk8mqbcjh3x98afbx34rj5l7czqdf547isqkvq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures" ,rust-futures-0.3)
                       ("rust-tokio" ,rust-tokio-1))))
    (home-page "https://github.com/whitfin/bytelines")
    (synopsis "Read input lines as byte slices for high efficiency")
    (description "Read input lines as byte slices for high efficiency")
    (license license:expat)))

(define-public rust-box-drawing-0.1
  (package
    (name "rust-box-drawing")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "box_drawing" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0jx4rrxy4xmgmplmgl398vrng67sfl8qny7n7d91fyw6zpaxh9za"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://gitlab.com/chronos.alfa/box_drawing.git")
    (synopsis
     "A very simple library containing constants for UTF-8 box drawing.")
    (description
     "This package provides a very simple library containing constants for UTF-8 box
drawing.")
    (license license:expat)))

(define-public rust-plist-1.3
  (package
    (inherit rust-plist-1)
    (name "rust-plist")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "plist" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "09bjpl5nr0l13rs6h5zjr8s5rcvbd7pfzvgfqlfssmckvinbqfdx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-base64" ,rust-base64-0.13)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-line-wrap" ,rust-line-wrap-0.1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-time" ,rust-time-0.3)
                       ("rust-xml-rs" ,rust-xml-rs-0.8))))
    (home-page "https://github.com/ebarnard/rust-plist/")
    (synopsis "A rusty plist parser. Supports Serde serialization.")
    (description
     "This package provides a rusty plist parser.  Supports Serde serialization.")
    (license license:expat)))

(define-public rust-syntect-5
  (package
    (inherit rust-syntect-4)
    (name "rust-syntect")
    (version "5.0.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "syntect" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1a3n6mial29jv916wg7y0qlqs26da0yalfl0qy29lzcxgp159i66"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bincode" ,rust-bincode-1)
                       ("rust-bitflags" ,rust-bitflags-1)
                       ("rust-fancy-regex" ,rust-fancy-regex-0.7)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-fnv" ,rust-fnv-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-onig" ,rust-onig-6)
                       ("rust-plist" ,rust-plist-1.3)
                       ("rust-regex-syntax" ,rust-regex-syntax-0.6)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-walkdir" ,rust-walkdir-2)
                       ("rust-yaml-rust" ,rust-yaml-rust-0.4))))
    (home-page "https://github.com/trishume/syntect")
    (synopsis
     "library for high quality syntax highlighting and code intelligence using Sublime Text's grammars")
    (description
     "library for high quality syntax highlighting and code intelligence using Sublime
Text's grammars")
    (license license:expat)))

(define-public rust-shell-words-1.1
  (package
    (inherit rust-shell-words-1)
    (name "rust-shell-words")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "shell-words" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1plgwx8r0h5ismbbp6cp03740wmzgzhip85k5hxqrrkaddkql614"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/tmiasko/shell-words")
    (synopsis "Process command line according to parsing rules of UNIX shell")
    (description
     "Process command line according to parsing rules of UNIX shell")
    (license (list license:expat license:asl2.0))))

(define-public rust-bugreport-0.5
  (package
    (inherit rust-bugreport-0.4)
    (name "rust-bugreport")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "bugreport" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1jcq9ywxyd7fw1ing8ixna0cfcs5lrviyvx6h6080ir532w20lak"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-git-version" ,rust-git-version-0.3)
                       ("rust-shell-escape" ,rust-shell-escape-0.1)
                       ("rust-sys-info" ,rust-sys-info-0.9))))
    (home-page "https://github.com/sharkdp/bugreport")
    (synopsis "Collect system and environment information for bug reports")
    (description "Collect system and environment information for bug reports")
    (license (list license:expat license:asl2.0))))

(define-public rust-bat-0.21
  (package
    (inherit rust-bat-0.18)
    (name "rust-bat")
    (version "0.21.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "bat" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "01b3f1pzmj30ar5xa1a892vv4i9vxsrf099p9dhxgcq013c144px"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ansi-colours" ,rust-ansi-colours-1)
                       ("rust-ansi-term" ,rust-ansi-term-0.12)
                       ("rust-atty" ,rust-atty-0.2)
                       ("rust-bincode" ,rust-bincode-1)
                       ("rust-bugreport" ,rust-bugreport-0.5)
                       ("rust-bytesize" ,rust-bytesize-1)
                       ("rust-clap" ,rust-clap-2)
                       ("rust-clircle" ,rust-clircle-0.3)
                       ("rust-console" ,rust-console-0.15)
                       ("rust-content-inspector" ,rust-content-inspector-0.2)
                       ("rust-dirs-next" ,rust-dirs-next-2)
                       ("rust-encoding" ,rust-encoding-0.2)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-git2" ,rust-git2-0.14)
                       ("rust-globset" ,rust-globset-0.4)
                       ("rust-grep-cli" ,rust-grep-cli-0.1)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-path-abs" ,rust-path-abs-0.5)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-yaml" ,rust-serde-yaml-0.8)
                       ("rust-shell-words" ,rust-shell-words-1)
                       ("rust-syntect" ,rust-syntect-5)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-unicode-width" ,rust-unicode-width-0.1)
                       ("rust-walkdir" ,rust-walkdir-2)
                       ("rust-wild" ,rust-wild-2))))
    (native-inputs
     (list pkg-config))
    (inputs
     (list libgit2 zlib))
    (home-page "https://github.com/sharkdp/bat")
    (synopsis "A cat(1) clone with wings.")
    (description "This package provides a cat(1) clone with wings.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ctrlc-3.2
  (package
    (inherit rust-ctrlc-3)
    (name "rust-ctrlc")
    (version "3.2.4")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "ctrlc" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0wfxpdjhmn7qff51wcrirmxgf7sr45pxhzyqm40ja4ar7ipclc8n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-nix" ,rust-nix-0.26)
                       ("rust-windows-sys" ,rust-windows-sys-0.42))
       #:cargo-development-inputs (("rust-windows-sys" ,rust-windows-sys-0.42))))
    (home-page "https://github.com/Detegr/rust-ctrlc")
    (synopsis "Easy Ctrl-C handler for Rust projects")
    (description "Easy Ctrl-C handler for Rust projects")
    (license (list license:expat license:asl2.0))))

;; This was added specifically to fix the issue in tealdeer: https://issues/guix.gnu.org/57867
;; TODO: remove this when tealdeer is updated/fixed
(define-public rust-reqwest-0.10.10-patched
  (package
    (inherit rust-reqwest-0.11)
    (name "rust-reqwest-patched")
    (version "0.10.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "reqwest" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0z7l46m1mjnvncscaq61zq6qmazrmb33vwjcnfrxpi0liqdgh607"))))
    (arguments
     `(#:cargo-test-flags '("--release" "--"
                            ;; These tests require internet access.
                            "--skip=test_badssl_modern"
                            "--skip=test_badssl_self_signed"
                            ;; XXX: Not sure why these fail.
                            "--skip=test_allowed_methods"
                            "--skip=connect_timeout")
       #:cargo-inputs
       (("rust-async-compression" ,rust-async-compression-0.3)
        ("rust-base64" ,rust-base64-0.13)
        ("rust-bytes" ,rust-bytes-0.5)
        ("rust-cookie" ,rust-cookie-0.14)
        ("rust-cookie-store" ,rust-cookie-store-0.12)
        ("rust-encoding-rs" ,rust-encoding-rs-0.8)
        ("rust-futures-core" ,rust-futures-core-0.3)
        ("rust-futures-util" ,rust-futures-util-0.3)
        ("rust-http" ,rust-http-0.2)
        ("rust-http-body" ,rust-http-body-0.3)
        ("rust-hyper" ,rust-hyper-0.13.7-patched)
        ("rust-hyper-rustls" ,rust-hyper-rustls-0.21)
        ("rust-hyper-tls" ,rust-hyper-tls-0.4)
        ("rust-ipnet" ,rust-ipnet-2)
        ("rust-js-sys" ,rust-js-sys-0.3)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-mime" ,rust-mime-0.3)
        ("rust-mime-guess" ,rust-mime-guess-2)
        ("rust-native-tls" ,rust-native-tls-0.2)
        ("rust-percent-encoding" ,rust-percent-encoding-2)
        ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
        ("rust-rustls" ,rust-rustls-0.18)
        ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.4)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-json" ,rust-serde-json-1)
        ("rust-serde-urlencoded" ,rust-serde-urlencoded-0.7)
        ("rust-time" ,rust-time-0.2)
        ("rust-tokio" ,rust-tokio-0.2)
        ("rust-tokio-rustls" ,rust-tokio-rustls-0.14)
        ("rust-tokio-socks" ,rust-tokio-socks-0.3)
        ("rust-tokio-tls" ,rust-tokio-tls-0.3)
        ("rust-trust-dns-resolver" ,rust-trust-dns-resolver-0.19)
        ("rust-url" ,rust-url-2)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
        ("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4)
        ("rust-web-sys" ,rust-web-sys-0.3)
        ("rust-webpki-roots" ,rust-webpki-roots-0.20)
        ("rust-winreg" ,rust-winreg-0.7))
       #:cargo-development-inputs
       (("rust-brotli" ,rust-brotli-3)
        ("rust-doc-comment" ,rust-doc-comment-0.3)
        ("rust-env-logger" ,rust-env-logger-0.7)
        ("rust-hyper" ,rust-hyper-0.13)
        ("rust-libflate" ,rust-libflate-1)
        ("rust-serde" ,rust-serde-1)
        ("rust-tokio" ,rust-tokio-0.2)
        ("rust-wasm-bindgen-test" ,rust-wasm-bindgen-test-0.3))))
    (native-inputs
     (list pkg-config))
    (inputs
     (list openssl))))

;; This was added specifically to fix the issue in tealdeer: https://issues/guix.gnu.org/57867
;; TODO: remove this when tealdeer is updated/fixed
(define-public rust-hyper-0.13.7-patched
  (package
    (inherit rust-hyper-0.14)
    (name "rust-hyper-patched")
    (version "0.13.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hyper" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1symcnba2y03b8lj6xp2wd994lk3xyk3wizacjg5s60njzfshs1y"))))
    (arguments
     `(#:cargo-inputs
       (("rust-bytes" ,rust-bytes-0.5)
        ("rust-futures-channel" ,rust-futures-channel-0.3)
        ("rust-futures-core" ,rust-futures-core-0.3)
        ("rust-futures-util" ,rust-futures-util-0.3)
        ("rust-h2" ,rust-h2-0.2)
        ("rust-http" ,rust-http-0.2)
        ("rust-http-body" ,rust-http-body-0.3)
        ("rust-httparse" ,rust-httparse-1)
        ("rust-itoa" ,rust-itoa-0.4)
        ("rust-pin-project" ,rust-pin-project-0.4.29)
        ("rust-socket2" ,rust-socket2-0.3)
        ("rust-time" ,rust-time-0.1)
        ("rust-tokio" ,rust-tokio-0.2)
        ("rust-tower-service" ,rust-tower-service-0.3)
        ("rust-tracing" ,rust-tracing-0.1)
        ("rust-want" ,rust-want-0.3))
       #:cargo-development-inputs
       (("rust-futures-util" ,rust-futures-util-0.3)
        ("rust-matches" ,rust-matches-0.1)
        ("rust-num-cpus" ,rust-num-cpus-1)
        ("rust-pretty-env-logger" ,rust-pretty-env-logger-0.4)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-derive" ,rust-serde-derive-1)
        ("rust-serde-json" ,rust-serde-json-1)
        ("rust-spmc" ,rust-spmc-0.3)
        ("rust-tokio" ,rust-tokio-0.2)
        ("rust-tokio-test" ,rust-tokio-test-0.2)
        ("rust-tokio-util" ,rust-tokio-util-0.3)
        ("rust-tower-util" ,rust-tower-util-0.3)
        ("rust-url" ,rust-url-1))))))

(define-public rust-pin-project-0.4.29
  (package
    (inherit rust-pin-project-1)
    (name "rust-pin-project")
    (version "0.4.29")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pin-project" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02f93m6qq0hiq7mmf9wqn7kph4nw9lk9jd06zzlpjx8k666w25cn"))))
    (arguments
     `(#:tests? #f ; XXX: Fix-me.
       #:cargo-inputs
       (("rust-pin-project-internal" ,rust-pin-project-internal-0.4.29))))))

(define-public rust-pin-project-internal-0.4.29
  (package
    (inherit rust-pin-project-internal-1)
    (name "rust-pin-project-internal")
    (version "0.4.29")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pin-project-internal" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ami799a794z5a8h190f20vqzwby0kkbqnwxkpadkvhrf1168j84"))))
    (arguments
     `(#:tests? #f ; XXX: Fix-me.
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-1))))))

;; temporary adding rust-notify version to fix rust-analyzer
(define-public rust-notify-5-pre
  (package
    (name "rust-notify")
    (version "5.0.0-pre.13")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "notify" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0za8mpacxkr62fii5h7ny4h396y0m8myd3hf08njqdg2h21kap94"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-crossbeam-channel" ,rust-crossbeam-channel-0.5)
                       ("rust-filetime" ,rust-filetime-0.2)
                       ("rust-fsevent-sys" ,rust-fsevent-sys-4)
                       ("rust-inotify" ,rust-inotify-0.9)
                       ("rust-kqueue" ,rust-kqueue-1)
                       ("rust-kqueue" ,rust-kqueue-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-mio" ,rust-mio-0.7)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-walkdir" ,rust-walkdir-2)
                       ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs (("rust-futures" ,rust-futures-0.3)
                                   ("rust-serde-json" ,rust-serde-json-1)
                                   ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://github.com/notify-rs/notify")
    (synopsis "Cross-platform filesystem notification library")
    (description "Cross-platform filesystem notification library")
    (license (list license:cc0 license:artistic2.0))))
