(define-module (lp packages crates-extra)
  #:use-module(gnu packages crates-apple)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages crates-tls)
  #:use-module (gnu packages crates-web)
  #:use-module (gnu packages crates-windows)
  #:use-module (gnu packages crates-vcs)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:))

(define-public rust-always-assert-0.1
  (package
    (name "rust-always-assert")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "always-assert" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04ad9wbh70nii1ilcd1mxv85yqx18jf9vsmh3ddps886bmi8ixpv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4))))
    (home-page
     "https://github.com/matklad/always-assert")
    (synopsis
     "Recoverable assertions for long-running robust applications")
    (description
     "This package provides a recoverable assertions for long-running robust
applications.")
    (license (list license:expat license:asl2.0))))

(define-public rust-semver-0.6
  (package
    (inherit rust-semver-0.9)
    (name "rust-semver")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "semver" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0drmjiwkq0znj33q9x9hw7ld8f28n9diyjs3jlh1l1v5kvn8ccbs"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-semver-parser" ,rust-semver-parser-0.7))
       #:cargo-development-inputs
       (("rust-crates-index" ,rust-crates-index-0.5)
        ("rust-tempdir" ,rust-tempdir-0.3))))))

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

(define-public rust-xshell-macros-0.1
  (package
    (name "rust-xshell-macros")
    (version "0.1.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "xshell-macros" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0lkym5kfq446xymimxr226kppr3ynpi9n8iif32vrfbm5i5djzng"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/matklad/xshell")
    (synopsis
     "Private implementation detail of xshell crate")
    (description
     "This package provide a private implementation detail of xshell crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-xshell-0.1
  (package
    (name "rust-xshell")
    (version "0.1.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "xshell" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1iilg7cjgz3342f3na500dp3c371jk198qh053kfy57b84dvn5gb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-xshell-macros" ,rust-xshell-macros-0.1))))
    (home-page "https://github.com/matklad/xshell")
    (synopsis
     "Utilities for quick shell scripting in Rust")
    (description
     "This package provide a utilities for quick shell scripting in Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-xflags-0.2
  (package
    (name "rust-xflags")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "xflags" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "12i0m43fmvwhlqid5xbr017c12j7jv3vlkjv04q428mpl3k6rbar"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-xflags-macros" ,rust-xflags-macros-0.2))))
    (home-page "https://github.com/matklad/xflags")
    (synopsis
     "Moderately simple command line arguments parser")
    (description
     "This package provides a moderately simple command line arguments parser.")
    (license (list license:expat license:asl2.0))))

(define-public rust-write-json-0.1
  (package
    (name "rust-write-json")
    (version "0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "write-json" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1qxr1xwwyf7rd270rvjlcssm515pikf0sg70wpiymz4miy29l1h6"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/matklad/write-json")
    (synopsis
      "Simple {dependency,trait,macro}-less JSON serialization")
    (description
      "This package provides a simple {dependency,trait,macro}-less JSON
serialization.")
    (license (list license:expat license:asl2.0))))

(define-public rust-mimalloc-0.1
  (package
    (name "rust-mimalloc")
    (version "0.1.39")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mimalloc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "176w9gf5qxs07kd2q39f0k25rzmp4kyx5r13wc8sk052bqmr40gs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libmimalloc-sys" ,rust-libmimalloc-sys-0.1))))
    (inputs (list mimalloc))
    (home-page "https://crates.io/crates/mimalloc")
    (synopsis "Performance and security oriented drop-in allocator")
    (description "This package provides a performance and security oriented
drop-in allocator.")
    (license license:expat)))

(define-public rust-lsp-server-0.5
  (package
    (name "rust-lsp-server")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lsp-server" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "14irb3kawr5i2cx295xyw8q7pv18d52cjh3c6rd858aw5l2df9b8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-crossbeam-channel"
         ,rust-crossbeam-channel-0.5)
        ("rust-log" ,rust-log-0.4)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-json" ,rust-serde-json-1))
       #:cargo-development-inputs
       (("rust-lsp-types" ,rust-lsp-types-0.83))))
    (home-page
     "https://github.com/rust-analyzer/lsp-server")
    (synopsis "Generic LSP server scaffold")
    (description "This package provides a generic LSP server scaffold.")
    (license (list license:expat license:asl2.0))))

(define-public rust-jod-thread-0.1
  (package
    (name "rust-jod-thread")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jod-thread" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1bj7g6l59ybcf33znf80ccqbxvs1cmd8ynd4m8h7ywdqk473c8wb"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/matklad/jod-thread")
    (synopsis
     "Thin wrapper around @code{std::thread} which joins on drop by default")
    (description
     "Join On Drop thread (jod_thread) is a thin wrapper around
@code{std::thread}, which makes sure that by default all threads are joined.")
    (license (list license:expat license:asl2.0))))

(define-public rust-drop-bomb-0.1
  (package
    (name "rust-drop-bomb")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "drop_bomb" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1qc59a53ngwxpnbvl8xidp2cmwrl671dhbzw7zijmjjaq0hqxnlv"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/matklad/drop_bomb")
    (synopsis
     "Runtime guard for implementing linear types")
    (description
     "This package provides a runtime guard for implementing linear types.")
    (license (list license:expat license:asl2.0))))

(define-public rust-dot-0.1
  (package
    (name "rust-dot")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dot" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "01jr7px6anh3yasz8cbbr9ij989gnwb3qdk4852mzzqw996nqjx7"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/GrahamDennis/dot-rust")
    (synopsis
     "Library for generating Graphviz DOT language files for graphs")
    (description
     "This package provides a library for generating Graphviz DOT language files
for graphs.")
    (license (list license:expat license:asl2.0))))

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

(define-public rust-object-0.28.3
  (package
    (inherit rust-object-0.29)
    (name "rust-object")
    (version "0.28.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "object" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0mnllk6kwznchzryczyfmvlixzhz6f20n4dayycmyn8ll05wggj0"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-compiler-builtins"
         ,rust-compiler-builtins-0.1)
        ("rust-crc32fast" ,rust-crc32fast-1)
        ("rust-flate2" ,rust-flate2-1)
        ("rust-hashbrown" ,rust-hashbrown-0.11)
        ("rust-indexmap" ,rust-indexmap-1)
        ("rust-memchr" ,rust-memchr-2)
        ("rust-rustc-std-workspace-alloc"
         ,rust-rustc-std-workspace-alloc-1)
        ("rust-rustc-std-workspace-core"
         ,rust-rustc-std-workspace-core-1)
        ("rust-wasmparser" ,rust-wasmparser-0.57))
       #:cargo-development-inputs
       (("rust-memmap" ,rust-memmap-0.7))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-version-requirements
           (lambda _
             (substitute* "Cargo.toml"
               (("1.6.\\*")
                ,(package-version rust-indexmap-1)))
             #t)))))))

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

(define-public rust-lscolors-0.7
  (package
    (inherit rust-lscolors-0.16)
    (name "rust-lscolors")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lscolors" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0vn1824lagf0xdv5rxyl7m9fbrcylyjibmnd4634dnn98m68jjyj"))))
    (arguments
     `(#:cargo-inputs
       (("rust-ansi-term" ,rust-ansi-term-0.12))
       #:cargo-development-inputs
       (("rust-tempfile" ,rust-tempfile-3))))))

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

(define-public rust-sysinfo-0.15
  (package
    (inherit rust-sysinfo-0.28)
    (name "rust-sysinfo")
    (version "0.15.11")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "sysinfo" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0n713rhayp28z8j4pviqcg4blcp1yfvniwa1ipinp75hyv7lq0nx"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-core-foundation-sys" ,rust-core-foundation-sys-0.8)
                       ("rust-doc-comment" ,rust-doc-comment-0.3)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-ntapi" ,rust-ntapi-0.3)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-winapi" ,rust-winapi-0.3))))))

(define-public rust-sysinfo-0.24
  (package
    (inherit rust-sysinfo-0.28)
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
                       ("rust-oorandom" ,rust-oorandom-11)
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

(define-public rust-git2-0.14
  (package
    (inherit rust-git2-0.16)
    (name "rust-git2")
    (version "0.14.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "git2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "074kqlmh7q39pqcj9rmrnmx4v5njh2j09dfxc1hsh45pm835a5fh"))))
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libgit2-sys" ,rust-libgit2-sys-0.13)
        ("rust-log" ,rust-log-0.4)
        ("rust-openssl-probe" ,rust-openssl-probe-0.1)
        ("rust-openssl-sys" ,rust-openssl-sys-0.9)
        ("rust-url" ,rust-url-2))
       #:cargo-development-inputs
       (("rust-paste" ,rust-paste-1)
        ("rust-structopt" ,rust-structopt-0.3)
        ("rust-tempfile" ,rust-tempfile-3)
        ("rust-time" ,rust-time-0.1))))
    (inputs
     (list libgit2-1.4 libssh2 openssl zlib))))

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

(define-public rust-ct-logs-0.6
  (package
    (inherit rust-ct-logs-0.7)
    (name "rust-ct-logs")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ct-logs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04wiwiv4ghni3x2vni3z711mlz0ndqvh04vmdkbw3nr7zbsqcdjd"))))
    (arguments
     `(#:cargo-inputs
       (("rust-sct" ,rust-sct-0.6))))))

(define-public rust-tokio-rustls-0.10
  (package
    (inherit rust-tokio-rustls-0.12)
    (name "rust-tokio-rustls")
    (version "0.10.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-rustls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xh6gxilm7waj55rxfgqmvl8abynzr3ang57qvbap400k67z0z1d"))))
    (arguments
     `(#:cargo-test-flags '("--release" "--" "--skip=test_badssl")
       #:cargo-inputs
       (("rust-bytes" ,rust-bytes-0.4)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-iovec" ,rust-iovec-0.1)
        ("rust-rustls" ,rust-rustls-0.16)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-webpki" ,rust-webpki-0.21))
       #:cargo-development-inputs
       (("rust-tokio" ,rust-tokio-0.1)
        ("rust-webpki-roots" ,rust-webpki-roots-0.17))))))

(define-public rust-hyper-rustls-0.17
  (package
    (inherit rust-hyper-rustls-0.21)
    (name "rust-hyper-rustls")
    (version "0.17.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hyper-rustls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0li9xkzmqd40dbjbl9g0nbf2ka9y0q538ififyd30zsavz3qb7bi"))))
    (arguments
     `(#:cargo-test-flags '("--release" "--" "--skip=server" "--skip=client"
                            "--skip=custom_ca_store")
       #:cargo-inputs
       (("rust-bytes" ,rust-bytes-0.4)
        ("rust-ct-logs" ,rust-ct-logs-0.6)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-hyper" ,rust-hyper-0.12)
        ("rust-rustls" ,rust-rustls-0.16)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-rustls" ,rust-tokio-rustls-0.10)
        ("rust-webpki" ,rust-webpki-0.21)
        ("rust-webpki-roots" ,rust-webpki-roots-0.17))))))

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

(define-public rust-libssh2-sys-0.3
  (package
    (name "rust-libssh2-sys")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "libssh2-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1vkidqw5ll71ynqc93hgcq62iqkklzb5268zffd13ql7nwqa1j1d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-libz-sys" ,rust-libz-sys-1)
                       ("rust-openssl-sys" ,rust-openssl-sys-0.9)
                       ("rust-pkg-config" ,rust-pkg-config-0.3)
                       ("rust-vcpkg" ,rust-vcpkg-0.2))))
    (home-page "https://github.com/alexcrichton/ssh2-rs")
    (synopsis "Native bindings to the libssh2 library")
    (description "Native bindings to the libssh2 library")
    (license (list license:expat license:asl2.0))))

(define-public rust-ssh2-0.9
  (package
    (name "rust-ssh2")
    (version "0.9.4")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "ssh2" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0malilb9lbzlh3i24nb6s61lmz5as801swy30ib6v7sm20cldzp7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-libssh2-sys" ,rust-libssh2-sys-0.3)
                       ("rust-parking-lot" ,rust-parking-lot-0.11))))
    (home-page "https://github.com/alexcrichton/ssh2-rs")
    (synopsis
     "Bindings to libssh2 for interacting with SSH servers and executing remote
commands, forwarding local ports, etc.
")
    (description
     "Bindings to libssh2 for interacting with SSH servers and executing remote
commands, forwarding local ports, etc.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasmer-wasi-types-2
  (package
    (name "rust-wasmer-wasi-types")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasmer-wasi-types" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0s44g847lvkp2rdcd9gj7id28krp0pqvc711wf6ki5yzvfm87p12"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-time" ,rust-time-0.2)
                       ("rust-wasmer-types" ,rust-wasmer-types-2))))
    (home-page "https://github.com/wasmerio/wasmer")
    (synopsis "WASI types for Wasmer WebAssembly runtime")
    (description "WASI types for Wasmer WebAssembly runtime")
    (license license:expat)))

(define-public rust-wasmer-vfs-2
  (package
    (name "rust-wasmer-vfs")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasmer-vfs" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1h4pkrj53lzy0hgmj1z23j692x42dpqyg0fnq90bag65xpiyl0lk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-slab" ,rust-slab-0.4)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-typetag" ,rust-typetag-0.1))))
    (home-page "")
    (synopsis "Wasmer Virtual FileSystem")
    (description "Wasmer Virtual FileSystem")
    (license license:expat)))

(define-public rust-generational-arena-0.2
  (package
    (name "rust-generational-arena")
    (version "0.2.9")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "generational-arena" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1rwnfyprjwqafkwdz2irkds5a41jcjb3bsma3djknx4fy2pr8zl7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/fitzgen/generational-arena")
    (synopsis
     "A safe arena allocator that supports deletion without suffering from the ABA problem by using generational indices.")
    (description
     "This package provides a safe arena allocator that supports deletion without
suffering from the ABA problem by using generational indices.")
    (license license:mpl2.0)))

(define-public rust-wasmer-wasi-2
  (package
    (name "rust-wasmer-wasi")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasmer-wasi" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "16cx661rj09lzfgmzzbfmr1sgq9a2mlv2wnii8wkwvqv7hgf7nzs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bincode" ,rust-bincode-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-generational-arena" ,rust-generational-arena-0.2)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-typetag" ,rust-typetag-0.1)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-wasmer" ,rust-wasmer-2)
                       ("rust-wasmer-vfs" ,rust-wasmer-vfs-2)
                       ("rust-wasmer-wasi-types" ,rust-wasmer-wasi-types-2)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/wasmerio/wasmer")
    (synopsis "WASI implementation library for Wasmer WebAssembly runtime")
    (description "WASI implementation library for Wasmer WebAssembly runtime")
    (license license:expat)))

(define-public rust-wasm-encoder-0.31
  (package
    (name "rust-wasm-encoder")
    (version "0.31.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasm-encoder" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "05nyajlmqgvyq7ynqhs1hbsmkafkjrj4dyqszygkklgyx8h3yxj1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-leb128" ,rust-leb128-0.2))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasm-encoder")
    (synopsis "A low-level WebAssembly encoder.
")
    (description "This package provides a low-level WebAssembly encoder.")
    (license (list license:asl2.0))))

(define-public rust-wast-62
  (package
    (name "rust-wast")
    (version "62.0.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wast" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "07wzrdq9igydq21ljdlx3nfx9q91zbw0yqmxky47ndxykpq0dbmq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-leb128" ,rust-leb128-0.2)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-unicode-width" ,rust-unicode-width-0.1)
                       ("rust-wasm-encoder" ,rust-wasm-encoder-0.31))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wast")
    (synopsis
     "Customizable Rust parsers for the WebAssembly Text formats WAT and WAST
")
    (description
     "Customizable Rust parsers for the WebAssembly Text formats WAT and WAST")
    (license (list license:asl2.0))))

(define-public rust-wat-1
  (package
    (name "rust-wat")
    (version "1.0.69")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wat" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0dz68igazwisjp9833ayngwgdw7arm8hfjridnlv8gr03n31abl4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-wast" ,rust-wast-62))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wat")
    (synopsis "Rust parser for the WebAssembly Text format, WAT
")
    (description "Rust parser for the WebAssembly Text format, WAT")
    (license (list license:asl2.0))))

(define-public rust-wasmer-engine-universal-artifact-2
  (package
    (name "rust-wasmer-engine-universal-artifact")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasmer-engine-universal-artifact" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0hddz5md13d4gmkzwa43mlfq1xsza9k4pi46dvmmf9hmahzxpwb8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-enum-iterator" ,rust-enum-iterator-0.7)
                       ("rust-enumset" ,rust-enumset-1)
                       ("rust-loupe" ,rust-loupe-0.1)
                       ("rust-rkyv" ,rust-rkyv-0.7)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasmer-artifact" ,rust-wasmer-artifact-2)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-2)
                       ("rust-wasmer-types" ,rust-wasmer-types-2))))
    (home-page "https://github.com/wasmerio/wasmer")
    (synopsis "Wasmer Engine Universal Artifact abstraction")
    (description "Wasmer Engine Universal Artifact abstraction")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasmer-engine-universal-2
  (package
    (name "rust-wasmer-engine-universal")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasmer-engine-universal" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "05ggvcr4p11df4yrpdcnawxrigw1x8vx1vgllijpi94w7kcw63a4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-enumset" ,rust-enumset-1)
                       ("rust-leb128" ,rust-leb128-0.2)
                       ("rust-loupe" ,rust-loupe-0.1)
                       ("rust-region" ,rust-region-3)
                       ("rust-rkyv" ,rust-rkyv-0.7)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-2)
                       ("rust-wasmer-engine" ,rust-wasmer-engine-2)
                       ("rust-wasmer-engine-universal-artifact" ,rust-wasmer-engine-universal-artifact-2)
                       ("rust-wasmer-types" ,rust-wasmer-types-2)
                       ("rust-wasmer-vm" ,rust-wasmer-vm-2)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/wasmerio/wasmer")
    (synopsis "Wasmer Universal Engine")
    (description "Wasmer Universal Engine")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasmer-object-2
  (package
    (name "rust-wasmer-object")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasmer-object" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "12zsm0iqdb14xgn2rf9nh1445ikm264nygrha7sfqi1szwsi70wd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-object" ,rust-object-0.28)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-2)
                       ("rust-wasmer-types" ,rust-wasmer-types-2))))
    (home-page "https://wasmer.io/")
    (synopsis "Wasmer Native Object generator")
    (description "Wasmer Native Object generator")
    (license license:expat)))

(define-public rust-leb128-0.2
  (package
    (name "rust-leb128")
    (version "0.2.5")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "leb128" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0rxxjdn76sjbrb08s4bi7m4x47zg68f71jzgx8ww7j0cnivjckl8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/gimli-rs/leb128")
    (synopsis
     "Read and write DWARF's \"Little Endian Base 128\" (LEB128) variable length integer encoding.")
    (description
     "Read and write DWARF's \"Little Endian Base 128\" (LEB128) variable length integer
encoding.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmer-engine-dylib-2
  (package
    (name "rust-wasmer-engine-dylib")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasmer-engine-dylib" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0lvy5dkpiqv5s607hrgnp2ndjj2nh19ma5rifxc28iqmkjpmh0xd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-enum-iterator" ,rust-enum-iterator-0.7)
                       ("rust-enumset" ,rust-enumset-1)
                       ("rust-leb128" ,rust-leb128-0.2)
                       ("rust-libloading" ,rust-libloading-0.7)
                       ("rust-loupe" ,rust-loupe-0.1)
                       ("rust-object" ,rust-object-0.28.3)
                       ("rust-rkyv" ,rust-rkyv-0.7)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-tempfile" ,rust-tempfile-3)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-wasmer-artifact" ,rust-wasmer-artifact-2)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-2)
                       ("rust-wasmer-engine" ,rust-wasmer-engine-2)
                       ("rust-wasmer-object" ,rust-wasmer-object-2)
                       ("rust-wasmer-types" ,rust-wasmer-types-2)
                       ("rust-wasmer-vm" ,rust-wasmer-vm-2)
                       ("rust-which" ,rust-which-4))))
    (home-page "https://github.com/wasmerio/wasmer")
    (synopsis "Wasmer Dylib Engine")
    (description "Wasmer Dylib Engine")
    (license license:expat)))

(define-public rust-wasmer-engine-2
  (package
    (name "rust-wasmer-engine")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasmer-engine" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0icfaiihg4iaix7k6hr3hah7xpv10smsx4mk66s4s94cjw8g161z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-enumset" ,rust-enumset-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-loupe" ,rust-loupe-0.1)
                       ("rust-memmap2" ,rust-memmap2-0.5)
                       ("rust-more-asserts" ,rust-more-asserts-0.2)
                       ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-bytes" ,rust-serde-bytes-0.11)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasmer-artifact" ,rust-wasmer-artifact-2)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-2)
                       ("rust-wasmer-types" ,rust-wasmer-types-2)
                       ("rust-wasmer-vm" ,rust-wasmer-vm-2))))
    (home-page "https://github.com/wasmerio/wasmer")
    (synopsis "Wasmer Engine abstraction")
    (description "Wasmer Engine abstraction")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasmer-derive-2
  (package
    (name "rust-wasmer-derive")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasmer-derive" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0lab50wlf236135f5k2afj9mq79cbw573125azzp8brarh2h9r80"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro-error" ,rust-proc-macro-error-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://wasmer.io/")
    (synopsis "Wasmer derive macros")
    (description "Wasmer derive macros")
    (license license:expat)))

(define-public rust-dynasmrt-1
  (package
    (name "rust-dynasmrt")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "dynasmrt" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1aa1av01h0l8ms9fk32ydahby77fd3hhv85zsk51fsnp5fjabyv4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-dynasm" ,rust-dynasm-1)
                       ("rust-memmap2" ,rust-memmap2-0.5))))
    (home-page "https://github.com/CensoredUsername/dynasm-rs")
    (synopsis
     "A simple runtime for assembling code at runtime. Combined with the plugin crate dynasm it can be used to write JIT compilers easily.")
    (description
     "This package provides a simple runtime for assembling code at runtime.  Combined
with the plugin crate dynasm it can be used to write JIT compilers easily.")
    (license license:mpl2.0)))

(define-public rust-dynasm-1
  (package
    (name "rust-dynasm")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "dynasm" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "12yf5l193j318bv9fxqw1r5j210mdzh0jgrna304wlkvh01a3ndd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-proc-macro-error" ,rust-proc-macro-error-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/CensoredUsername/dynasm-rs")
    (synopsis
     "A plugin for assembling code at runtime. Combined with the runtime crate dynasmrt it can be used to write JIT compilers easily.")
    (description
     "This package provides a plugin for assembling code at runtime.  Combined with
the runtime crate dynasmrt it can be used to write JIT compilers easily.")
    (license license:mpl2.0)))

(define-public rust-wasmer-compiler-singlepass-2
  (package
    (name "rust-wasmer-compiler-singlepass")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasmer-compiler-singlepass" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "17kj3limifkh6xw8l6w01c3vi3cs4nn7mg32a2lfz2sd40sjmji9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-dynasm" ,rust-dynasm-1)
                       ("rust-dynasmrt" ,rust-dynasmrt-1)
                       ("rust-gimli" ,rust-gimli-0.26)
                       ("rust-hashbrown" ,rust-hashbrown-0.11)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-loupe" ,rust-loupe-0.1)
                       ("rust-more-asserts" ,rust-more-asserts-0.2)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-2)
                       ("rust-wasmer-types" ,rust-wasmer-types-2))))
    (home-page "https://wasmer.io/")
    (synopsis "Singlepass compiler for Wasmer WebAssembly runtime")
    (description "Singlepass compiler for Wasmer WebAssembly runtime")
    (license license:expat)))

(define-public rust-mach-0.3
  (package
    (name "rust-mach")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "mach" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1yksa8lwzqh150gr4417rls1wk20asy9vhp8kq5g9n7z58xyh8xq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
    (home-page "https://github.com/fitzgen/mach")
    (synopsis
     "A Rust interface to the user-space API of the Mach 3.0 kernel that underlies OSX.")
    (description
     "This package provides a Rust interface to the user-space API of the Mach 3.0
kernel that underlies OSX.")
    (license license:bsd-2)))

(define-public rust-windows-x86-64-msvc-0.33
  (package
    (name "rust-windows-x86-64-msvc")
    (version "0.33.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "windows_x86_64_msvc" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1akf81g0bh8mv8wjpiifd819r0hx3r0xrz9zgzn4hl298sk4l7pz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "Import lib for Windows")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-x86-64-gnu-0.33
  (package
    (name "rust-windows-x86-64-gnu")
    (version "0.33.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "windows_x86_64_gnu" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1127n961nib9338n0g0sp1464v8wnw0hvmw45sr7pkly1q69ppdl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "Import lib for Windows")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-i686-msvc-0.33
  (package
    (name "rust-windows-i686-msvc")
    (version "0.33.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "windows_i686_msvc" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1l3kwxgdfg4lnx2j5bkcx6cnvhxnpcsbqjm3idhwxmwsrj4vxzcc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "Import lib for Windows")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-i686-gnu-0.33
  (package
    (name "rust-windows-i686-gnu")
    (version "0.33.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "windows_i686_gnu" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "03nsi8h0yd4n9wgpxcpynzwlnacihisgmh021kfb5fln79qczc6a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "Import lib for Windows")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-aarch64-msvc-0.33
  (package
    (name "rust-windows-aarch64-msvc")
    (version "0.33.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "windows_aarch64_msvc" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "01q80v2zzfc144xsqj3yhd62rn1dy1kyamhyv0gcrf4sxg9iyxnd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "Import lib for Windows")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-sys-0.33
  (package
    (name "rust-windows-sys")
    (version "0.33.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "windows-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0xdym5hgf2pp5lmfdjk4lynad99w4j02v9yzn6752a9ncsbb1ns3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-windows-aarch64-msvc" ,rust-windows-aarch64-msvc-0.33)
                       ("rust-windows-i686-gnu" ,rust-windows-i686-gnu-0.33)
                       ("rust-windows-i686-msvc" ,rust-windows-i686-msvc-0.33)
                       ("rust-windows-x86-64-gnu" ,rust-windows-x86-64-gnu-0.33)
                       ("rust-windows-x86-64-msvc" ,rust-windows-x86-64-msvc-0.33))))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Rust for Windows")
    (description "Rust for Windows")
    (license (list license:expat license:asl2.0))))

(define-public rust-corosensei-0.1
  (package
    (name "rust-corosensei")
    (version "0.1.3")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "corosensei" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1kgj9k74asnrdsgmdc4p1c4172vr8br3zhlbsv5hs2x5687zjiwq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-autocfg" ,rust-autocfg-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-scopeguard" ,rust-scopeguard-1)
                       ("rust-windows-sys" ,rust-windows-sys-0.33))))
    (home-page "https://github.com/Amanieu/corosensei")
    (synopsis "A fast and safe implementation of stackful coroutines")
    (description
     "This package provides a fast and safe implementation of stackful coroutines")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasmer-vm-2
  (package
    (name "rust-wasmer-vm")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasmer-vm" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1pa7c937ky1kak1scm21p7xn6dgcxkvslkd56pdlrp7lc7x6bn9h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-cc" ,rust-cc-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-corosensei" ,rust-corosensei-0.1)
                       ("rust-enum-iterator" ,rust-enum-iterator-0.7)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-loupe" ,rust-loupe-0.1)
                       ("rust-mach" ,rust-mach-0.3)
                       ("rust-memoffset" ,rust-memoffset-0.6)
                       ("rust-more-asserts" ,rust-more-asserts-0.2)
                       ("rust-region" ,rust-region-3)
                       ("rust-rkyv" ,rust-rkyv-0.7)
                       ("rust-scopeguard" ,rust-scopeguard-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasmer-artifact" ,rust-wasmer-artifact-2)
                       ("rust-wasmer-types" ,rust-wasmer-types-2)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://wasmer.io/")
    (synopsis "Runtime library support for Wasmer")
    (description "Runtime library support for Wasmer")
    (license (list license:expat license:asl2.0))))

(define-public rust-alloc-traits-0.1
  (package
    (name "rust-alloc-traits")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "alloc-traits" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "10z4rmykwnp8ps5r5n34190h6gmzpj1f67fqildi1z8r6f2m8bbb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/HeroicKatora/static-alloc")
    (synopsis "Traits to replace or supplement the alloc module in no_std")
    (description "Traits to replace or supplement the alloc module in no_std")
    (license license:expat)))

(define-public rust-static-alloc-0.2
  (package
    (name "rust-static-alloc")
    (version "0.2.4")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "static-alloc" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0zlx3qbprn3zfkr85z0n4c03f5g222jbnsmjqn09zyfx1a27w2sp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-alloc-traits" ,rust-alloc-traits-0.1)
                       ("rust-atomic-polyfill" ,rust-atomic-polyfill-0.1))))
    (home-page "https://github.com/HeroicKatora/static-alloc")
    (synopsis "A bump allocator on static memory for the alloc-traits crate")
    (description
     "This package provides a bump allocator on static memory for the alloc-traits
crate")
    (license (list license:expat license:asl2.0 license:zlib))))

(define-public rust-llvm-sys-90
  (package
    (name "rust-llvm-sys")
    (version "90.2.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "llvm-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1fbrfchskrbgvf6ri2sg1qf05w53a093kig7g0vnfz3yggav0dhh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-semver" ,rust-semver-0.9))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "Bindings to LLVM's C API")
    (license license:expat)))

(define-public rust-llvm-sys-80
  (package
    (name "rust-llvm-sys")
    (version "80.3.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "llvm-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "06nlp13zc47q55zscqz6fdhvh4cxjpdcxs7q23r5pz6dzpxpd9aw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-semver" ,rust-semver-0.9))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "Bindings to LLVM's C API")
    (license license:expat)))

(define-public rust-llvm-sys-100
  (package
    (name "rust-llvm-sys")
    (version "100.2.4")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "llvm-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0d2v8y9fwqqhidmdxhra7509vj503bj0zlivp9wm1xw4g28il9bj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-semver" ,rust-semver-0.9))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "Bindings to LLVM's C API")
    (license license:expat)))

(define-public rust-llvm-sys-110
  (package
    (name "rust-llvm-sys")
    (version "110.0.4")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "llvm-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0gbwa9i39l0rx66v8wgrg6ixpf7r35vvj9kxplg98q29qksddfks"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-semver" ,rust-semver-0.11))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "Bindings to LLVM's C API")
    (license license:expat)))

(define-public rust-llvm-sys-120
  (package
    (name "rust-llvm-sys")
    (version "120.3.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "llvm-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1vr1kvqr0z2pr4x4gl1b9dd71fbg7z5fw4ssp1z9qxinyj92ckv2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-semver" ,rust-semver-0.11))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "Bindings to LLVM's C API")
    (license license:expat)))

(define-public rust-llvm-sys-130
  (package
    (name "rust-llvm-sys")
    (version "130.1.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "llvm-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0z6nzm49gav2x2mvmvqjsqqphrkr5w8hvbyvdq1y9gf43z4l40f2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-clang-sys" ,rust-clang-sys-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-semver" ,rust-semver-0.11)
                       ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "Bindings to LLVM's C API")
    (license license:expat)))

(define-public rust-llvm-sys-140
  (package
    (name "rust-llvm-sys")
    (version "140.1.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "llvm-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0r16mgmn5jp18jlvv4g40rqc8a1agabr366xjjrvjc95d3w8bck9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-clang-sys" ,rust-clang-sys-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "Bindings to LLVM's C API")
    (license license:expat)))

(define-public rust-clang-sys-1
  (package
    (name "rust-clang-sys")
    (version "1.6.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "clang-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0vxg1dchm5nhiqj1z3nm5dmddqbbm0q8ibjcd3my62188dsgr266"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-glob" ,rust-glob-0.3)
                       ("rust-glob" ,rust-glob-0.3)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-libloading" ,rust-libloading-0.7))))
    (home-page "https://github.com/KyleMayes/clang-sys")
    (synopsis "Rust bindings for libclang.")
    (description "Rust bindings for libclang.")
    (license license:asl2.0)))

(define-public rust-llvm-sys-150
  (package
    (name "rust-llvm-sys")
    (version "150.1.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "llvm-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1lmxcw416n2mhjlcm8gfyzjrs9s9100lww0mzs3b3qzc5zpvlza1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-clang-sys" ,rust-clang-sys-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "Bindings to LLVM's C API")
    (license license:expat)))

(define-public rust-llvm-sys-40
  (package
    (name "rust-llvm-sys")
    (version "40.4.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "llvm-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "099lk8w19is1s4hywilpmnaqp5lm8gp2hw5f06g6f8xn65yi7sm7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-lazy-static" ,rust-lazy-static-0.2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-0.2)
                       ("rust-semver" ,rust-semver-0.6))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "Bindings to LLVM's C API")
    (license license:expat)))

(define-public rust-llvm-sys-50
  (package
    (name "rust-llvm-sys")
    (version "50.4.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "llvm-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "15g89sslrf5c6z5bdrpssimpsr2il9bwaaql5nvscgwybzrhizdf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-lazy-static" ,rust-lazy-static-0.2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-0.2)
                       ("rust-semver" ,rust-semver-0.6))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "Bindings to LLVM's C API")
    (license license:expat)))

(define-public rust-llvm-sys-60
  (package
    (name "rust-llvm-sys")
    (version "60.6.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "llvm-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0ky5xqmc5k7lq9lwfp95yinyxzwsd3d5x06gybcl0scvd4wsg9z8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-0.2)
                       ("rust-semver" ,rust-semver-0.9))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "Bindings to LLVM's C API")
    (license license:expat)))

(define-public rust-llvm-sys-70
  (package
    (name "rust-llvm-sys")
    (version "70.4.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "llvm-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1k9z7qdrss9dfdc64bbbq846plvgp98yir7yyzk7hy61gq900cv7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-semver" ,rust-semver-0.9))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "Bindings to LLVM's C API")
    (license license:expat)))

(define-public rust-inkwell-internals-0.7
  (package
    (name "rust-inkwell-internals")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "inkwell_internals" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "11gah33af1bbidmx1pdy6xqyr24ijpzpngf2bfz05kk4w8bhrl47"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/TheDan64/inkwell")
    (synopsis "Internal macro crate for inkwell")
    (description "Internal macro crate for inkwell")
    (license license:asl2.0)))

(define-public rust-inkwell-0.1
  (package
    (name "rust-inkwell")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "inkwell" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1jfyqsq4fc5blkkgs9gnf9m3wic136k6lzpvcxc556hmhpj13b5v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-either" ,rust-either-1)
                       ("rust-inkwell-internals" ,rust-inkwell-internals-0.7)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-llvm-sys" ,rust-llvm-sys-70)
                       ("rust-llvm-sys" ,rust-llvm-sys-60)
                       ("rust-llvm-sys" ,rust-llvm-sys-50)
                       ("rust-llvm-sys" ,rust-llvm-sys-40)
                       ("rust-llvm-sys" ,rust-llvm-sys-150)
                       ("rust-llvm-sys" ,rust-llvm-sys-140)
                       ("rust-llvm-sys" ,rust-llvm-sys-130)
                       ("rust-llvm-sys" ,rust-llvm-sys-120)
                       ("rust-llvm-sys" ,rust-llvm-sys-110)
                       ("rust-llvm-sys" ,rust-llvm-sys-100)
                       ("rust-llvm-sys" ,rust-llvm-sys-80)
                       ("rust-llvm-sys" ,rust-llvm-sys-90)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-static-alloc" ,rust-static-alloc-0.2))))
    (home-page "https://github.com/TheDan64/inkwell")
    (synopsis
     "Inkwell aims to help you pen your own programming languages by safely wrapping llvm-sys.")
    (description
     "Inkwell aims to help you pen your own programming languages by safely wrapping
llvm-sys.")
    (license license:asl2.0)))

(define-public rust-wasmer-compiler-llvm-2
  (package
    (name "rust-wasmer-compiler-llvm")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasmer-compiler-llvm" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "10yy3dq1yxmcgj853njjcp8fbrid4aimjc0ynzpy56y64l4gasfx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-cc" ,rust-cc-1)
                       ("rust-inkwell" ,rust-inkwell-0.1)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-loupe" ,rust-loupe-0.1)
                       ("rust-object" ,rust-object-0.28)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-rustc-version" ,rust-rustc-version-0.4)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-2)
                       ("rust-wasmer-types" ,rust-wasmer-types-2)
                       ("rust-wasmer-vm" ,rust-wasmer-vm-2))))
    (home-page "https://wasmer.io/")
    (synopsis "LLVM compiler for Wasmer WebAssembly runtime")
    (description "LLVM compiler for Wasmer WebAssembly runtime")
    (license license:expat)))

(define-public rust-cranelift-frontend-0.82
  (package
    (name "rust-cranelift-frontend")
    (version "0.82.3")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "cranelift-frontend" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1kkdw9n4sh053nwi18c4r2l55l36c3vdvygilx5hxkl05piy61m0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.82)
                       ("rust-hashbrown" ,rust-hashbrown-0.9)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Cranelift IR builder helper")
    (description "Cranelift IR builder helper")
    (license (list license:asl2.0))))

(define-public rust-id-arena-2
  (package
    (name "rust-id-arena")
    (version "2.2.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "id-arena" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "01ch8jhpgnih8sawqs44fqsqpc7bzwgy0xpi6j0f4j0i5mkvr8i5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rayon" ,rust-rayon-1))))
    (home-page "https://github.com/fitzgen/id-arena")
    (synopsis "A simple, id-based arena.")
    (description "This package provides a simple, id-based arena.")
    (license (list license:expat license:asl2.0))))

(define-public rust-souper-ir-2
  (package
    (name "rust-souper-ir")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "souper-ir" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0i60q84w5k3rd0j3zhsdc5xasrd4wrkamyrs01rik3lq6g71h355"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-id-arena" ,rust-id-arena-2))))
    (home-page "https://github.com/fitzgen/souper-ir")
    (synopsis "A library for manipulating Souper IR")
    (description "This package provides a library for manipulating Souper IR")
    (license (list license:expat license:asl2.0))))

(define-public rust-regalloc-0.0.34
  (package
    (name "rust-regalloc")
    (version "0.0.34")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "regalloc" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "00ncljiasvlw66avy9756327pcvp3nph0xw3d3f0p65z7qfnni32"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4)
                       ("rust-rustc-hash" ,rust-rustc-hash-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://github.com/bytecodealliance/regalloc.rs")
    (synopsis "Modular register allocation algorithms")
    (description "Modular register allocation algorithms")
    (license (list license:asl2.0))))

(define-public rust-textwrap-0.14
  (package
    (name "rust-textwrap")
    (version "0.14.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "textwrap" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "106xjfzfpk3nj51fx9slf9kyir7xjwvpqm003v9ardgq5b8whrh0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-hyphenation" ,rust-hyphenation-0.8)
                       ("rust-smawk" ,rust-smawk-0.3)
                       ("rust-terminal-size" ,rust-terminal-size-0.1)
                       ("rust-unicode-linebreak" ,rust-unicode-linebreak-0.1)
                       ("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://github.com/mgeisler/textwrap")
    (synopsis
     "Powerful library for word wrapping, indenting, and dedenting strings")
    (description
     "Powerful library for word wrapping, indenting, and dedenting strings")
    (license license:expat)))

(define-public rust-supports-unicode-1
  (package
    (name "rust-supports-unicode")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "supports-unicode" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1cpq6mbixlpdibwx203p6qh7kpzqy9yin7y5ird14ys1bgj4bfd8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-atty" ,rust-atty-0.2))))
    (home-page "https://github.com/zkat/supports-unicode")
    (synopsis "Detects whether a terminal supports unicode.")
    (description "Detects whether a terminal supports unicode.")
    (license license:asl2.0)))

(define-public rust-supports-hyperlinks-1
  (package
    (name "rust-supports-hyperlinks")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "supports-hyperlinks" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "01k4rr0p8fvgc8qwy8bnlr8gf7gk8psb796vg2fwq7phqpvk82sr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-atty" ,rust-atty-0.2))))
    (home-page "https://github.com/zkat/supports-hyperlinks")
    (synopsis "Detects whether a terminal supports rendering hyperlinks.")
    (description "Detects whether a terminal supports rendering hyperlinks.")
    (license license:asl2.0)))

(define-public rust-supports-color-1
  (package
    (name "rust-supports-color")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "supports-color" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0vqdhwc3yf1bv1xbaz5d8p2brmlv1ap4fhwg8pfjzr3yrbrgm9lb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-atty" ,rust-atty-0.2)
                       ("rust-is-ci" ,rust-is-ci-1))))
    (home-page "https://github.com/zkat/supports-color")
    (synopsis
     "Detects whether a terminal supports color, and gives details about that support.")
    (description
     "Detects whether a terminal supports color, and gives details about that support.")
    (license license:asl2.0)))

(define-public rust-miette-derive-3
  (package
    (name "rust-miette-derive")
    (version "3.3.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "miette-derive" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0zznn57w5qq6iw75bg2xvp3f91qzff3bcswmhz76glqj2fvah0aw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/zkat/miette")
    (synopsis "Derive macros for miette. Like `thiserror` for Diagnostics.")
    (description
     "Derive macros for miette.  Like `thiserror` for Diagnostics.")
    (license license:asl2.0)))

(define-public rust-miette-3
  (package
    (name "rust-miette")
    (version "3.3.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "miette" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1v9mdl4vbj98xqzkiw9xgzsk2cmrwlmahn59j2zjbmnmrvydqand"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-atty" ,rust-atty-0.2)
                       ("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-miette-derive" ,rust-miette-derive-3)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-owo-colors" ,rust-owo-colors-3)
                       ("rust-supports-color" ,rust-supports-color-1)
                       ("rust-supports-hyperlinks" ,rust-supports-hyperlinks-1)
                       ("rust-supports-unicode" ,rust-supports-unicode-1)
                       ("rust-terminal-size" ,rust-terminal-size-0.1)
                       ("rust-textwrap" ,rust-textwrap-0.14)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/zkat/miette")
    (synopsis
     "Fancy diagnostic reporting library and protocol for us mere mortals who aren't compiler hackers.")
    (description
     "Fancy diagnostic reporting library and protocol for us mere mortals who aren't
compiler hackers.")
    (license license:asl2.0)))

(define-public rust-cranelift-isle-0.82
  (package
    (name "rust-cranelift-isle")
    (version "0.82.3")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "cranelift-isle" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1l9cicawisi7ydzay0sv7pb70n2qmdfyk6f9hz2adkrgchvva6j3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4)
                       ("rust-miette" ,rust-miette-3)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page
     "https://github.com/bytecodealliance/wasmtime/tree/main/cranelift/isle")
    (synopsis
     "ISLE: Instruction Selection and Lowering Expressions. A domain-specific language for instruction selection in Cranelift.")
    (description
     "ISLE: Instruction Selection and Lowering Expressions.  A domain-specific
language for instruction selection in Cranelift.")
    (license (list license:asl2.0))))

(define-public rust-cranelift-codegen-shared-0.82
  (package
    (name "rust-cranelift-codegen-shared")
    (version "0.82.3")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "cranelift-codegen-shared" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1g2hl52ksmxm147nm3n2i348y9vyn5vagdrkjcnv9hcc52ghvz81"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis
     "For code shared between cranelift-codegen-meta and cranelift-codegen")
    (description
     "For code shared between cranelift-codegen-meta and cranelift-codegen")
    (license (list license:asl2.0))))

(define-public rust-cranelift-codegen-meta-0.82
  (package
    (name "rust-cranelift-codegen-meta")
    (version "0.82.3")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "cranelift-codegen-meta" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "090s1g28wsw28sx9bb3nb8irh716ldz7snvangcx72cvkswdschg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen-shared" ,rust-cranelift-codegen-shared-0.82))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Metaprogram for cranelift-codegen code generator library")
    (description "Metaprogram for cranelift-codegen code generator library")
    (license (list license:asl2.0))))

(define-public rust-cranelift-entity-0.82
  (package
    (name "rust-cranelift-entity")
    (version "0.82.3")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "cranelift-entity" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1kw5j62fcyhs9nf7md8m6jlx1q2k0k39vbqzc027c5l35cbzwfwy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Data structures using entity references as mapping keys")
    (description "Data structures using entity references as mapping keys")
    (license (list license:asl2.0))))

(define-public rust-cranelift-bforest-0.82
  (package
    (name "rust-cranelift-bforest")
    (version "0.82.3")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "cranelift-bforest" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0x8gi908lmnzkniwizgjjbhjvzcbp4k4fyyk325fgj0ncshs5yiq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-entity" ,rust-cranelift-entity-0.82))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "A forest of B+-trees")
    (description "This package provides a forest of B+-trees")
    (license (list license:asl2.0))))

(define-public rust-cranelift-codegen-0.82
  (package
    (name "rust-cranelift-codegen")
    (version "0.82.3")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "cranelift-codegen" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0fzkf4b8xn9n2fm1f9n7zhhqyqnw2w12nzfhmxh3i8iv593r5w96"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bincode" ,rust-bincode-1)
                       ("rust-cranelift-bforest" ,rust-cranelift-bforest-0.82)
                       ("rust-cranelift-codegen-meta" ,rust-cranelift-codegen-meta-0.82)
                       ("rust-cranelift-codegen-shared" ,rust-cranelift-codegen-shared-0.82)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.82)
                       ("rust-cranelift-isle" ,rust-cranelift-isle-0.82)
                       ("rust-gimli" ,rust-gimli-0.26)
                       ("rust-hashbrown" ,rust-hashbrown-0.9)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-miette" ,rust-miette-3)
                       ("rust-regalloc" ,rust-regalloc-0.0.34)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-souper-ir" ,rust-souper-ir-2)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Low-level code generator library")
    (description "Low-level code generator library")
    (license (list license:asl2.0))))

(define-public rust-wasmer-compiler-cranelift-2
  (package
    (name "rust-wasmer-compiler-cranelift")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasmer-compiler-cranelift" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1q6s4ffsj14mgx2s2jk5bapry4dyrfi4dfgqwi4qdw4mcjgjzgj8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.82)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.82)
                       ("rust-cranelift-frontend" ,rust-cranelift-frontend-0.82)
                       ("rust-gimli" ,rust-gimli-0.26)
                       ("rust-hashbrown" ,rust-hashbrown-0.11)
                       ("rust-loupe" ,rust-loupe-0.1)
                       ("rust-more-asserts" ,rust-more-asserts-0.2)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-2)
                       ("rust-wasmer-types" ,rust-wasmer-types-2))))
    (home-page "https://wasmer.io/")
    (synopsis "Cranelift compiler for Wasmer WebAssembly runtime")
    (description "Cranelift compiler for Wasmer WebAssembly runtime")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasmparser-0.83
  (package
    (name "rust-wasmparser")
    (version "0.83.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasmparser" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0yhx2kq7da4sdglh1x1di4xxg33k7lwddpd3ri46bp9abk2xg3ki"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasmparser")
    (synopsis
     "A simple event-driven library for parsing WebAssembly binary files.
")
    (description
     "This package provides a simple event-driven library for parsing WebAssembly
binary files.")
    (license (list license:asl2.0))))

(define-public rust-enum-iterator-derive-0.7
  (package
    (name "rust-enum-iterator-derive")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "enum-iterator-derive" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0ndihb41kmi6pxc2bs097abxliw2pgnnw412lhdqfymjc1vw6d61"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/stephaneyfx/enum-iterator")
    (synopsis "Procedural macro to derive Sequence")
    (description "Procedural macro to derive Sequence")
    (license license:bsd-0)))

(define-public rust-enum-iterator-0.7
  (package
    (name "rust-enum-iterator")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "enum-iterator" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1rldnx6avpz39i1bwb65d4gs303p40syyfc4zqwlx7mpxp2wbsjf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-enum-iterator-derive" ,rust-enum-iterator-derive-0.7))))
    (home-page "https://github.com/stephaneyfx/enum-iterator")
    (synopsis
     "Tools to iterate over all values of a type (e.g. all variants of an enumeration)")
    (description
     "Tools to iterate over all values of a type (e.g. all variants of an enumeration)")
    (license license:bsd-0)))

(define-public rust-wasmer-types-2
  (package
    (name "rust-wasmer-types")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasmer-types" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0zv6nb84wmna5v80pfbvbarm67jj075wfm70cymrn2nw0pm03prr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-enum-iterator" ,rust-enum-iterator-0.7)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-loupe" ,rust-loupe-0.1)
                       ("rust-more-asserts" ,rust-more-asserts-0.2)
                       ("rust-rkyv" ,rust-rkyv-0.7)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://wasmer.io/")
    (synopsis "Wasmer Common Types")
    (description "Wasmer Common Types")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasmer-compiler-2
  (package
    (name "rust-wasmer-compiler")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasmer-compiler" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0b4xw4g1xic55d47hrb77z9vpalbq6bfmkxjdmjmdm5fcvc6qyp6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-enumset" ,rust-enumset-1)
                       ("rust-hashbrown" ,rust-hashbrown-0.11)
                       ("rust-loupe" ,rust-loupe-0.1)
                       ("rust-rkyv" ,rust-rkyv-0.7.20)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-bytes" ,rust-serde-bytes-0.11)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasmer-types" ,rust-wasmer-types-2)
                       ("rust-wasmparser" ,rust-wasmparser-0.83))))
    (home-page "https://wasmer.io/")
    (synopsis "Base compiler abstraction for Wasmer WebAssembly runtime")
    (description "Base compiler abstraction for Wasmer WebAssembly runtime")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasmer-artifact-2
  (package
    (name "rust-wasmer-artifact")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasmer-artifact" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "09g3ghphyl2y9sb5il1zwcsshs55m2dqhi8fmk98l7cwq8l99bvs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-enumset" ,rust-enumset-1)
                       ("rust-loupe" ,rust-loupe-0.1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-2)
                       ("rust-wasmer-types" ,rust-wasmer-types-2))))
    (home-page "https://github.com/wasmerio/wasmer")
    (synopsis "Wasmer Artifact abstraction")
    (description "Wasmer Artifact abstraction")
    (license (list license:expat license:asl2.0))))

(define-public rust-more-asserts-0.2
  (package
    (name "rust-more-asserts")
    (version "0.2.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "more-asserts" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "12b3fypg2sr4qmxy6wiyx6k9sdg573f5ij98cdmbrg00whnyqhvq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/thomcc/rust-more-asserts")
    (synopsis
     "Small library providing additional assert_* and debug_assert_* macros.")
    (description
     "Small library providing additional assert_* and debug_assert_* macros.")
    (license license:cc0)))

(define-public rust-loupe-derive-0.1
  (package
    (name "rust-loupe-derive")
    (version "0.1.3")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "loupe-derive" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0ljrdhp4yk87xnbdq53f679yzm7yghanxq4s5sgjfs3i6f4gryy0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/wasmerio/loupe")
    (synopsis "Profiling tool for Rust, see the `loupe` crate")
    (description "Profiling tool for Rust, see the `loupe` crate")
    (license license:expat)))

(define-public rust-loupe-0.1
  (package
    (name "rust-loupe")
    (version "0.1.3")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "loupe" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0kb3bc62xh20i405afr8bf65m6gznbp0fhxrfrg5pqaglkgp4slv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-indexmap" ,rust-indexmap-1)
                       ("rust-loupe-derive" ,rust-loupe-derive-0.1)
                       ("rust-rustversion" ,rust-rustversion-1))))
    (home-page "https://github.com/wasmerio/loupe")
    (synopsis "Profiling tool for Rust")
    (description "Profiling tool for Rust")
    (license license:expat)))

(define-public rust-wasmer-2
  (package
    (name "rust-wasmer")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wasmer" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1pxyaynmh5kcvb7k0952j47zsbs9n7b7pplpfwyyl1nhr5hq73ga"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-hashbrown" ,rust-hashbrown-0.11)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-loupe" ,rust-loupe-0.1)
                       ("rust-more-asserts" ,rust-more-asserts-0.2)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-wasmer-artifact" ,rust-wasmer-artifact-2)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-2)
                       ("rust-wasmer-compiler-cranelift" ,rust-wasmer-compiler-cranelift-2)
                       ("rust-wasmer-compiler-llvm" ,rust-wasmer-compiler-llvm-2)
                       ("rust-wasmer-compiler-singlepass" ,rust-wasmer-compiler-singlepass-2)
                       ("rust-wasmer-derive" ,rust-wasmer-derive-2)
                       ("rust-wasmer-engine" ,rust-wasmer-engine-2)
                       ("rust-wasmer-engine-dylib" ,rust-wasmer-engine-dylib-2)
                       ("rust-wasmer-engine-universal" ,rust-wasmer-engine-universal-2)
                       ("rust-wasmer-types" ,rust-wasmer-types-2)
                       ("rust-wasmer-vm" ,rust-wasmer-vm-2)
                       ("rust-wasmparser" ,rust-wasmparser-0.83)
                       ("rust-wat" ,rust-wat-1)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://wasmer.io/")
    (synopsis "High-performance WebAssembly runtime")
    (description "High-performance WebAssembly runtime")
    (license license:expat)))

(define-public rust-typetag-impl-0.1
  (package
    (name "rust-typetag-impl")
    (version "0.1.8")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "typetag-impl" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "03lw15ad39bgr4m6fmr5b9lb4wapkcfsnfxsbz0362635iw4f0g6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/dtolnay/typetag")
    (synopsis "Implementation detail of the typetag crate")
    (description "Implementation detail of the typetag crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-typetag-0.1
  (package
    (name "rust-typetag")
    (version "0.1.8")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "typetag" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "12jva00k063gb48bvx0p0ixwbq1l48411disynzvah92bd65d020"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-erased-serde" ,rust-erased-serde-0.3)
                       ("rust-inventory" ,rust-inventory-0.2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-typetag-impl" ,rust-typetag-impl-0.1))))
    (home-page "https://github.com/dtolnay/typetag")
    (synopsis "Serde serializable and deserializable trait objects")
    (description "Serde serializable and deserializable trait objects")
    (license (list license:expat license:asl2.0))))

(define-public rust-sysinfo-0.22
  (package
    (name "rust-sysinfo")
    (version "0.22.5")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "sysinfo" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0hsx8pl4yx4fkjx609pqhscklvhmr2ljqrhs8lr778h6ffqgl6vz"))))
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

(define-public rust-sixel-tokenizer-0.1
  (package
    (name "rust-sixel-tokenizer")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "sixel-tokenizer" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0xnlg3vfmh96bqj1fnj6qdgjdnl0zc6v07ww2xh4v5mc55k7y6xp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/zellij-org/sixel-tokenizer")
    (synopsis "A tokenizer for serialized Sixel bytes")
    (description
     "This package provides a tokenizer for serialized Sixel bytes")
    (license license:expat)))

(define-public rust-sixel-image-0.1
  (package
    (name "rust-sixel-image")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "sixel-image" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "17y9yykj03i47adh0bqqra659m8rd68yxmmsp50pgf26l1fhp244"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-sixel-tokenizer" ,rust-sixel-tokenizer-0.1))))
    (home-page "https://github.com/zellij-org/sixel-image")
    (synopsis
     "An interface for querying, manipulating and serializing/deserializing Sixel data")
    (description
     "An interface for querying, manipulating and serializing/deserializing Sixel data")
    (license license:expat)))

(define-public rust-highway-0.6
  (package
    (name "rust-highway")
    (version "0.6.4")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "highway" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0p9r4ss563gj44qamnrr5bqf0p9lb8gjc0w5jqmk3jlmyrlbjq9l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/nickbabcock/highway-rs")
    (synopsis
     "Native Rust port of Google's HighwayHash, which makes use of SIMD instructions for a fast and strong hash function")
    (description
     "Native Rust port of Google's HighwayHash, which makes use of SIMD instructions
for a fast and strong hash function")
    (license license:expat)))

(define-public rust-close-fds-0.3
  (package
    (name "rust-close-fds")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "close_fds" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1vd2i1gkvfcgdlzgrkgivhx3ky0zs98g8q3mwmwrxmg97pridi1v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/cptpcrd/close_fds")
    (synopsis
     "A library that makes it easy to close all open file descriptors.")
    (description
     "This package provides a library that makes it easy to close all open file
descriptors.")
    (license license:expat)))

(define-public rust-zellij-server-0.37
  (package
    (name "rust-zellij-server")
    (version "0.37.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "zellij-server" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0vif0yscxk8fkpbvzfkkjkbirm00i01rvmqndnqp5nklm696hym0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ansi-term" ,rust-ansi-term-0.12)
                       ("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-base64" ,rust-base64-0.13)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-cassowary" ,rust-cassowary-0.3)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-close-fds" ,rust-close-fds-0.3)
                       ("rust-daemonize" ,rust-daemonize-0.4)
                       ("rust-highway" ,rust-highway-0.6)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-semver" ,rust-semver-0.11)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-sixel-image" ,rust-sixel-image-0.1)
                       ("rust-sixel-tokenizer" ,rust-sixel-tokenizer-0.1)
                       ("rust-sysinfo" ,rust-sysinfo-0.22)
                       ("rust-typetag" ,rust-typetag-0.1)
                       ("rust-unicode-width" ,rust-unicode-width-0.1)
                       ("rust-url" ,rust-url-2)
                       ("rust-uuid" ,rust-uuid-0.8)
                       ("rust-wasmer" ,rust-wasmer-2)
                       ("rust-wasmer-wasi" ,rust-wasmer-wasi-2)
                       ("rust-zellij-utils" ,rust-zellij-utils-0.37))))
    (home-page "")
    (synopsis "The server-side library for Zellij")
    (description "The server-side library for Zellij")
    (license license:expat)))

(define-public rust-vte-0.11
  (package
    (name "rust-vte")
    (version "0.11.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "vte" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "15r1ff4j8ndqj9vsyil3wqwxhhl7jsz5g58f31n0h1wlpxgjn0pm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-utf8parse" ,rust-utf8parse-0.2)
                       ("rust-vte-generate-state-changes" ,rust-vte-generate-state-changes-0.1))))
    (home-page "https://github.com/alacritty/vte")
    (synopsis "Parser for implementing terminal emulators")
    (description "Parser for implementing terminal emulators")
    (license (list license:asl2.0 license:expat))))

(define-public rust-deltae-0.3
  (package
    (name "rust-deltae")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "deltae" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1d3hw9hpvicl9x0x34jr2ybjk5g5ym1lhbyz6zj31110gq8zaaap"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://gitlab.com/ryanobeirne/deltae")
    (synopsis "Calculate Delta E between two colors in CIE Lab space.")
    (description "Calculate Delta E between two colors in CIE Lab space.")
    (license license:expat)))

(define-public rust-cint-0.3
  (package
    (name "rust-cint")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "cint" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "16l9glvaxshbp3awcga3s8cdfv00gb1n2s7ixzxxjwc5yz6qf3ks"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytemuck" ,rust-bytemuck-1))))
    (home-page "https://github.com/termhn/cint")
    (synopsis
     "A lean, minimal, and stable set of types for color interoperation between crates in Rust.")
    (description
     "This package provides a lean, minimal, and stable set of types for color
interoperation between crates in Rust.")
    (license (list license:expat license:asl2.0 license:zlib))))

(define-public rust-csscolorparser-0.6
  (package
    (name "rust-csscolorparser")
    (version "0.6.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "csscolorparser" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1gxh11hajx96mf5sd0az6mfsxdryfqvcfcphny3yfbfscqq7sapb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cint" ,rust-cint-0.3)
                       ("rust-lab" ,rust-lab-0.11)
                       ("rust-phf" ,rust-phf-0.11)
                       ("rust-rgb" ,rust-rgb-0.8)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/mazznoer/csscolorparser-rs")
    (synopsis "CSS color parser library")
    (description "CSS color parser library")
    (license (list license:expat license:asl2.0))))

(define-public rust-wezterm-color-types-0.2
  (package
    (name "rust-wezterm-color-types")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wezterm-color-types" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0xvphmrqgg69v9l879xj5lq010z13f5ixi854ykmny6j7m47lvjc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-csscolorparser" ,rust-csscolorparser-0.6)
                       ("rust-deltae" ,rust-deltae-0.3)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-wezterm-dynamic" ,rust-wezterm-dynamic-0.1))))
    (home-page "https://github.com/wez/wezterm")
    (synopsis "Types for working with colors")
    (description "Types for working with colors")
    (license license:expat)))

(define-public rust-wezterm-dynamic-derive-0.1
  (package
    (name "rust-wezterm-dynamic-derive")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wezterm-dynamic-derive" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1w07qf8njyq19nxi9vpshwprk00blhzg9ybis2rhfba433rmx7qc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/wez/wezterm")
    (synopsis
     "config serialization for wezterm via dynamic json-like data values")
    (description
     "config serialization for wezterm via dynamic json-like data values")
    (license license:expat)))

(define-public rust-wezterm-dynamic-0.1
  (package
    (name "rust-wezterm-dynamic")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wezterm-dynamic" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1al8fmfr852m62mlcr0v2lg3a18icl2sv79zv7jnv9v0rk07hpm7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4)
                       ("rust-ordered-float" ,rust-ordered-float-3)
                       ("rust-strsim" ,rust-strsim-0.10)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wezterm-dynamic-derive" ,rust-wezterm-dynamic-derive-0.1))))
    (home-page "https://github.com/wez/wezterm")
    (synopsis
     "config serialization for wezterm via dynamic json-like data values")
    (description
     "config serialization for wezterm via dynamic json-like data values")
    (license license:expat)))

(define-public rust-wezterm-bidi-0.2
  (package
    (name "rust-wezterm-bidi")
    (version "0.2.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wezterm-bidi" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0dkcwscvlwnv6lnagxfb08rcd21gfyrxbr7afcjaj3wvycn3hq0m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4)
                       ("rust-wezterm-dynamic" ,rust-wezterm-dynamic-0.1))))
    (home-page "https://github.com/wez/wezterm")
    (synopsis "The Unicode Bidi Algorithm (UBA)")
    (description "The Unicode Bidi Algorithm (UBA)")
    (license (list license:expat))))

(define-public rust-vtparse-0.6
  (package
    (name "rust-vtparse")
    (version "0.6.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "vtparse" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1l5yz9650zhkaffxn28cvfys7plcw2wd6drajyf41pshn37jm6vd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-utf8parse" ,rust-utf8parse-0.2))))
    (home-page "https://github.com/wez/wezterm")
    (synopsis "Low level escape sequence parser")
    (description "Low level escape sequence parser")
    (license license:expat)))

(define-public rust-memmem-0.1
  (package
    (name "rust-memmem")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "memmem" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "05ccifqgxdfxk6yls41ljabcccsz3jz6549l1h3cwi17kr494jm6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "http://github.com/jneem/memmem")
    (synopsis "Substring searching")
    (description "Substring searching")
    (license (list license:expat license:asl2.0))))

(define-public rust-finl-unicode-1
  (package
    (name "rust-finl-unicode")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "finl_unicode" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1ipdx778849czik798sjbgk5yhwxqybydac18d2g9jb20dxdrkwg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://finl.xyz")
    (synopsis
     "Library for handling Unicode functionality for finl (categories and grapheme segmentation)")
    (description
     "Library for handling Unicode functionality for finl (categories and grapheme
segmentation)")
    (license (list license:expat license:asl2.0))))

(define-public rust-filedescriptor-0.8
  (package
    (name "rust-filedescriptor")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "filedescriptor" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0vplyh0cw35kzq7smmp2ablq0zsknk5rkvvrywqsqfrchmjxk6bi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/wez/wezterm")
    (synopsis "More ergonomic wrappers around RawFd and RawHandle")
    (description "More ergonomic wrappers around RawFd and RawHandle")
    (license license:expat)))

(define-public rust-termwiz-0.20
  (package
    (name "rust-termwiz")
    (version "0.20.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "termwiz" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1yj80sli95wcw0im2iic9h7mx20hms3f9shxk7jarjqgl5waj2cm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-base64" ,rust-base64-0.21)
                       ("rust-bitflags" ,rust-bitflags-1)
                       ("rust-cassowary" ,rust-cassowary-0.3)
                       ("rust-filedescriptor" ,rust-filedescriptor-0.8)
                       ("rust-finl-unicode" ,rust-finl-unicode-1)
                       ("rust-fixedbitset" ,rust-fixedbitset-0.4)
                       ("rust-fnv" ,rust-fnv-1)
                       ("rust-hex" ,rust-hex-0.4)
                       ("rust-image" ,rust-image-0.24)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-memmem" ,rust-memmem-0.1)
                       ("rust-nix" ,rust-nix-0.24)
                       ("rust-num-derive" ,rust-num-derive-0.3)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-ordered-float" ,rust-ordered-float-3)
                       ("rust-pest" ,rust-pest-2)
                       ("rust-pest-derive" ,rust-pest-derive-2)
                       ("rust-phf" ,rust-phf-0.10)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-semver" ,rust-semver-0.11)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sha2" ,rust-sha2-0.9)
                       ("rust-signal-hook" ,rust-signal-hook-0.1.17)
                       ("rust-siphasher" ,rust-siphasher-0.3)
                       ("rust-terminfo" ,rust-terminfo-0.7)
                       ("rust-termios" ,rust-termios-0.3)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-ucd-trie" ,rust-ucd-trie-0.1)
                       ("rust-unicode-segmentation" ,rust-unicode-segmentation-1)
                       ("rust-vtparse" ,rust-vtparse-0.6)
                       ("rust-wezterm-bidi" ,rust-wezterm-bidi-0.2)
                       ("rust-wezterm-color-types" ,rust-wezterm-color-types-0.2)
                       ("rust-wezterm-dynamic" ,rust-wezterm-dynamic-0.1)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/wez/wezterm")
    (synopsis "Terminal Wizardry for Unix and Windows")
    (description "Terminal Wizardry for Unix and Windows")
    (license license:expat)))

(define-public rust-regex-syntax-0.7
  (package
    (name "rust-regex-syntax")
    (version "0.7.4")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "regex-syntax" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1qjczlc2w92kamn9ipjdr5pjql0jnccahpi9l3r6wp0rnsjr5sp5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1))))
    (home-page "https://github.com/rust-lang/regex/tree/master/regex-syntax")
    (synopsis "A regular expression parser.")
    (description "This package provides a regular expression parser.")
    (license (list license:expat license:asl2.0))))

(define-public rust-aho-corasick-1
  (package
    (name "rust-aho-corasick")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "aho-corasick" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0has59a3571irggpk5z8c0lpnx8kdx12qf4g2x0560i2y8dwpxj3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4)
                       ("rust-memchr" ,rust-memchr-2))))
    (home-page "https://github.com/BurntSushi/aho-corasick")
    (synopsis "Fast multiple substring searching.")
    (description "Fast multiple substring searching.")
    (license (list license:unlicense license:expat))))

(define-public rust-regex-automata-0.3
  (package
    (name "rust-regex-automata")
    (version "0.3.6")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "regex-automata" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0s9vir4xmrqi4ccjydxfi6fnw45x714qxp69a3pdmpd127zwxlgy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-aho-corasick" ,rust-aho-corasick-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-regex-syntax" ,rust-regex-syntax-0.7))))
    (home-page "https://github.com/rust-lang/regex/tree/master/regex-automata")
    (synopsis "Automata construction and matching using regular expressions.")
    (description
     "Automata construction and matching using regular expressions.")
    (license (list license:expat license:asl2.0))))

(define-public rust-bstr-1
  (package
    (name "rust-bstr")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "bstr" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "01bvsr3x9n75klbwxym0zf939vzim0plsmy786p0zzzvrj6i9637"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-memchr" ,rust-memchr-2)
                       ("rust-regex-automata" ,rust-regex-automata-0.3)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/BurntSushi/bstr")
    (synopsis "A string type that is not required to be valid UTF-8.")
    (description
     "This package provides a string type that is not required to be valid UTF-8.")
    (license (list license:expat license:asl2.0))))

(define-public rust-shellexpand-3
  (package
    (name "rust-shellexpand")
    (version "3.1.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "shellexpand" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0jz1i14ziz8gbyj71212s7dqrw6q96f25i48zkmy66fcjhxzl0ys"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bstr" ,rust-bstr-1)
                       ("rust-dirs" ,rust-dirs-4)
                       ("rust-os-str-bytes" ,rust-os-str-bytes-6))))
    (home-page "https://gitlab.com/ijackson/rust-shellexpand")
    (synopsis "Shell-like expansions in strings")
    (description "Shell-like expansions in strings")
    (license (list license:expat license:asl2.0))))

(define-public rust-rmp-0.8
  (package
    (name "rust-rmp")
    (version "0.8.12")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "rmp" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "083bbqw8ibqp63v6scmaxmy5x8yznj4j0i2n6jjivv9qrjk6163z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-paste" ,rust-paste-1))))
    (home-page "https://github.com/3Hren/msgpack-rust")
    (synopsis "Pure Rust MessagePack serialization implementation")
    (description "Pure Rust MessagePack serialization implementation")
    (license license:expat)))

(define-public rust-rmp-serde-1
  (package
    (name "rust-rmp-serde")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "rmp-serde" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "12i5aglyni58hlq19pi58z1z6a1hv6l04p9y8ms8l3cqx9gaizmz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-rmp" ,rust-rmp-0.8)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/3Hren/msgpack-rust")
    (synopsis "Serde bindings for RMP")
    (description "Serde bindings for RMP")
    (license license:expat)))

(define-public rust-notify-6
  (package
    (name "rust-notify")
    (version "6.0.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "notify" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0lcbb6kfsrbjjzapq61402f711hi1337cv9dxjmj1sjpbmws4f2p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-crossbeam-channel" ,rust-crossbeam-channel-0.5)
                       ("rust-filetime" ,rust-filetime-0.2)
                       ("rust-fsevent-sys" ,rust-fsevent-sys-4)
                       ("rust-inotify" ,rust-inotify-0.9)
                       ("rust-kqueue" ,rust-kqueue-1)
                       ("rust-kqueue" ,rust-kqueue-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-mio" ,rust-mio-0.8)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-walkdir" ,rust-walkdir-2)
                       ("rust-windows-sys" ,rust-windows-sys-0.45))))
    (home-page "https://github.com/notify-rs/notify")
    (synopsis "Cross-platform filesystem notification library")
    (description "Cross-platform filesystem notification library")
    (license (list license:cc0 license:artistic2.0))))

(define-public rust-file-id-0.1
  (package
    (name "rust-file-id")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "file-id" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1hx8zmiqpydj4b471nd1llj1jb8bmjxbwqmq1jy92bm8dhgfffz1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1)
                       ("rust-winapi-util" ,rust-winapi-util-0.1))))
    (home-page "https://github.com/notify-rs/notify")
    (synopsis "Platform independent file id library")
    (description "Platform independent file id library")
    (license (list license:cc0 license:artistic2.0))))

(define-public rust-notify-debouncer-full-0.1
  (package
    (name "rust-notify-debouncer-full")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "notify-debouncer-full" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "06a2wsi514dhrq8q5ghsvkgwj7n0pliid5plipxpdrwvnhg2r0gl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-crossbeam-channel" ,rust-crossbeam-channel-0.5)
                       ("rust-file-id" ,rust-file-id-0.1)
                       ("rust-notify" ,rust-notify-6)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-walkdir" ,rust-walkdir-2))))
    (home-page "https://github.com/notify-rs/notify")
    (synopsis "notify event debouncer optimized for ease of use")
    (description "notify event debouncer optimized for ease of use")
    (license (list license:cc0 license:artistic2.0))))

(define-public rust-destructure-traitobject-0.2
  (package
    (name "rust-destructure-traitobject")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "destructure_traitobject" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1ir5x9f5zksr1fs788jy5g2hyyc2hnnx7kwi87wd451wd5apb1rw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page
     "https://github.com/philip-peterson/destructure_traitobject.git")
    (synopsis
     "Unsafe helpers for working with raw trait objects. (Forked from traitobject)")
    (description
     "Unsafe helpers for working with raw trait objects. (Forked from traitobject)")
    (license (list license:expat license:asl2.0))))

(define-public rust-unsafe-any-ors-1
  (package
    (name "rust-unsafe-any-ors")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "unsafe-any-ors" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1bf0hxfhb3gh9hy8pw6l0jaqjprzn9w1vnfph2b2sdk50v9h78z0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-destructure-traitobject" ,rust-destructure-traitobject-0.2))))
    (home-page "https://github.com/orphanage-rs/rust-unsafe-any")
    (synopsis "Traits and implementations for unchecked downcasting.")
    (description "Traits and implementations for unchecked downcasting.")
    (license license:expat)))

(define-public rust-typemap-ors-1
  (package
    (name "rust-typemap-ors")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "typemap-ors" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0rw8lbbh8aarfacyz133p0pqq1gj96fypk2c3s7x2bgh0yvj9356"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-unsafe-any-ors" ,rust-unsafe-any-ors-1))))
    (home-page "https://github.com/orphanage-rs/rust-typemap")
    (synopsis "A typesafe store for many value types.")
    (description
     "This package provides a typesafe store for many value types.")
    (license license:expat)))

(define-public rust-log-mdc-0.1
  (package
    (name "rust-log-mdc")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "log-mdc" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1iw1x3qhjvrac35spikn5h06a1rxd9vw216jk8h52jhz9i0j2kd9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/sfackler/rust-log-mdc")
    (synopsis "A mapped diagnostic context (MDC) for use with the `log` crate")
    (description
     "This package provides a mapped diagnostic context (MDC) for use with the `log`
crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-log4rs-1
  (package
    (name "rust-log4rs")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "log4rs" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1z9kfnba38smyrpmq49pjl82yqbvj2h81m3878cvhycydmwa2v6k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-arc-swap" ,rust-arc-swap-1)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-derivative" ,rust-derivative-2)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-fnv" ,rust-fnv-1)
                       ("rust-humantime" ,rust-humantime-2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-log-mdc" ,rust-log-mdc-0.1)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-value" ,rust-serde-value-0.7)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-serde-yaml" ,rust-serde-yaml-0.8)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-thread-id" ,rust-thread-id-4)
                       ("rust-toml" ,rust-toml-0.5)
                       ("rust-typemap-ors" ,rust-typemap-ors-1)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/estk/log4rs")
    (synopsis
     "A highly configurable multi-output logging implementation for the `log` facade")
    (description
     "This package provides a highly configurable multi-output logging implementation
for the `log` facade")
    (license (list license:expat license:asl2.0))))

(define-public rust-supports-unicode-2
  (package
    (name "rust-supports-unicode")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "supports-unicode" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1xxscsdjmdp7i3ikqnnivfn4hnpy4gp9as4hshgd4pdb82r2qv2b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-is-terminal" ,rust-is-terminal-0.4))))
    (home-page "https://github.com/zkat/supports-unicode")
    (synopsis "Detects whether a terminal supports unicode.")
    (description "Detects whether a terminal supports unicode.")
    (license license:asl2.0)))

(define-public rust-supports-hyperlinks-2
  (package
    (name "rust-supports-hyperlinks")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "supports-hyperlinks" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0g93nh1db3f9lyd0ry35bqjrxkg6sbysn36x9hgd9m5h5rlk2hpq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-is-terminal" ,rust-is-terminal-0.4))))
    (home-page "https://github.com/zkat/supports-hyperlinks")
    (synopsis "Detects whether a terminal supports rendering hyperlinks.")
    (description "Detects whether a terminal supports rendering hyperlinks.")
    (license license:asl2.0)))

(define-public rust-is-ci-1
  (package
    (name "rust-is-ci")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "is_ci" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1ywra2z56x6d4pc02zq24a4x7gvpixynh9524icbpchbf9ydwv31"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/zkat/is_ci")
    (synopsis
     "Super lightweight CI environment checker. Just tells you if you're in CI or not without much fuss.")
    (description
     "Super lightweight CI environment checker.  Just tells you if you're in CI or not
without much fuss.")
    (license license:isc)))

(define-public rust-supports-color-2
  (package
    (name "rust-supports-color")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "supports-color" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0m5kayz225f23k5jyjin82sfkrqhfdq3j72ianafkazz9cbyfl29"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-is-terminal" ,rust-is-terminal-0.4)
                       ("rust-is-ci" ,rust-is-ci-1))))
    (home-page "https://github.com/zkat/supports-color")
    (synopsis
     "Detects whether a terminal supports color, and gives details about that support.")
    (description
     "Detects whether a terminal supports color, and gives details about that support.")
    (license license:asl2.0)))

(define-public rust-owo-colors-3
  (package
    (name "rust-owo-colors")
    (version "3.6.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "owo-colors" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0943lynkwz1glq3w7m9anv73lnrhd8yabs09krbh49g1wz4lxp39"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-supports-color" ,rust-supports-color-2))))
    (home-page "https://github.com/jam1garner/owo-colors")
    (synopsis "Zero-allocation terminal colors that'll make people go owo")
    (description "Zero-allocation terminal colors that'll make people go owo")
    (license license:expat)))

(define-public rust-miette-derive-5
  (package
    (name "rust-miette-derive")
    (version "5.10.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "miette-derive" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0p33msrngkxlp5ajm8nijamii9vcwwpy8gfh4m53qnmrc0avrrs9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/zkat/miette")
    (synopsis "Derive macros for miette. Like `thiserror` for Diagnostics.")
    (description
     "Derive macros for miette.  Like `thiserror` for Diagnostics.")
    (license license:asl2.0)))

(define-public rust-backtrace-ext-0.2
  (package
    (name "rust-backtrace-ext")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "backtrace-ext" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0l4xacjnx4jrn9k14xbs2swks018mviq03sp7c1gn62apviywysk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-backtrace" ,rust-backtrace-0.3))))
    (home-page "https://github.com/gankra/backtrace-ext")
    (synopsis "minor conveniences on top of the backtrace crate")
    (description "minor conveniences on top of the backtrace crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-miette-5
  (package
    (name "rust-miette")
    (version "5.10.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "miette" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0vl5qvl3bgha6nnkdl7kiha6v4ypd6d51wyc4q1bvdpamr75ifsr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-backtrace-ext" ,rust-backtrace-ext-0.2)
                       ("rust-is-terminal" ,rust-is-terminal-0.4)
                       ("rust-miette-derive" ,rust-miette-derive-5)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-owo-colors" ,rust-owo-colors-3)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-supports-color" ,rust-supports-color-2)
                       ("rust-supports-hyperlinks" ,rust-supports-hyperlinks-2)
                       ("rust-supports-unicode" ,rust-supports-unicode-2)
                       ("rust-terminal-size" ,rust-terminal-size-0.1)
                       ("rust-textwrap" ,rust-textwrap-0.15)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://github.com/zkat/miette")
    (synopsis
     "Fancy diagnostic reporting library and protocol for us mere mortals who aren't compiler hackers.")
    (description
     "Fancy diagnostic reporting library and protocol for us mere mortals who aren't
compiler hackers.")
    (license license:asl2.0)))

(define-public rust-kdl-4
  (package
    (name "rust-kdl")
    (version "4.6.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "kdl" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0ixfa7lyij6iars58r633164dm14707a816883ypddnch9a8fb06"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-miette" ,rust-miette-5)
                       ("rust-nom" ,rust-nom-7)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://kdl.dev")
    (synopsis
     "Document-oriented KDL parser and API. Allows formatting/whitespace/comment-preserving parsing and modification of KDL text.")
    (description
     "Document-oriented KDL parser and API. Allows
formatting/whitespace/comment-preserving parsing and modification of KDL text.")
    (license license:asl2.0)))

(define-public rust-to-method-1
  (package
    (name "rust-to-method")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "to_method" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1s72l06fnb5kv6vm5ds0lilg1dyciyyis09ypi5kij0mrbpcxi67"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/whentze/to_method")
    (synopsis "A utility micro-crate for using Into more ergonomically.")
    (description
     "This package provides a utility micro-crate for using Into more ergonomically.")
    (license license:cc0)))

(define-public rust-spinning-0.1
  (package
    (name "rust-spinning")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "spinning" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0yrs2lzyyrwvs58pya2h22pfdx3vv0h76w1av5c2dbbw5630wkrd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-lock-api" ,rust-lock-api-0.4))))
    (home-page "https://github.com/4lDO2/spinning-rs.git")
    (synopsis "Mutexes and SIX locks implemented by spinning")
    (description "Mutexes and SIX locks implemented by spinning")
    (license (list license:expat license:asl2.0))))

(define-public rust-intmap-0.7
  (package
    (name "rust-intmap")
    (version "0.7.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "intmap" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1ffph34qfda5zxdvy2pvjnip9hgzbjcxw53pvdpcjaxc8n7z4lmf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/JesperAxelsson/rust-intmap")
    (synopsis "Specialized HashMap for u64 keys")
    (description "Specialized HashMap for u64 keys")
    (license license:expat)))

(define-public rust-interprocess-1
  (package
    (name "rust-interprocess")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "interprocess" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1yrq3xmyf8c506z2fkiyqcxiqv21rap72fz6npizybz47czm7wl1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-blocking" ,rust-blocking-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-io" ,rust-futures-io-0.3)
                       ("rust-intmap" ,rust-intmap-0.7)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rustc-version" ,rust-rustc-version-0.4)
                       ("rust-spinning" ,rust-spinning-0.1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-to-method" ,rust-to-method-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/kotauskas/interprocess")
    (synopsis "Interprocess communication toolkit")
    (description "Interprocess communication toolkit")
    (license (list license:expat license:asl2.0))))

(define-public rust-colorsys-0.6
  (package
    (name "rust-colorsys")
    (version "0.6.7")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "colorsys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1g8vwcv89n2dzi9bmbzqlj9cl9a89jz49668grbcncv4cjx1l9jl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/emgyrz/colorsys.rs")
    (synopsis
     "A module for color conversion and mutation. Works with RGB(a)( as hexadecimal too), HSL(a), CMYK color models and with ANSI color codes")
    (description
     "This package provides a module for color conversion and mutation.  Works with
RGB(a)( as hexadecimal too), HSL(a), CMYK color models and with ANSI color codes")
    (license license:expat)))

(define-public rust-concurrent-queue-2
  (package
    (name "rust-concurrent-queue")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "concurrent-queue" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0z0bnpgcblhrms6gph7x78yplj3qmlr5mvl38v9641zsxiqngv32"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-crossbeam-utils" ,rust-crossbeam-utils-0.8)
                       ("rust-loom" ,rust-loom-0.5)
                       ("rust-portable-atomic" ,rust-portable-atomic-1))))
    (home-page "https://github.com/smol-rs/concurrent-queue")
    (synopsis "Concurrent multi-producer multi-consumer queue")
    (description "Concurrent multi-producer multi-consumer queue")
    (license (list license:asl2.0 license:expat))))

(define-public rust-async-channel-1
  (package
    (name "rust-async-channel")
    (version "1.9.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "async-channel" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0dbdlkzlncbibd3ij6y6jmvjd0cmdn48ydcfdpfhw09njd93r5c1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-concurrent-queue" ,rust-concurrent-queue-2)
                       ("rust-event-listener" ,rust-event-listener-2)
                       ("rust-futures-core" ,rust-futures-core-0.3))))
    (home-page "https://github.com/smol-rs/async-channel")
    (synopsis "Async multi-producer multi-consumer channel")
    (description "Async multi-producer multi-consumer channel")
    (license (list license:asl2.0 license:expat))))

(define-public rust-zellij-utils-0.37
  (package
    (name "rust-zellij-utils")
    (version "0.37.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "zellij-utils" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "18nvxs90il56dxhyhmd3h48fgv1shv1g9dbvj88ph67qb9347h6i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-async-channel" ,rust-async-channel-1)
                       ("rust-async-std" ,rust-async-std-1.7)
                       ("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-clap" ,rust-clap-3)
                       ("rust-clap-complete" ,rust-clap-complete-3)
                       ("rust-colored" ,rust-colored-2)
                       ("rust-colorsys" ,rust-colorsys-0.6)
                       ("rust-crossbeam" ,rust-crossbeam-0.8)
                       ("rust-directories-next" ,rust-directories-next-2)
                       ("rust-include-dir" ,rust-include-dir-0.7)
                       ("rust-interprocess" ,rust-interprocess-1)
                       ("rust-kdl" ,rust-kdl-4)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-log4rs" ,rust-log4rs-1)
                       ("rust-miette" ,rust-miette-5)
                       ("rust-nix" ,rust-nix-0.23)
                       ("rust-notify-debouncer-full" ,rust-notify-debouncer-full-0.1)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-rmp-serde" ,rust-rmp-serde-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-shellexpand" ,rust-shellexpand-3)
                       ("rust-signal-hook" ,rust-signal-hook-0.3)
                       ("rust-strip-ansi-escapes" ,rust-strip-ansi-escapes-0.1)
                       ("rust-strum" ,rust-strum-0.20)
                       ("rust-strum-macros" ,rust-strum-macros-0.20)
                       ("rust-tempfile" ,rust-tempfile-3)
                       ("rust-termwiz" ,rust-termwiz-0.20)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-unicode-width" ,rust-unicode-width-0.1)
                       ("rust-url" ,rust-url-2)
                       ("rust-uuid" ,rust-uuid-0.8)
                       ("rust-vte" ,rust-vte-0.11))))
    (home-page "")
    (synopsis "A utility library for Zellij client and server")
    (description
     "This package provides a utility library for Zellij client and server")
    (license license:expat)))

(define-public rust-zellij-client-0.37
  (package
    (name "rust-zellij-client")
    (version "0.37.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "zellij-client" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1xv23ba7y6s5qfdrs0wfnakghypiz2y3idr12gz4ygd7vwayxri1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4)
                       ("rust-mio" ,rust-mio-0.7)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-serde-yaml" ,rust-serde-yaml-0.8)
                       ("rust-url" ,rust-url-2)
                       ("rust-zellij-utils" ,rust-zellij-utils-0.37))))
    (home-page "")
    (synopsis "The client-side library for Zellij")
    (description "The client-side library for Zellij")
    (license license:expat)))

(define-public rust-syn-2
  (package
    (name "rust-syn")
    (version "2.0.28")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "syn" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0rqm6lnxdgg5blva19l2sjr7iwj2r5dwb3cx32r4iqzmndsijdh4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-unicode-ident" ,rust-unicode-ident-1))))
    (home-page "https://github.com/dtolnay/syn")
    (synopsis "Parser for Rust source code")
    (description "Parser for Rust source code")
    (license (list license:expat license:asl2.0))))

(define-public rust-thiserror-impl-1
  (package
    (name "rust-thiserror-impl")
    (version "1.0.44")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "thiserror-impl" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "15nwh6qfwxlwimgij1p6ajb377p4rlvvc6sx7amiz11h959rh089"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/dtolnay/thiserror")
    (synopsis "Implementation detail of the `thiserror` crate")
    (description "Implementation detail of the `thiserror` crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-lev-distance-0.1
  (package
    (name "rust-lev-distance")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "lev_distance" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0pk26fp1fcjyg2ml8g5ma1jj2gvgnmmri4md8y3bqdjr46yx3nbj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/ken-matsui/lev_distance#readme")
    (synopsis
     "A copy of Levenshtein distance implementation from Rust Compiler")
    (description
     "This package provides a copy of Levenshtein distance implementation from Rust
Compiler")
    (license license:expat)))

(define-public rust-suggest-0.4
  (package
    (name "rust-suggest")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "suggest" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0nb6axl4i58g7k0q3p3bg6m363aw6qnqdg31y5c8b43x6bbd0n15"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-clap" ,rust-clap-3)
                       ("rust-lev-distance" ,rust-lev-distance-0.1))))
    (home-page "https://github.com/ken-matsui/suggest#readme")
    (synopsis
     "A minimal library to provide similar name suggestions like \"Did you mean?\"")
    (description
     "This package provides a minimal library to provide similar name suggestions like
\"Did you mean?\"")
    (license license:expat)))

(define-public rust-names-0.14
  (package
    (name "rust-names")
    (version "0.14.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "names" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1g1rxifcsvj9zj2nmwbdix8b5ynpghs4rq40vs966jqlylxwvpbv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-clap" ,rust-clap-3)
                       ("rust-rand" ,rust-rand-0.8))))
    (home-page "https://github.com/fnichol/names")
    (synopsis
     "A random name generator with names suitable for use in container
instances, project names, application instances, etc.
")
    (description
     "This package provides a random name generator with names suitable for use in
container instances, project names, application instances, etc.")
    (license license:expat)))

(define-public rust-insta-1.18
  (package
    (name "rust-insta")
    (version "1.18.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "insta" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0w6rinbqj8ncv68hicyi6vw3k4m5xyx9xm2g8pq2w1ls1k0sxaap"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-console" ,rust-console-0.15)
                       ("rust-csv" ,rust-csv-1)
                       ("rust-globset" ,rust-globset-0.4)
                       ("rust-linked-hash-map" ,rust-linked-hash-map-0.5)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-pest" ,rust-pest-2)
                       ("rust-pest-derive" ,rust-pest-derive-2)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-ron" ,rust-ron-0.7)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-similar" ,rust-similar-2)
                       ("rust-toml" ,rust-toml-0.5)
                       ("rust-walkdir" ,rust-walkdir-2)
                       ("rust-yaml-rust" ,rust-yaml-rust-0.4))
       #:cargo-development-inputs (("rust-serde" ,rust-serde-1)
                                   ("rust-similar-asserts" ,rust-similar-asserts-1))))
    (home-page "https://insta.rs/")
    (synopsis "A snapshot testing library for Rust")
    (description "This package provides a snapshot testing library for Rust")
    (license license:asl2.0)))

(define-public rust-rkyv-0.7.20
  (package
    (name "rust-rkyv")
    (version "0.7.20")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "rkyv" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0g62fjcbj1f2bz87m4w9dq3ghp9h6lamcwihpz2232q81piv46g4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bytecheck" ,rust-bytecheck-0.6)
                       ("rust-hashbrown" ,rust-hashbrown-0.11)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-ptr-meta" ,rust-ptr-meta-0.1)
                       ("rust-rend" ,rust-rend-0.3)
                       ("rust-rkyv-derive" ,rust-rkyv-derive-0.7.20)
                       ("rust-seahash" ,rust-seahash-4)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-tinyvec" ,rust-tinyvec-1)
                       ("rust-uuid" ,rust-uuid-0.8))))
    (home-page "https://github.com/rkyv/rkyv")
    (synopsis "Zero-copy deserialization framework for Rust")
    (description "Zero-copy deserialization framework for Rust")
    (license license:expat)))

(define-public rust-async-global-executor-1
  (package
    (name "rust-async-global-executor")
    (version "1.4.3")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "async-global-executor" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "017s1lik153s587l6q9x5bf9i1n7gxqcg3zn2mdgvf16rm4rn1vk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-executor" ,rust-async-executor-1)
                       ("rust-async-io" ,rust-async-io-1)
                       ("rust-futures-lite" ,rust-futures-lite-1)
                       ("rust-num-cpus" ,rust-num-cpus-1)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-tokio" ,rust-tokio-0.3)
                       ("rust-tokio" ,rust-tokio-0.2))))
    (home-page "https://github.com/Keruspe/async-global-executor")
    (synopsis "A global executor built on top of async-executor and async-io")
    (description
     "This package provides a global executor built on top of async-executor and
async-io")
    (license (list license:asl2.0 license:expat))))

(define-public rust-async-std-1.7
  (package
    (name "rust-async-std")
    (version "1.7.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "async-std" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "18fajhai6gypmjhdwz5ri826iw2jkm1wbr3hzyymv8k5phw2bs57"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-async-attributes" ,rust-async-attributes-1)
                       ("rust-async-global-executor" ,rust-async-global-executor-1)
                       ("rust-async-io" ,rust-async-io-1)
                       ("rust-async-mutex" ,rust-async-mutex-1)
                       ("rust-blocking" ,rust-blocking-1)
                       ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.8)
                       ("rust-futures-channel" ,rust-futures-channel-0.3)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-io" ,rust-futures-io-0.3)
                       ("rust-futures-lite" ,rust-futures-lite-1)
                       ("rust-gloo-timers" ,rust-gloo-timers-0.2)
                       ("rust-kv-log-macro" ,rust-kv-log-macro-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-num-cpus" ,rust-num-cpus-1)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.1)
                       ("rust-pin-utils" ,rust-pin-utils-0.1)
                       ("rust-slab" ,rust-slab-0.4)
                       ("rust-surf" ,rust-surf-2)
                       ("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4))
       #:cargo-development-inputs (("rust-femme" ,rust-femme-2)
                                   ("rust-futures" ,rust-futures-0.3)
                                   ("rust-rand" ,rust-rand-0.7)
                                   ("rust-rand-xorshift" ,rust-rand-xorshift-0.2)
                                   ("rust-tempfile" ,rust-tempfile-3)
                                   ("rust-wasm-bindgen-test" ,rust-wasm-bindgen-test-0.3))))
    (home-page "https://async.rs")
    (synopsis "Async version of the Rust standard library")
    (description "Async version of the Rust standard library")
    (license (list license:asl2.0 license:expat))))

(define-public rust-signal-hook-0.1.17
  (package
    (name "rust-signal-hook")
    (version "0.1.17")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "signal-hook" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0a97migr3gcy4sfkgxdp29082s3f3lbf4was3dkpl13gq51d8cby"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-futures" ,rust-futures-0.1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-mio" ,rust-mio-0.7)
                       ("rust-mio" ,rust-mio-0.6)
                       ("rust-signal-hook-registry" ,rust-signal-hook-registry-1)
                       ("rust-tokio-reactor" ,rust-tokio-reactor-0.1))
       #:cargo-development-inputs (("rust-mio" ,rust-mio-0.7)
                                   ("rust-tokio" ,rust-tokio-0.1)
                                   ("rust-version-sync" ,rust-version-sync-0.8))))
    (home-page "https://github.com/vorner/signal-hook")
    (synopsis "Unix signal handling")
    (description "Unix signal handling")
    (license (list license:asl2.0 license:expat))))

(define-public rust-rkyv-derive-0.7.20
  (package
    (name "rust-rkyv-derive")
    (version "0.7.20")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "rkyv_derive" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1prx39vv1f8s5dn1jy5x14xf7i4jkrr62k1ghkqg458gm15qrr9a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/rkyv/rkyv")
    (synopsis "Derive macro for rkyv")
    (description "Derive macro for rkyv")
    (license license:expat)))
