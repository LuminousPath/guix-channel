(define-module (lp packages crates-extra)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages crates-web)
  #:use-module (gnu packages crates-windows)
  #:use-module (gnu packages crates-apple)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages sequoia)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages crates-crypto)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:))

(define-public rust-ssh2-0.9.4
  (package
    (name "rust-ssh2")
    (version "0.9.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ssh2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0malilb9lbzlh3i24nb6s61lmz5as801swy30ib6v7sm20cldzp7"))))
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
commands, forwarding local ports, etc.")
    (description
     "This package provides Bindings to libssh2 for interacting with SSH servers and executing remote
commands, forwarding local ports, etc.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasmer-wit-bindgen-rust-impl-0.1
  (package
    (name "rust-wasmer-wit-bindgen-rust-impl")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-wit-bindgen-rust-impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11bv0ny7nypw97b38rhbfpkm3gfz2csd25xhf2c13llbs00gw9mx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-syn" ,rust-syn-1)
                       ("rust-wasmer-wit-bindgen-gen-core" ,rust-wasmer-wit-bindgen-gen-core-0.1)
                       ("rust-wasmer-wit-bindgen-gen-rust-wasm" ,rust-wasmer-wit-bindgen-gen-rust-wasm-0.1))))
    (home-page "")
    (synopsis "wit-bindgen-gen-c")
    (description "This package provides wit-bindgen-gen-c.")
    (license license:asl2.0)))

(define-public rust-wasmer-wit-bindgen-rust-0.1
  (package
    (name "rust-wasmer-wit-bindgen-rust")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-wit-bindgen-rust" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "134iik2psvkfa035bfn39qxx36yv454mv70dnywslx0z4zqlg1wn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-bitflags" ,rust-bitflags-1)
                       ("rust-wasmer-wit-bindgen-rust-impl" ,rust-wasmer-wit-bindgen-rust-impl-0.1))))
    (home-page "")
    (synopsis "Wit-bindgen-gen-c")
    (description "This package provides wit-bindgen-gen-c.")
    (license license:asl2.0)))

(define-public rust-wasmer-wit-bindgen-gen-rust-0.1
  (package
    (name "rust-wasmer-wit-bindgen-gen-rust")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-wit-bindgen-gen-rust" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0frwkhhn1r0lq6wb12p581jgrdd98cj336yc03qjp1498mycx2s3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-heck" ,rust-heck-0.3)
                       ("rust-wasmer-wit-bindgen-gen-core" ,rust-wasmer-wit-bindgen-gen-core-0.1))))
    (home-page "")
    (synopsis "wit-bindgen-gen-c")
    (description "This package provides wit-bindgen-gen-c.")
    (license license:asl2.0)))

(define-public rust-wasmer-wit-bindgen-gen-rust-wasm-0.1
  (package
    (name "rust-wasmer-wit-bindgen-gen-rust-wasm")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-wit-bindgen-gen-rust-wasm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1z5swyz3cksn4688647p3pgxd59gbrf8l59yw501hngfrxl52psh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-heck" ,rust-heck-0.3)
                       ("rust-structopt" ,rust-structopt-0.3)
                       ("rust-wasmer-wit-bindgen-gen-core" ,rust-wasmer-wit-bindgen-gen-core-0.1)
                       ("rust-wasmer-wit-bindgen-gen-rust" ,rust-wasmer-wit-bindgen-gen-rust-0.1))))
    (home-page "")
    (synopsis "Wit-bindgen-gen-c")
    (description "This package provides wit-bindgen-gen-c.")
    (license license:asl2.0)))

(define-public rust-wast-33
  (package
    (name "rust-wast")
    (version "33.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wast" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06qwh49bqkalljihc8h96vkh8f37fn47sgi9f54j2y3zbhbzw10x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-leb128" ,rust-leb128-0.2))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wast")
    (synopsis
     "Customizable Rust parsers for the WebAssembly Text formats WAT and WAST")
    (description
     "This package provides Customizable Rust parsers for the
@code{WebAssembly} Text formats WAT and WAST.")
    (license (list license:asl2.0 ))))

(define-public rust-wasmer-wit-parser-0.1
  (package
    (name "rust-wasmer-wit-parser")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-wit-parser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0njqg01s4qz23l1cs5rvhf3sdafkp413jqch6zms5s3b10arlv7l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-id-arena" ,rust-id-arena-2)
                       ("rust-pulldown-cmark" ,rust-pulldown-cmark-0.8)
                       ("rust-unicode-normalization" ,rust-unicode-normalization-0.1)
                       ("rust-unicode-xid" ,rust-unicode-xid-0.2)
                       ("rust-wast" ,rust-wast-33))))
    (home-page "")
    (synopsis "wit-bindgen-gen-c")
    (description "This package provides wit-bindgen-gen-c.")
    (license license:asl2.0)))

(define-public rust-wasmer-wit-bindgen-gen-core-0.1
  (package
    (name "rust-wasmer-wit-bindgen-gen-core")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-wit-bindgen-gen-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zjl8224fdbsxxjkn26jjn1y4gq90gkc1hhx2mg1zmp5bazab2pz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-wasmer-wit-parser" ,rust-wasmer-wit-parser-0.1))))
    (home-page "")
    (synopsis "Wit-bindgen-gen-c")
    (description "This package provides wit-bindgen-gen-c.")
    (license license:asl2.0)))

(define-public rust-wasmer-wasi-types-3.1
  (package
    (name "rust-wasmer-wasi-types")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-wasi-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1m3121d096lik4rj32kjzlr86w4gl1idd0qb27vjplk27k4dxbz1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-time" ,rust-time-0.2)
                       ("rust-wasmer" ,rust-wasmer-3.1)
                       ("rust-wasmer-derive" ,rust-wasmer-derive-3.1)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.1)
                       ("rust-wasmer-wit-bindgen-gen-core" ,rust-wasmer-wit-bindgen-gen-core-0.1)
                       ("rust-wasmer-wit-bindgen-gen-rust-wasm" ,rust-wasmer-wit-bindgen-gen-rust-wasm-0.1)
                       ("rust-wasmer-wit-bindgen-rust" ,rust-wasmer-wit-bindgen-rust-0.1)
                       ("rust-wasmer-wit-parser" ,rust-wasmer-wit-parser-0.1))))
    (home-page "https://github.com/wasmerio/wasmer")
    (synopsis "WASI types for Wasmer WebAssembly runtime")
    (description
     "This package provides WASI types for Wasmer @code{WebAssembly} runtime.")
    (license license:expat)))

(define-public rust-wasmer-wasi-local-networking-3.1
  (package
    (name "rust-wasmer-wasi-local-networking")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-wasi-local-networking" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0c574yawhh690irxhivrjafi6gpznxwyj9kgfx43hygfihnqhrdx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-wasmer-vfs" ,rust-wasmer-vfs-3.1)
                       ("rust-wasmer-vnet" ,rust-wasmer-vnet-3.1))))
    (home-page "https://github.com/wasmerio/wasmer")
    (synopsis "An WASIX extension for local networking")
    (description
     "This package provides An WASIX extension for local networking.")
    (license license:expat)))

(define-public rust-wasmer-vnet-3.1
  (package
    (name "rust-wasmer-vnet")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-vnet" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1hdlglp0qx8l51sj3hhjfi4g6vm7v2carpyw3f821inc90xzxi4v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasmer-vfs" ,rust-wasmer-vfs-3.1))))
    (home-page "")
    (synopsis "Wasmer Virtual Networking")
    (description "This package provides Wasmer Virtual Networking.")
    (license license:expat)))

(define-public rust-any-ascii-0.1
  (package
    (name "rust-any-ascii")
    (version "0.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "any_ascii" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "07kyb9is518jr1sbc6804kgg5pnx8djl328q3al28lcbxdvkf0vh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://anyascii.com")
    (synopsis "Unicode to ASCII transliteration")
    (description "This package provides Unicode to ASCII transliteration.")
    (license license:isc)))

(define-public rust-lexical-sort-0.3
  (package
    (name "rust-lexical-sort")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lexical-sort" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yi0jzlvjaszwl5a49r0a0gcq404rdk5ls2c9npis8qyc68lb7n0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-any-ascii" ,rust-any-ascii-0.1))))
    (home-page "https://lib.rs/crates/lexical-sort")
    (synopsis "Sort Unicode strings lexically")
    (description "This package provides Sort Unicode strings lexically.")
    (license (list license:expat license:asl2.0))))

(define-public rust-webc-3
  (package
    (name "rust-webc")
    (version "3.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "webc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1w6j90xl3sgamhxssx0m2ng8bs4w3agi5blphsmgxlfmanwyg1zg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-base64" ,rust-base64-0.13)
                       ("rust-hashbrown" ,rust-hashbrown-0.11)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-leb128" ,rust-leb128-0.2)
                       ("rust-lexical-sort" ,rust-lexical-sort-0.3)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-memmap2" ,rust-memmap2-0.5)
                       ("rust-path-clean" ,rust-path-clean-0.1)
                       ("rust-rand" ,rust-rand-0.8.0)
                       ("rust-sequoia-openpgp" ,rust-sequoia-openpgp-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-cbor" ,rust-serde-cbor-0.11)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-url" ,rust-url-2)
                       ("rust-walkdir" ,rust-walkdir-2))))
    (home-page "https://wasmer.io")
    (synopsis "WebContainer implementation for wapm.io")
    (description
     "This package provides @code{WebContainer} implementation for wapm.io.")
    (license (list license:expat license:lgpl2.0+))))

(define-public rust-wasmer-vfs-3.1
  (package
    (name "rust-wasmer-vfs")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-vfs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04z4p56py79197vbqbbq5mnaw72ng9jr98f89znlmmh36ljbvgrl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-slab" ,rust-slab-0.4)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-typetag" ,rust-typetag-0.1)
                       ("rust-webc" ,rust-webc-3))))
    (home-page "")
    (synopsis "Wasmer Virtual FileSystem")
    (description "This package provides Wasmer Virtual @code{FileSystem}.")
    (license license:expat)))

(define-public rust-wasmer-vbus-3.1
  (package
    (name "rust-wasmer-vbus")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-vbus" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1nybkmk9m0x1gxvg7v05a15ryq0797gmz8z39l46i77hp5v2zd3j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasmer-vfs" ,rust-wasmer-vfs-3.1))))
    (home-page "")
    (synopsis "Wasmer Virtual Bus")
    (description "This package provides Wasmer Virtual Bus.")
    (license license:expat)))

(define-public rust-wasmer-emscripten-3.1
  (package
    (name "rust-wasmer-emscripten")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-emscripten" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0sbcdh7n24m0mprl2hrg7fna1lvdw09psjjx75kak5ljbylvqmy8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-time" ,rust-time-0.2)
                       ("rust-wasmer" ,rust-wasmer-3.1)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.1))))
    (home-page "https://wasmer.io/")
    (synopsis
     "Emscripten implementation library for Wasmer WebAssembly runtime")
    (description
     "This package provides Emscripten implementation library for Wasmer @code{WebAssembly} runtime.")
    (license license:expat)))

(define-public rust-wasmer-derive-3.1
  (package
    (name "rust-wasmer-derive")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ab3d852bj152bvmz144f30zfwwv94dgw29sbdy3vkfgq6vpgx8z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro-error" ,rust-proc-macro-error-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://wasmer.io/")
    (synopsis "Wasmer derive macros")
    (description "This package provides Wasmer derive macros.")
    (license license:expat)))

(define-public rust-wasmer-compiler-singlepass-3.1
  (package
    (name "rust-wasmer-compiler-singlepass")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-compiler-singlepass" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0p15imhw2bi3s9wxkc7iq7mzxp20h3s319788y8z7mcjq763bqh7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-dynasm" ,rust-dynasm-1)
                       ("rust-dynasmrt" ,rust-dynasmrt-1)
                       ("rust-enumset" ,rust-enumset-1)
                       ("rust-gimli" ,rust-gimli-0.26)
                       ("rust-hashbrown" ,rust-hashbrown-0.11)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-more-asserts" ,rust-more-asserts-0.2)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-3.1)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.1))))
    (home-page "https://wasmer.io/")
    (synopsis "Singlepass compiler for Wasmer WebAssembly runtime")
    (description
     "This package provides Singlepass compiler for Wasmer @code{WebAssembly} runtime.")
    (license license:expat)))

(define-public rust-llvm-sys-39
  (package
    (name "rust-llvm-sys")
    (version "39.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0j1l36n0vz7vpz8gys9pg5qay5vjjavmgxryf7cib09mz8i6pys4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-0.7)
                       ("rust-gcc" ,rust-gcc-0.3)
                       ("rust-lazy-static" ,rust-lazy-static-0.2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-0.1)
                       ("rust-semver" ,rust-semver-0.4))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "This package provides Bindings to LLVM's C API.")
    (license license:expat)))

(define-public rust-llvm-sys-38
  (package
    (name "rust-llvm-sys")
    (version "38.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ac98n14q7idk69rcja73rijrhqdk2klv14z82dsgndv4xl2x3hs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-0.7)
                       ("rust-gcc" ,rust-gcc-0.3)
                       ("rust-lazy-static" ,rust-lazy-static-0.2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-0.1)
                       ("rust-semver" ,rust-semver-0.4))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "This package provides Bindings to LLVM's C API.")
    (license license:expat)))

(define-public rust-llvm-sys-37
  (package
    (name "rust-llvm-sys")
    (version "37.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qm1fzfddzr6njms5w7vpg11xqxvdb0hzvfv8q32fja6gkkrgnn7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-0.7)
                       ("rust-gcc" ,rust-gcc-0.3)
                       ("rust-lazy-static" ,rust-lazy-static-0.2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-0.1)
                       ("rust-semver" ,rust-semver-0.4))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "This package provides Bindings to LLVM's C API.")
    (license license:expat)))

(define-public rust-semver-parser-0.6
  (package
    (name "rust-semver-parser")
    (version "0.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "semver-parser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rrsf0giv2pdvid0pmwcxfqlrq16k4sc3n5cjnmkcim5qp4z7zyq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-lazy-static" ,rust-lazy-static-0.2)
                       ("rust-regex" ,rust-regex-0.1))))
    (home-page "https://github.com/steveklabnik/semver-parser")
    (synopsis "Parsing of the semver spec.")
    (description "This package provides Parsing of the semver spec.")
    (license (list license:expat license:asl2.0))))

(define-public rust-semver-0.4
  (package
    (name "rust-semver")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "semver" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kirdvbj06x6hffrab86raqy3dyf9i903ny1qlmj12iyq2phc76a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-semver-parser" ,rust-semver-parser-0.6))))
    (home-page "https://github.com/dtolnay/semver")
    (synopsis "Parser and evaluator for Cargo's flavor of Semantic Versioning")
    (description
     "This package provides Parser and evaluator for Cargo's flavor of Semantic Versioning.")
    (license (list license:expat license:asl2.0))))

(define-public rust-llvm-sys-36
  (package
    (name "rust-llvm-sys")
    (version "36.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ffbzs4svw3rvcypk6a0qnp2c7k140n6n8cffhf7b2mlw3cb7983"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-0.7)
                       ("rust-gcc" ,rust-gcc-0.3)
                       ("rust-lazy-static" ,rust-lazy-static-0.2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-0.1)
                       ("rust-semver" ,rust-semver-0.4))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "This package provides Bindings to LLVM's C API.")
    (license license:expat)))

(define-public rust-inkwell-internals-0.5
  (package
    (name "rust-inkwell-internals")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "inkwell_internals" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ya9zf1f12hq5q3jq9v1x1qcshfagg4vhxhrm352811h7npr0w1w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/TheDan64/inkwell")
    (synopsis "Internal macro crate for inkwell")
    (description "This package provides Internal macro crate for inkwell.")
    (license license:asl2.0)))

(define-public rust-inkwell-0.1
  (package
    (name "rust-inkwell")
    (version "0.1.0-beta.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "inkwell" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02zrx7fkdah9ldp78hcbyghp2d0l14r6l338wjil0vdfl3mx08r2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-either" ,rust-either-1)
                       ("rust-inkwell-internals" ,rust-inkwell-internals-0.5)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-llvm-sys" ,rust-llvm-sys-36)
                       ("rust-llvm-sys" ,rust-llvm-sys-37)
                       ("rust-llvm-sys" ,rust-llvm-sys-38)
                       ("rust-llvm-sys" ,rust-llvm-sys-39)
                       ("rust-llvm-sys" ,rust-llvm-sys-50)
                       ("rust-llvm-sys" ,rust-llvm-sys-60)
                       ("rust-llvm-sys" ,rust-llvm-sys-70)
                       ("rust-llvm-sys" ,rust-llvm-sys-80)
                       ("rust-llvm-sys" ,rust-llvm-sys-90)
                       ("rust-llvm-sys" ,rust-llvm-sys-40)
                       ("rust-llvm-sys" ,rust-llvm-sys-100)
                       ("rust-llvm-sys" ,rust-llvm-sys-110)
                       ("rust-llvm-sys" ,rust-llvm-sys-120)
                       ("rust-llvm-sys" ,rust-llvm-sys-130)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.11)
                       ("rust-regex" ,rust-regex-1.8.1)
                       ("rust-static-alloc" ,rust-static-alloc-0.2))))
    (home-page "https://github.com/TheDan64/inkwell")
    (synopsis
     "Inkwell aims to help you pen your own programming languages by safely wrapping llvm-sys")
    (description
     "This package provides Inkwell aims to help you pen your own programming languages by safely wrapping
llvm-sys.")
    (license license:asl2.0)))

(define-public rust-wasmer-compiler-llvm-3.1
  (package
    (name "rust-wasmer-compiler-llvm")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-compiler-llvm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "157frzfwx230wxqi94cj8nm167jv06l5v3czpjlmmnrdbayqhr1g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-cc" ,rust-cc-1)
                       ("rust-inkwell" ,rust-inkwell-0.1)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-object" ,rust-object-0.28)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-regex" ,rust-regex-1.8.1)
                       ("rust-rustc-version" ,rust-rustc-version-0.4)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-3.1)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.1)
                       ("rust-wasmer-vm" ,rust-wasmer-vm-3.1))))
    (home-page "https://wasmer.io/")
    (synopsis "LLVM compiler for Wasmer WebAssembly runtime")
    (description
     "This package provides LLVM compiler for Wasmer @code{WebAssembly} runtime.")
    (license license:expat)))

(define-public rust-cranelift-frontend-0.86
  (package
    (name "rust-cranelift-frontend")
    (version "0.86.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-frontend" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1l0vsb3mcwsj6m7hjq85c9nqa4samjp7lvnllsd9qmf9s7sfhkjl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.86)
                       ("rust-hashbrown" ,rust-hashbrown-0.11)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Cranelift IR builder helper")
    (description "This package provides Cranelift IR builder helper.")
    (license (list license:asl2.0 ))))

(define-public rust-regalloc2-0.3
  (package
    (name "rust-regalloc2")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "regalloc2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yd76dw8b0wr35m316y11xg4yygis0qn6i1xkw3yyy6ray920fnl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-fxhash" ,rust-fxhash-0.2)
                       ("rust-libfuzzer-sys" ,rust-libfuzzer-sys-0.4)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-slice-group-by" ,rust-slice-group-by-0.3)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://github.com/bytecodealliance/regalloc2")
    (synopsis "Backtracking register allocator inspired from IonMonkey")
    (description
     "This package provides Backtracking register allocator inspired from @code{IonMonkey}.")
    (license (list license:asl2.0 ))))

(define-public rust-supports-unicode-1
  (package
    (name "rust-supports-unicode")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "supports-unicode" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cpq6mbixlpdibwx203p6qh7kpzqy9yin7y5ird14ys1bgj4bfd8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-atty" ,rust-atty-0.2))))
    (home-page "https://github.com/zkat/supports-unicode")
    (synopsis "Detects whether a terminal supports unicode")
    (description
     "This package provides Detects whether a terminal supports unicode.")
    (license license:asl2.0)))

(define-public rust-supports-hyperlinks-1
  (package
    (name "rust-supports-hyperlinks")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "supports-hyperlinks" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01k4rr0p8fvgc8qwy8bnlr8gf7gk8psb796vg2fwq7phqpvk82sr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-atty" ,rust-atty-0.2))))
    (home-page "https://github.com/zkat/supports-hyperlinks")
    (synopsis "Detects whether a terminal supports rendering hyperlinks")
    (description
     "This package provides Detects whether a terminal supports rendering hyperlinks.")
    (license license:asl2.0)))

(define-public rust-miette-derive-4
  (package
    (name "rust-miette-derive")
    (version "4.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "miette-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0k0ph38lxzqamaabind8463j2k5qjg6jhhbcdrg1pkqvfrdw8nvb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/zkat/miette")
    (synopsis "Derive macros for miette. Like `thiserror` for Diagnostics")
    (description
     "This package provides Derive macros for miette.  Like `thiserror` for Diagnostics.")
    (license license:asl2.0)))

(define-public rust-miette-4
  (package
    (name "rust-miette")
    (version "4.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "miette" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1365xpl8l66lsvn6bk4mhbpxf5gciiazj4apyiaqn87r8jg3540w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-atty" ,rust-atty-0.2)
                       ("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-miette-derive" ,rust-miette-derive-4)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-owo-colors" ,rust-owo-colors-3)
                       ("rust-supports-color" ,rust-supports-color-1)
                       ("rust-supports-hyperlinks" ,rust-supports-hyperlinks-1)
                       ("rust-supports-unicode" ,rust-supports-unicode-1)
                       ("rust-terminal-size" ,rust-terminal-size-0.1)
                       ("rust-textwrap" ,rust-textwrap-0.15)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://github.com/zkat/miette")
    (synopsis
     "Fancy diagnostic reporting library and protocol for us mere mortals who aren't compiler hackers")
    (description
     "This package provides Fancy diagnostic reporting library and protocol for us mere mortals who aren't
compiler hackers.")
    (license license:asl2.0)))

(define-public rust-cranelift-isle-0.86
  (package
    (name "rust-cranelift-isle")
    (version "0.86.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-isle" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1b8a2x1l619wci0j2c6c7qw1nycnfc57sm9wgv1vhafrcd1v25pd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4)
                       ("rust-miette" ,rust-miette-4))))
    (home-page
     "https://github.com/bytecodealliance/wasmtime/tree/main/cranelift/isle")
    (synopsis
     "ISLE: Instruction Selection and Lowering Expressions. A domain-specific language for instruction selection in Cranelift")
    (description
     "This package provides ISLE: Instruction Selection and Lowering Expressions.  A domain-specific
language for instruction selection in Cranelift.")
    (license (list license:asl2.0 ))))

(define-public rust-cranelift-codegen-shared-0.86
  (package
    (name "rust-cranelift-codegen-shared")
    (version "0.86.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-codegen-shared" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rjqxh7z90k0msyf6isyw50l4xbi6nil829njns3x329ayp66fib"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis
     "For code shared between cranelift-codegen-meta and cranelift-codegen")
    (description
     "This package provides For code shared between cranelift-codegen-meta and cranelift-codegen.")
    (license (list license:asl2.0 ))))

(define-public rust-cranelift-codegen-meta-0.86
  (package
    (name "rust-cranelift-codegen-meta")
    (version "0.86.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-codegen-meta" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ldprm0lp9dr0i11h26wf067k9ps1x7snglf6m2qv0svv2z785jm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen-shared" ,rust-cranelift-codegen-shared-0.86))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Metaprogram for cranelift-codegen code generator library")
    (description
     "This package provides Metaprogram for cranelift-codegen code generator library.")
    (license (list license:asl2.0 ))))

(define-public rust-cranelift-entity-0.86
  (package
    (name "rust-cranelift-entity")
    (version "0.86.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-entity" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0viygzb8hfjra5pn9lqlbc5jcj0jlsgp7l539v4w2b674jk8mahi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Data structures using entity references as mapping keys")
    (description
     "This package provides Data structures using entity references as mapping keys.")
    (license (list license:asl2.0 ))))

(define-public rust-cranelift-bforest-0.86
  (package
    (name "rust-cranelift-bforest")
    (version "0.86.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-bforest" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0m8gdr2hgl1w13cd05dlb1jxkwzdvxr1d552vc7cd6i4wb6gm7sj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-entity" ,rust-cranelift-entity-0.86))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "forest of B+-trees")
    (description "This package provides a forest of B+-trees.")
    (license (list license:asl2.0 ))))

(define-public rust-cranelift-codegen-0.86
  (package
    (name "rust-cranelift-codegen")
    (version "0.86.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-codegen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14jagk9ghlambscb90475n4jgqnjvrznl0wdbysqrz3yc5gi0za2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bincode" ,rust-bincode-1)
                       ("rust-cranelift-bforest" ,rust-cranelift-bforest-0.86)
                       ("rust-cranelift-codegen-meta" ,rust-cranelift-codegen-meta-0.86)
                       ("rust-cranelift-codegen-shared" ,rust-cranelift-codegen-shared-0.86)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.86)
                       ("rust-cranelift-isle" ,rust-cranelift-isle-0.86)
                       ("rust-gimli" ,rust-gimli-0.26)
                       ("rust-hashbrown" ,rust-hashbrown-0.11)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-miette" ,rust-miette-4)
                       ("rust-regalloc2" ,rust-regalloc2-0.3)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-souper-ir" ,rust-souper-ir-2)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Low-level code generator library")
    (description "This package provides Low-level code generator library.")
    (license (list license:asl2.0 ))))

(define-public rust-wasmer-compiler-cranelift-3.1
  (package
    (name "rust-wasmer-compiler-cranelift")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-compiler-cranelift" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13z5d1ifkns9djqpblnjkzd96jsjzbbnns611ma8jj68kxifyph1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.86)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.86)
                       ("rust-cranelift-frontend" ,rust-cranelift-frontend-0.86)
                       ("rust-gimli" ,rust-gimli-0.26)
                       ("rust-hashbrown" ,rust-hashbrown-0.11)
                       ("rust-more-asserts" ,rust-more-asserts-0.2)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-3.1)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.1))))
    (home-page "https://wasmer.io/")
    (synopsis "Cranelift compiler for Wasmer WebAssembly runtime")
    (description
     "This package provides Cranelift compiler for Wasmer @code{WebAssembly} runtime.")
    (license (list license:expat license:asl2.0 ))))

(define-public rust-wasmer-vm-3.1
  (package
    (name "rust-wasmer-vm")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-vm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1866ld6p9qd5p6pn8790afajhz89cl053ds572v6qgh019zqmilz"))))
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
                       ("rust-mach" ,rust-mach-0.3)
                       ("rust-memoffset" ,rust-memoffset-0.6)
                       ("rust-more-asserts" ,rust-more-asserts-0.2)
                       ("rust-region" ,rust-region-3)
                       ("rust-scopeguard" ,rust-scopeguard-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.1)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://wasmer.io/")
    (synopsis "Runtime library support for Wasmer")
    (description "This package provides Runtime library support for Wasmer.")
    (license (list license:expat license:asl2.0 ))))

(define-public rust-wasmer-types-3.1
  (package
    (name "rust-wasmer-types")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wy4n4y0c1mccbiirl522n2ciwniwxh4a2hbpvivlslnvbwh15lb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-enum-iterator" ,rust-enum-iterator-0.7)
                       ("rust-enumset" ,rust-enumset-1)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-more-asserts" ,rust-more-asserts-0.2)
                       ("rust-rkyv" ,rust-rkyv-0.7)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-bytes" ,rust-serde-bytes-0.11)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://wasmer.io/")
    (synopsis "Wasmer Common Types")
    (description "This package provides Wasmer Common Types.")
    (license (list license:expat license:asl2.0 ))))

(define-public rust-wasmer-object-3.1
  (package
    (name "rust-wasmer-object")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-object" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ha6qn4mzhn32y2kxv3zbxs0z14vnfsiryfwhc4fw282mcl41c71"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-object" ,rust-object-0.28)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.1))))
    (home-page "https://wasmer.io/")
    (synopsis "Wasmer Native Object generator")
    (description "This package provides Wasmer Native Object generator.")
    (license license:expat)))

(define-public rust-wasmer-compiler-3.1
  (package
    (name "rust-wasmer-compiler")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-compiler" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ig04c4r4kxilsg4kf6ic0w4ff9pfy0yc16bh1rygb5apscanvxq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-enum-iterator" ,rust-enum-iterator-0.7)
                       ("rust-enumset" ,rust-enumset-1)
                       ("rust-hashbrown" ,rust-hashbrown-0.11)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-leb128" ,rust-leb128-0.2)
                       ("rust-memmap2" ,rust-memmap2-0.5)
                       ("rust-more-asserts" ,rust-more-asserts-0.2)
                       ("rust-region" ,rust-region-3)
                       ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-bytes" ,rust-serde-bytes-0.11)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasmer-object" ,rust-wasmer-object-3.1)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.1)
                       ("rust-wasmer-vm" ,rust-wasmer-vm-3.1)
                       ("rust-wasmparser" ,rust-wasmparser-0.83)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://wasmer.io/")
    (synopsis "Base compiler abstraction for Wasmer WebAssembly runtime")
    (description
     "This package provides Base compiler abstraction for Wasmer @code{WebAssembly} runtime.")
    (license (list license:expat license:asl2.0 ))))

(define-public rust-wasmer-3.1
  (package
    (name "rust-wasmer")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "140gkya1vg7g3fj4hvv49ydrxf8w62ph2wnw0nw0q8h12z9gc2l4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-hashbrown" ,rust-hashbrown-0.11)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-more-asserts" ,rust-more-asserts-0.2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-wasm-bindgen" ,rust-serde-wasm-bindgen-0.4)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-wasm-bindgen-downcast" ,rust-wasm-bindgen-downcast-0.1)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-3.1)
                       ("rust-wasmer-compiler-cranelift" ,rust-wasmer-compiler-cranelift-3.1)
                       ("rust-wasmer-compiler-llvm" ,rust-wasmer-compiler-llvm-3.1)
                       ("rust-wasmer-compiler-singlepass" ,rust-wasmer-compiler-singlepass-3.1)
                       ("rust-wasmer-derive" ,rust-wasmer-derive-3.1)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.1)
                       ("rust-wasmer-vm" ,rust-wasmer-vm-3.1)
                       ("rust-wasmparser" ,rust-wasmparser-0.83)
                       ("rust-wat" ,rust-wat-1)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://wasmer.io/")
    (synopsis "High-performance WebAssembly runtime")
    (description
     "This package provides High-performance @code{WebAssembly} runtime.")
    (license license:expat)))

(define-public rust-wasmer-wasi-3.1
  (package
    (name "rust-wasmer-wasi")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-wasi" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "079hpk2fi8kaxa49sbvdnbsxgqb0ys8fxymcgnqq7nv3gkayr4z8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-bincode" ,rust-bincode-1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-derivative" ,rust-derivative-2)
                       ("rust-generational-arena" ,rust-generational-arena-0.2)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-cbor" ,rust-serde-cbor-0.11)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-typetag" ,rust-typetag-0.1)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-wasmer" ,rust-wasmer-3.1)
                       ("rust-wasmer-emscripten" ,rust-wasmer-emscripten-3.1)
                       ("rust-wasmer-vbus" ,rust-wasmer-vbus-3.1)
                       ("rust-wasmer-vfs" ,rust-wasmer-vfs-3.1)
                       ("rust-wasmer-vnet" ,rust-wasmer-vnet-3.1)
                       ("rust-wasmer-wasi-local-networking"
                        ,rust-wasmer-wasi-local-networking-3.1)
                       ("rust-wasmer-wasi-types" ,rust-wasmer-wasi-types-3.1)
                       ("rust-webc" ,rust-webc-3)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/wasmerio/wasmer")
    (synopsis "WASI implementation library for Wasmer WebAssembly runtime")
    (description
     "This package provides WASI implementation library for Wasmer
@code{WebAssembly} runtime.")
    (license license:expat)))

(define-public rust-ahash-0.8
  (package
    (name "rust-ahash")
    (version "0.8.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ahash" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04chdfkls5xmhp1d48gnjsmglbqibizs3bpbj6rsj604m10si7g8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-atomic-polyfill" ,rust-atomic-polyfill-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-const-random" ,rust-const-random-0.1)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-version-check" ,rust-version-check-0.9)
                       ("rust-zerocopy" ,rust-zerocopy-0.7))))
    (home-page "https://github.com/tkaitchuck/ahash")
    (synopsis
     "non-cryptographic hash function using AES-NI for high performance")
    (description
     "This package provides a non-cryptographic hash function using AES-NI for high
performance.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasmparser-0.215
  (package
    (name "rust-wasmparser")
    (version "0.215.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmparser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03nryws9f2awvfd47z5pn67aqif1z7w6z6zl3jw9jhgjh44dxysk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ahash" ,rust-ahash-0.8)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-serde" ,rust-serde-1))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasmparser")
    (synopsis
     "simple event-driven library for parsing WebAssembly binary files.")
    (description
     "This package provides a simple event-driven library for parsing
@code{WebAssembly} binary files.")
    (license (list license:asl2.0  license:asl2.0
                   license:expat))))

(define-public rust-wasm-encoder-0.215
  (package
    (name "rust-wasm-encoder")
    (version "0.215.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-encoder" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0iw886v4jzvbwxakiswsk81824m51fjnjabxwdvnp3kbw3rnvdag"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-leb128" ,rust-leb128-0.2)
                       ("rust-wasmparser" ,rust-wasmparser-0.215))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasm-encoder")
    (synopsis "low-level WebAssembly encoder.")
    (description
     "This package provides a low-level @code{WebAssembly} encoder.")
    (license (list license:asl2.0  license:asl2.0
                   license:expat))))

(define-public rust-gimli-0.30
  (package
    (name "rust-gimli")
    (version "0.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gimli" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jfz1sj9h0rnlhjnmy315db2drsn54f0b5qcpndvl8lpprzxkqg2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-fallible-iterator" ,rust-fallible-iterator-0.3)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-stable-deref-trait" ,rust-stable-deref-trait-1))))
    (home-page "https://github.com/gimli-rs/gimli")
    (synopsis "Library for reading and writing the DWARF debugging format")
    (description
     "This package provides a library for reading and writing the DWARF debugging
format.")
    (license (list license:expat license:asl2.0))))

(define-public rust-bumpalo-3
  (package
    (name "rust-bumpalo")
    (version "3.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bumpalo" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0b015qb4knwanbdlp1x48pkb4pm57b8gidbhhhxr900q2wb6fabr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-allocator-api2" ,rust-allocator-api2-0.2)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/fitzgen/bumpalo")
    (synopsis "fast bump allocation arena for Rust.")
    (description
     "This package provides a fast bump allocation arena for Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wast-215
  (package
    (name "rust-wast")
    (version "215.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wast" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jslxdhsnrjfky3a41iqvk2g2hhzgi5f02vjc2g294rmi46x1w8z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bumpalo" ,rust-bumpalo-3)
                       ("rust-gimli" ,rust-gimli-0.30)
                       ("rust-leb128" ,rust-leb128-0.2)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-unicode-width" ,rust-unicode-width-0.1)
                       ("rust-wasm-encoder" ,rust-wasm-encoder-0.215))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wast")
    (synopsis
     "Customizable Rust parsers for the WebAssembly Text formats WAT and WAST")
    (description
     "This package provides Customizable Rust parsers for the @code{WebAssembly} Text formats WAT and WAST.")
    (license (list license:asl2.0  license:asl2.0
                   license:expat))))

(define-public rust-wat-1
  (package
    (name "rust-wat")
    (version "1.215.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wat" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gaf5fzl8lq6rfdiz1x6zbdbc9b5aiyd9pkh5ljawxngr3cz82v7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-wast" ,rust-wast-215))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wat")
    (synopsis "Rust parser for the WebAssembly Text format, WAT")
    (description
     "This package provides Rust parser for the @code{WebAssembly} Text format, WAT.")
    (license (list license:asl2.0  license:asl2.0
                   license:expat))))

(define-public rust-wasmparser-0.83
  (package
    (name "rust-wasmparser")
    (version "0.83.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmparser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yhx2kq7da4sdglh1x1di4xxg33k7lwddpd3ri46bp9abk2xg3ki"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasmparser")
    (synopsis
     "simple event-driven library for parsing WebAssembly binary files.")
    (description
     "This package provides a simple event-driven library for parsing
@code{WebAssembly} binary files.")
    (license (list license:asl2.0 ))))

(define-public rust-wasmer-derive-3.3
  (package
    (name "rust-wasmer-derive")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0f3p63wvx6qb9j5r9ixf76n5iym9fqxcqqm11swxp0z3mbdiz44p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro-error" ,rust-proc-macro-error-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://wasmer.io/")
    (synopsis "Wasmer derive macros")
    (description "This package provides Wasmer derive macros.")
    (license license:expat)))

(define-public rust-dynasmrt-1
  (package
    (name "rust-dynasmrt")
    (version "1.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dynasmrt" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1aa1av01h0l8ms9fk32ydahby77fd3hhv85zsk51fsnp5fjabyv4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-dynasm" ,rust-dynasm-1)
                       ("rust-memmap2" ,rust-memmap2-0.5))))
    (home-page "https://github.com/CensoredUsername/dynasm-rs")
    (synopsis
     "Simple runtime for assembling code at runtime")
    (description
     "This package provides a simple runtime for assembling code at runtime.  Combined
with the plugin crate dynasm it can be used to write JIT compilers easily.")
    (license license:mpl2.0)))

(define-public rust-dynasm-1
  (package
    (name "rust-dynasm")
    (version "1.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dynasm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12yf5l193j318bv9fxqw1r5j210mdzh0jgrna304wlkvh01a3ndd"))))
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
     "plugin for assembling code at runtime. Combined with the runtime crate dynasmrt it can be used to write JIT compilers easily.")
    (description
     "This package provides a plugin for assembling code at runtime.  Combined with
the runtime crate dynasmrt it can be used to write JIT compilers easily.")
    (license license:mpl2.0)))

(define-public rust-wasmer-compiler-singlepass-3.3
  (package
    (name "rust-wasmer-compiler-singlepass")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-compiler-singlepass" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "15ybads0p9kxpx5lvdb5sr4f53i6xj6g0gxgq0aj2ibgvrbqklyl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-dynasm" ,rust-dynasm-1)
                       ("rust-dynasmrt" ,rust-dynasmrt-1)
                       ("rust-enumset" ,rust-enumset-1)
                       ("rust-gimli" ,rust-gimli-0.26)
                       ("rust-hashbrown" ,rust-hashbrown-0.11)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-more-asserts" ,rust-more-asserts-0.2)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-3.3)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.3))))
    (home-page "https://wasmer.io/")
    (synopsis "Singlepass compiler for Wasmer WebAssembly runtime")
    (description
     "This package provides Singlepass compiler for Wasmer @code{WebAssembly} runtime.")
    (license license:expat)))

(define-public rust-alloc-traits-0.1
  (package
    (name "rust-alloc-traits")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "alloc-traits" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "10z4rmykwnp8ps5r5n34190h6gmzpj1f67fqildi1z8r6f2m8bbb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/HeroicKatora/static-alloc")
    (synopsis "Traits to replace or supplement the alloc module in no_std")
    (description
     "This package provides Traits to replace or supplement the alloc module in no_std.")
    (license license:expat)))

(define-public rust-static-alloc-0.2
  (package
    (name "rust-static-alloc")
    (version "0.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "static-alloc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "07p6s9njqc1v6jpr0vlw55ps4v32wp3df27fxjg565nf6ph7aacb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-alloc-traits" ,rust-alloc-traits-0.1)
                       ("rust-atomic-polyfill" ,rust-atomic-polyfill-1))))
    (home-page "https://github.com/HeroicKatora/static-alloc")
    (synopsis "bump allocator on static memory for the alloc-traits crate")
    (description
     "This package provides a bump allocator on static memory for the alloc-traits
crate.")
    (license (list license:expat license:asl2.0 license:zlib))))

(define-public rust-llvm-sys-130
  (package
    (name "rust-llvm-sys")
    (version "130.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0z6nzm49gav2x2mvmvqjsqqphrkr5w8hvbyvdq1y9gf43z4l40f2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-clang-sys" ,rust-clang-sys-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1.8.1)
                       ("rust-semver" ,rust-semver-0.11)
                       ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "This package provides Bindings to LLVM's C API.")
    (license license:expat)))

(define-public rust-llvm-sys-110
  (package
    (name "rust-llvm-sys")
    (version "110.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gbwa9i39l0rx66v8wgrg6ixpf7r35vvj9kxplg98q29qksddfks"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1.8.1)
                       ("rust-semver" ,rust-semver-0.11))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "This package provides Bindings to LLVM's C API.")
    (license license:expat)))

(define-public rust-llvm-sys-120
  (package
    (name "rust-llvm-sys")
    (version "120.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vr1kvqr0z2pr4x4gl1b9dd71fbg7z5fw4ssp1z9qxinyj92ckv2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1.8.1)
                       ("rust-semver" ,rust-semver-0.11))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "This package provides Bindings to LLVM's C API.")
    (license license:expat)))

(define-public rust-llvm-sys-90
  (package
    (name "rust-llvm-sys")
    (version "90.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fbrfchskrbgvf6ri2sg1qf05w53a093kig7g0vnfz3yggav0dhh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1.8.1)
                       ("rust-semver" ,rust-semver-0.9))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "This package provides Bindings to LLVM's C API.")
    (license license:expat)))

(define-public rust-llvm-sys-80
  (package
    (name "rust-llvm-sys")
    (version "80.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06nlp13zc47q55zscqz6fdhvh4cxjpdcxs7q23r5pz6dzpxpd9aw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1.8.1)
                       ("rust-semver" ,rust-semver-0.9))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "This package provides Bindings to LLVM's C API.")
    (license license:expat)))

(define-public rust-llvm-sys-70
  (package
    (name "rust-llvm-sys")
    (version "70.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1k9z7qdrss9dfdc64bbbq846plvgp98yir7yyzk7hy61gq900cv7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1.8.1)
                       ("rust-semver" ,rust-semver-0.9))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "This package provides Bindings to LLVM's C API.")
    (license license:expat)))

(define-public rust-llvm-sys-60
  (package
    (name "rust-llvm-sys")
    (version "60.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ky5xqmc5k7lq9lwfp95yinyxzwsd3d5x06gybcl0scvd4wsg9z8"))))
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
    (description "This package provides Bindings to LLVM's C API.")
    (license license:expat)))

(define-public rust-llvm-sys-50
  (package
    (name "rust-llvm-sys")
    (version "50.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "15g89sslrf5c6z5bdrpssimpsr2il9bwaaql5nvscgwybzrhizdf"))))
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
    (description "This package provides Bindings to LLVM's C API.")
    (license license:expat)))

(define-public rust-semver-0.6
  (package
    (name "rust-semver")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "semver" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0drmjiwkq0znj33q9x9hw7ld8f28n9diyjs3jlh1l1v5kvn8ccbs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-semver-parser" ,rust-semver-parser-0.7))))
    (home-page "https://github.com/dtolnay/semver")
    (synopsis "Parser and evaluator for Cargo's flavor of Semantic Versioning")
    (description
     "This package provides Parser and evaluator for Cargo's flavor of Semantic Versioning.")
    (license (list license:expat license:asl2.0))))

(define-public rust-llvm-sys-40
  (package
    (name "rust-llvm-sys")
    (version "40.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "099lk8w19is1s4hywilpmnaqp5lm8gp2hw5f06g6f8xn65yi7sm7"))))
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
    (description "This package provides Bindings to LLVM's C API.")
    (license license:expat)))

(define-public rust-llvm-sys-150
  (package
    (name "rust-llvm-sys")
    (version "150.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1scy1093jz7c2wkx375qmrcb0dd2jpnpsc2n6wikfpc98n3q4mda"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-clang-sys" ,rust-clang-sys-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1.8.1)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "This package provides Bindings to LLVM's C API.")
    (license license:expat)))

(define-public rust-clang-sys-1
  (package
    (name "rust-clang-sys")
    (version "1.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clang-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1x1r9yqss76z8xwpdanw313ss6fniwc1r7dzb5ycjn0ph53kj0hb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-glob" ,rust-glob-0.3)
                       ("rust-glob" ,rust-glob-0.3)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-libloading" ,rust-libloading-0.8))))
    (home-page "https://github.com/KyleMayes/clang-sys")
    (synopsis "Rust bindings for libclang")
    (description "This package provides Rust bindings for libclang.")
    (license license:asl2.0)))

(define-public rust-llvm-sys-140
  (package
    (name "rust-llvm-sys")
    (version "140.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "030srgq5vgshgpmb0w05gpf3yjbh73vcrgg327n320kwhplpip73"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-clang-sys" ,rust-clang-sys-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1.8.1)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "This package provides Bindings to LLVM's C API.")
    (license license:expat)))

(define-public rust-llvm-sys-100
  (package
    (name "rust-llvm-sys")
    (version "100.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0d2v8y9fwqqhidmdxhra7509vj503bj0zlivp9wm1xw4g28il9bj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1.8.1)
                       ("rust-semver" ,rust-semver-0.9))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "This package provides Bindings to LLVM's C API.")
    (license license:expat)))

(define-public rust-inkwell-internals-0.7
  (package
    (name "rust-inkwell-internals")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "inkwell_internals" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11gah33af1bbidmx1pdy6xqyr24ijpzpngf2bfz05kk4w8bhrl47"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/TheDan64/inkwell")
    (synopsis "Internal macro crate for inkwell")
    (description "This package provides Internal macro crate for inkwell.")
    (license license:asl2.0)))

(define-public rust-inkwell-0.1
  (package
    (name "rust-inkwell")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "inkwell" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jfyqsq4fc5blkkgs9gnf9m3wic136k6lzpvcxc556hmhpj13b5v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-either" ,rust-either-1)
                       ("rust-inkwell-internals" ,rust-inkwell-internals-0.7)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-llvm-sys" ,rust-llvm-sys-100)
                       ("rust-llvm-sys" ,rust-llvm-sys-140)
                       ("rust-llvm-sys" ,rust-llvm-sys-150)
                       ("rust-llvm-sys" ,rust-llvm-sys-40)
                       ("rust-llvm-sys" ,rust-llvm-sys-50)
                       ("rust-llvm-sys" ,rust-llvm-sys-60)
                       ("rust-llvm-sys" ,rust-llvm-sys-70)
                       ("rust-llvm-sys" ,rust-llvm-sys-80)
                       ("rust-llvm-sys" ,rust-llvm-sys-90)
                       ("rust-llvm-sys" ,rust-llvm-sys-120)
                       ("rust-llvm-sys" ,rust-llvm-sys-110)
                       ("rust-llvm-sys" ,rust-llvm-sys-130)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-static-alloc" ,rust-static-alloc-0.2))))
    (home-page "https://github.com/TheDan64/inkwell")
    (synopsis
     "Inkwell aims to help you pen your own programming languages by safely wrapping llvm-sys")
    (description
     "This package provides Inkwell aims to help you pen your own programming languages by safely wrapping
llvm-sys.")
    (license license:asl2.0)))

(define-public rust-wasmer-compiler-llvm-3.3
  (package
    (name "rust-wasmer-compiler-llvm")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-compiler-llvm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1khs46ipa95xjz7rcwn23ggj39a8i2g1pgywr1bw5zb442ddhv6v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-cc" ,rust-cc-1)
                       ("rust-inkwell" ,rust-inkwell-0.1)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-object" ,rust-object-0.28)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-regex" ,rust-regex-1.8.1)
                       ("rust-rustc-version" ,rust-rustc-version-0.4)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-3.3)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.3)
                       ("rust-wasmer-vm" ,rust-wasmer-vm-3.3))))
    (home-page "https://wasmer.io/")
    (synopsis "LLVM compiler for Wasmer WebAssembly runtime")
    (description
     "This package provides LLVM compiler for Wasmer @code{WebAssembly} runtime.")
    (license license:expat)))

(define-public rust-cranelift-frontend-0.91
  (package
    (name "rust-cranelift-frontend")
    (version "0.91.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-frontend" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19mc2ls24c2yrnj29j6svxkpj3ypq7lkd23yzz43vvygp2nanw0d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.91)
                       ("rust-hashbrown" ,rust-hashbrown-0.12)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Cranelift IR builder helper")
    (description "This package provides Cranelift IR builder helper.")
    (license (list license:asl2.0 ))))

(define-public rust-id-arena-2
  (package
    (name "rust-id-arena")
    (version "2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "id-arena" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01ch8jhpgnih8sawqs44fqsqpc7bzwgy0xpi6j0f4j0i5mkvr8i5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rayon" ,rust-rayon-1))))
    (home-page "https://github.com/fitzgen/id-arena")
    (synopsis "Simple, id-based arena")
    (description "This package provides a simple, id-based arena.")
    (license (list license:expat license:asl2.0))))

(define-public rust-souper-ir-2
  (package
    (name "rust-souper-ir")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "souper-ir" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0i60q84w5k3rd0j3zhsdc5xasrd4wrkamyrs01rik3lq6g71h355"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-id-arena" ,rust-id-arena-2))))
    (home-page "https://github.com/fitzgen/souper-ir")
    (synopsis "library for manipulating Souper IR")
    (description "This package provides a library for manipulating Souper IR.")
    (license (list license:expat license:asl2.0))))

(define-public rust-slice-group-by-0.3
  (package
    (name "rust-slice-group-by")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "slice-group-by" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19vbyyxqvc25fv2dmhlxijlk5sa9j34yb6hyydb9vf89kh36fqc2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/Kerollmops/slice-group-by")
    (synopsis "Iterators over groups in slices and strs")
    (description
     "This package provides Iterators over groups in slices and strs.")
    (license license:expat)))

(define-public rust-regalloc2-0.5
  (package
    (name "rust-regalloc2")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "regalloc2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0303kga9n8695w7pvf4p5zspq90h24fd9pd3ifknc70cnjzly39h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-fxhash" ,rust-fxhash-0.2)
                       ("rust-libfuzzer-sys" ,rust-libfuzzer-sys-0.4)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-slice-group-by" ,rust-slice-group-by-0.3)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://github.com/bytecodealliance/regalloc2")
    (synopsis "Backtracking register allocator inspired from IonMonkey")
    (description
     "This package provides Backtracking register allocator inspired from @code{IonMonkey}.")
    (license (list license:asl2.0 ))))

(define-public rust-cranelift-isle-0.91
  (package
    (name "rust-cranelift-isle")
    (version "0.91.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-isle" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fw5swg2j2vwj4cn76grhjh43jyn8ccgc1rspf6zyc0q8lycffrr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-codespan-reporting" ,rust-codespan-reporting-0.11)
                       ("rust-log" ,rust-log-0.4))))
    (home-page
     "https://github.com/bytecodealliance/wasmtime/tree/main/cranelift/isle")
    (synopsis
     "ISLE: Instruction Selection and Lowering Expressions")
    (description
     "This package provides ISLE: Instruction Selection and Lowering Expressions.  A domain-specific
language for instruction selection in Cranelift.")
    (license (list license:asl2.0 ))))

(define-public rust-cranelift-egraph-0.91
  (package
    (name "rust-cranelift-egraph")
    (version "0.91.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-egraph" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wwd5j9sfpdyi4ccws046jxj7lw2p91ijc9r74lpbrh67cr58jv2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-entity" ,rust-cranelift-entity-0.91)
                       ("rust-fxhash" ,rust-fxhash-0.2)
                       ("rust-hashbrown" ,rust-hashbrown-0.12)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Acyclic-egraph (aegraph) implementation for Cranelift")
    (description
     "This package provides acyclic-egraph (aegraph) implementation for Cranelift.")
    (license (list license:asl2.0 ))))

(define-public rust-cranelift-codegen-shared-0.91
  (package
    (name "rust-cranelift-codegen-shared")
    (version "0.91.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-codegen-shared" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1dws7bim1gxiqlahfnnh0q1sg6an55n4027g64jg7z2kkki553i7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis
     "For code shared between cranelift-codegen-meta and cranelift-codegen")
    (description
     "This package provides For code shared between cranelift-codegen-meta and cranelift-codegen.")
    (license (list license:asl2.0 ))))

(define-public rust-cranelift-codegen-meta-0.91
  (package
    (name "rust-cranelift-codegen-meta")
    (version "0.91.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-codegen-meta" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0x3ffp0d86ggz7ggqzknrppwp1dh187hqc7qk0m13b9lajs0g4v3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen-shared" ,rust-cranelift-codegen-shared-0.91))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Metaprogram for cranelift-codegen code generator library")
    (description
     "This package provides Metaprogram for cranelift-codegen code generator library.")
    (license (list license:asl2.0 ))))

(define-public rust-cranelift-entity-0.91
  (package
    (name "rust-cranelift-entity")
    (version "0.91.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-entity" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0k4x3bi45cawab3j7nyscczby32ybsxcpcrsp5q1ngwwm2ybqncs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Data structures using entity references as mapping keys")
    (description
     "This package provides Data structures using entity references as mapping keys.")
    (license (list license:asl2.0 ))))

(define-public rust-cranelift-bforest-0.91
  (package
    (name "rust-cranelift-bforest")
    (version "0.91.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-bforest" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "05811vi3rp6j3678jv4yky51ms3nbwcklh44w55nyfpx5m8v8aia"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-entity" ,rust-cranelift-entity-0.91))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Forest of B+-trees")
    (description "This package provides a forest of B+-trees.")
    (license (list license:asl2.0 ))))

(define-public rust-cranelift-codegen-0.91
  (package
    (name "rust-cranelift-codegen")
    (version "0.91.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-codegen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1p3128qg8b9n8fc0821v55hjcd1my5ngxfnz764a64sr5bnj5c4q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-bincode" ,rust-bincode-1)
                       ("rust-bumpalo" ,rust-bumpalo-3)
                       ("rust-cranelift-bforest" ,rust-cranelift-bforest-0.91)
                       ("rust-cranelift-codegen-meta" ,rust-cranelift-codegen-meta-0.91)
                       ("rust-cranelift-codegen-shared" ,rust-cranelift-codegen-shared-0.91)
                       ("rust-cranelift-egraph" ,rust-cranelift-egraph-0.91)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.91)
                       ("rust-cranelift-isle" ,rust-cranelift-isle-0.91)
                       ("rust-gimli" ,rust-gimli-0.26)
                       ("rust-hashbrown" ,rust-hashbrown-0.12)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-regalloc2" ,rust-regalloc2-0.5)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-souper-ir" ,rust-souper-ir-2)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Low-level code generator library")
    (description "This package provides Low-level code generator library.")
    (license (list license:asl2.0 ))))

(define-public rust-wasmer-compiler-cranelift-3.3
  (package
    (name "rust-wasmer-compiler-cranelift")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-compiler-cranelift" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "15bcclp2s48p82szjv75j0fa36xjqycrfgyzpcz5cwpkj0zn7rd1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.91)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.91)
                       ("rust-cranelift-frontend" ,rust-cranelift-frontend-0.91)
                       ("rust-gimli" ,rust-gimli-0.26)
                       ("rust-hashbrown" ,rust-hashbrown-0.11)
                       ("rust-more-asserts" ,rust-more-asserts-0.2)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-3.3)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.3))))
    (home-page "https://wasmer.io/")
    (synopsis "Cranelift compiler for Wasmer WebAssembly runtime")
    (description
     "This package provides Cranelift compiler for Wasmer @code{WebAssembly} runtime.")
    (license (list license:expat license:asl2.0 ))))

(define-public rust-wasmparser-0.95
  (package
    (name "rust-wasmparser")
    (version "0.95.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmparser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yn8ma731gpzra72k0sh84v8h3db07df2js1698v36gafdi8kspj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-indexmap" ,rust-indexmap-1)
                       ("rust-url" ,rust-url-2))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasmparser")
    (synopsis
     "Simple event-driven library for parsing WebAssembly binary files")
    (description
     "This package provides a simple event-driven library for parsing
@code{WebAssembly} binary files.")
    (license (list license:asl2.0 ))))

(define-public rust-windows-x86-64-msvc-0.33
  (package
    (name "rust-windows-x86-64-msvc")
    (version "0.33.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_x86_64_msvc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1akf81g0bh8mv8wjpiifd819r0hx3r0xrz9zgzn4hl298sk4l7pz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-x86-64-gnu-0.33
  (package
    (name "rust-windows-x86-64-gnu")
    (version "0.33.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_x86_64_gnu" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1127n961nib9338n0g0sp1464v8wnw0hvmw45sr7pkly1q69ppdl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-i686-msvc-0.33
  (package
    (name "rust-windows-i686-msvc")
    (version "0.33.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_i686_msvc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1l3kwxgdfg4lnx2j5bkcx6cnvhxnpcsbqjm3idhwxmwsrj4vxzcc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-i686-gnu-0.33
  (package
    (name "rust-windows-i686-gnu")
    (version "0.33.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_i686_gnu" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03nsi8h0yd4n9wgpxcpynzwlnacihisgmh021kfb5fln79qczc6a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-aarch64-msvc-0.33
  (package
    (name "rust-windows-aarch64-msvc")
    (version "0.33.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_aarch64_msvc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01q80v2zzfc144xsqj3yhd62rn1dy1kyamhyv0gcrf4sxg9iyxnd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "This package provides Import lib for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-sys-0.33
  (package
    (name "rust-windows-sys")
    (version "0.33.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xdym5hgf2pp5lmfdjk4lynad99w4j02v9yzn6752a9ncsbb1ns3"))))
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
    (description "This package provides Rust for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-corosensei-0.1
  (package
    (name "rust-corosensei")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "corosensei" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13ksv3m4w94xv59h8h0y5ixlh94j8kn5k9yj878cpacfqlr8h4l0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-autocfg" ,rust-autocfg-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-scopeguard" ,rust-scopeguard-1)
                       ("rust-windows-sys" ,rust-windows-sys-0.33))))
    (home-page "https://github.com/Amanieu/corosensei")
    (synopsis "Fast and safe implementation of stackful coroutines")
    (description
     "This package provides a fast and safe implementation of stackful coroutines.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasmer-vm-3.3
  (package
    (name "rust-wasmer-vm")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-vm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gsn000jkbf94s31img1cpc4p1iba25pbarsxm7p3l8n9zn1hc84"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-cc" ,rust-cc-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-corosensei" ,rust-corosensei-0.1)
                       ("rust-dashmap" ,rust-dashmap-5)
                       ("rust-derivative" ,rust-derivative-2)
                       ("rust-enum-iterator" ,rust-enum-iterator-0.7)
                       ("rust-fnv" ,rust-fnv-1)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-mach" ,rust-mach-0.3)
                       ("rust-memoffset" ,rust-memoffset-0.8)
                       ("rust-more-asserts" ,rust-more-asserts-0.2)
                       ("rust-region" ,rust-region-3)
                       ("rust-scopeguard" ,rust-scopeguard-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.3)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://wasmer.io/")
    (synopsis "Runtime library support for Wasmer")
    (description "This package provides Runtime library support for Wasmer.")
    (license (list license:expat license:asl2.0 ))))

(define-public rust-wasmer-types-3.3
  (package
    (name "rust-wasmer-types")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16v5bmrrsm0mvagwfl9bhspz66cfcl7cvpg4a2am0qagky1z5wb7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytecheck" ,rust-bytecheck-0.6)
                       ("rust-enum-iterator" ,rust-enum-iterator-0.7)
                       ("rust-enumset" ,rust-enumset-1)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-more-asserts" ,rust-more-asserts-0.2)
                       ("rust-rkyv" ,rust-rkyv-0.7)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-bytes" ,rust-serde-bytes-0.11)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://wasmer.io/")
    (synopsis "Wasmer Common Types")
    (description "This package provides Wasmer Common Types.")
    (license (list license:expat license:asl2.0 ))))

(define-public rust-object-0.28
  (package
    (name "rust-object")
    (version "0.28.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "object" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0964501nlfh806mik3f9v6n05mx74qa0w7byvn0sqpwm5lprhb74"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-crc32fast" ,rust-crc32fast-1)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-hashbrown" ,rust-hashbrown-0.11)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-wasmparser" ,rust-wasmparser-0.57))))
    (home-page "https://github.com/gimli-rs/object")
    (synopsis "unified interface for reading and writing object file formats.")
    (description
     "This package provides a unified interface for reading and writing object file
formats.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmer-object-3.3
  (package
    (name "rust-wasmer-object")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-object" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1bja4is4whdzfrldgzksh92mxfhzmh22ikmzprrj23yx9zh2ashv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-object" ,rust-object-0.28)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.3))))
    (home-page "https://wasmer.io/")
    (synopsis "Wasmer Native Object generator")
    (description "This package provides Wasmer Native Object generator.")
    (license license:expat)))

(define-public rust-enum-iterator-derive-0.7
  (package
    (name "rust-enum-iterator-derive")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "enum-iterator-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ndihb41kmi6pxc2bs097abxliw2pgnnw412lhdqfymjc1vw6d61"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/stephaneyfx/enum-iterator")
    (synopsis "Procedural macro to derive Sequence")
    (description "This package provides Procedural macro to derive Sequence.")
    (license license:bsd-0)))

(define-public rust-enum-iterator-0.7
  (package
    (name "rust-enum-iterator")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "enum-iterator" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1rldnx6avpz39i1bwb65d4gs303p40syyfc4zqwlx7mpxp2wbsjf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-enum-iterator-derive" ,rust-enum-iterator-derive-0.7))))
    (home-page "https://github.com/stephaneyfx/enum-iterator")
    (synopsis
     "Tools to iterate over all values of a type")
    (description
     "This package provides tools to iterate over all values of a type (e.g. all
variants of an enumeration).")
    (license license:bsd-0)))

(define-public rust-wasmer-compiler-3.3
  (package
    (name "rust-wasmer-compiler")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer-compiler" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "103id38x3pvpjm137ry7dj4rzixzzmrnjyxg6iyabx0sai888skj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-enum-iterator" ,rust-enum-iterator-0.7)
                       ("rust-enumset" ,rust-enumset-1)
                       ("rust-hashbrown" ,rust-hashbrown-0.11)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-leb128" ,rust-leb128-0.2)
                       ("rust-memmap2" ,rust-memmap2-0.5)
                       ("rust-more-asserts" ,rust-more-asserts-0.2)
                       ("rust-region" ,rust-region-3)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-bytes" ,rust-serde-bytes-0.11)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasmer-object" ,rust-wasmer-object-3.3)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.3)
                       ("rust-wasmer-vm" ,rust-wasmer-vm-3.3)
                       ("rust-wasmparser" ,rust-wasmparser-0.95)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://wasmer.io/")
    (synopsis "Base compiler abstraction for Wasmer WebAssembly runtime")
    (description
     "This package provides Base compiler abstraction for Wasmer @code{WebAssembly} runtime.")
    (license (list license:expat license:asl2.0 ))))

(define-public rust-wasm-bindgen-downcast-macros-0.1
  (package
    (name "rust-wasm-bindgen-downcast-macros")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-downcast-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13zk8l5qligf53ah2my2gqn15z61wd25s18qy7zcxkn7hzx0q0n5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://wasmer.io/")
    (synopsis "The proc-macro crate for wasm-bindgen-downcast")
    (description
     "This package provides The proc-macro crate for wasm-bindgen-downcast.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-downcast-0.1
  (package
    (name "rust-wasm-bindgen-downcast")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-downcast" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0h23lhqjrrqvi5fhm4wf7r0gdvariyk6p5f0w5y6xjmw8dnh5b2x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-wasm-bindgen-downcast-macros" ,rust-wasm-bindgen-downcast-macros-0.1))))
    (home-page "https://wasmer.io/")
    (synopsis
     "Downcast a JavaScript wrapper generated by `wasm-bindgen` back to its original struct")
    (description
     "This package provides Downcast a @code{JavaScript} wrapper generated by `wasm-bindgen` back to its
original struct.")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-wasm-bindgen-0.4
  (package
    (name "rust-serde-wasm-bindgen")
    (version "0.4.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde-wasm-bindgen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gr8hrr2zx9wqq02vh5lmsyhyaf0agvapf42glq1940drlqw1d73"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))))
    (home-page "https://github.com/RReverser/serde-wasm-bindgen")
    (synopsis "Native Serde adapter for wasm-bindgen")
    (description
     "This package provides Native Serde adapter for wasm-bindgen.")
    (license license:expat)))

(define-public rust-rusty-jsc-sys-0.1
  (package
    (name "rust-rusty-jsc-sys")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rusty_jsc_sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1pyqm75fdykljz01afwfvfxcn5h2nzzy1gribs332wr6gaml6x4j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/wasmerio/rusty_jsc")
    (synopsis "Raw bindings for the JavaScriptCore engine")
    (description
     "This package provides Raw bindings for the @code{JavaScriptCore} engine.")
    (license license:expat)))

(define-public rust-rusty-jsc-macros-0.1
  (package
    (name "rust-rusty-jsc-macros")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rusty_jsc_macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wa0vh8vj2vd14rx1fi8g1pwj90pikk8ga1dvnp75lf2gh4hf93v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-pkg-config" ,rust-pkg-config-0.3)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/wasmerio/rusty_jsc")
    (synopsis "Macros for rusty_jsc")
    (description "This package provides Macros for rusty_jsc.")
    (license license:expat)))

(define-public rust-rusty-jsc-0.1
  (package
    (name "rust-rusty-jsc")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rusty_jsc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1l7xvag2mz884xpm3m43byvjka0cwwhddg30mv1gxi49qj5873sg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rusty-jsc-macros" ,rust-rusty-jsc-macros-0.1)
                       ("rust-rusty-jsc-sys" ,rust-rusty-jsc-sys-0.1))))
    (home-page "https://github.com/wasmerio/rusty_jsc")
    (synopsis "Rust bindings for the JavaScriptCore engine")
    (description
     "This package provides Rust bindings for the @code{JavaScriptCore} engine.")
    (license license:expat)))

(define-public rust-wasmer-3.3
  (package
    (name "rust-wasmer")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmer" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lnxxx296x8m7zwyccdhickksjj1d66vc0yari3yswfbv3nfvjkq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-derivative" ,rust-derivative-2)
                       ("rust-hashbrown" ,rust-hashbrown-0.11)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-more-asserts" ,rust-more-asserts-0.2)
                       ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
                       ("rust-rusty-jsc" ,rust-rusty-jsc-0.1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-wasm-bindgen" ,rust-serde-wasm-bindgen-0.4)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-wasm-bindgen-downcast" ,rust-wasm-bindgen-downcast-0.1)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-3.3)
                       ("rust-wasmer-compiler-cranelift" ,rust-wasmer-compiler-cranelift-3.3)
                       ("rust-wasmer-compiler-llvm" ,rust-wasmer-compiler-llvm-3.3)
                       ("rust-wasmer-compiler-singlepass" ,rust-wasmer-compiler-singlepass-3.3)
                       ("rust-wasmer-derive" ,rust-wasmer-derive-3.3)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.3)
                       ("rust-wasmer-vm" ,rust-wasmer-vm-3.3)
                       ("rust-wasmparser" ,rust-wasmparser-0.95)
                       ("rust-wasmparser" ,rust-wasmparser-0.83)
                       ("rust-wat" ,rust-wat-1)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://wasmer.io/")
    (synopsis "High-performance WebAssembly runtime")
    (description
     "This package provides High-performance @code{WebAssembly} runtime.")
    (license license:expat)))

(define-public rust-typetag-impl-0.1
  (package
    (name "rust-typetag-impl")
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "typetag-impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03lw15ad39bgr4m6fmr5b9lb4wapkcfsnfxsbz0362635iw4f0g6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/dtolnay/typetag")
    (synopsis "Implementation detail of the typetag crate")
    (description
     "This package provides Implementation detail of the typetag crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-typetag-0.1
  (package
    (name "rust-typetag")
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "typetag" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12jva00k063gb48bvx0p0ixwbq1l48411disynzvah92bd65d020"))))
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
    (description
     "This package provides Serde serializable and deserializable trait objects.")
    (license (list license:expat license:asl2.0))))

(define-public rust-sysinfo-0.22
  (package
    (name "rust-sysinfo")
    (version "0.22.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sysinfo" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hsx8pl4yx4fkjx609pqhscklvhmr2ljqrhs8lr778h6ffqgl6vz"))))
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
     "This package provides Library to get system information such as processes, CPUs, disks, components and
networks.")
    (license license:expat)))

(define-public rust-sixel-tokenizer-0.1
  (package
    (name "rust-sixel-tokenizer")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sixel-tokenizer" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xnlg3vfmh96bqj1fnj6qdgjdnl0zc6v07ww2xh4v5mc55k7y6xp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/zellij-org/sixel-tokenizer")
    (synopsis "Tokenizer for serialized Sixel bytes")
    (description
     "This package provides a tokenizer for serialized Sixel bytes.")
    (license license:expat)))

(define-public rust-sixel-image-0.1
  (package
    (name "rust-sixel-image")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sixel-image" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17y9yykj03i47adh0bqqra659m8rd68yxmmsp50pgf26l1fhp244"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-sixel-tokenizer" ,rust-sixel-tokenizer-0.1))))
    (home-page "https://github.com/zellij-org/sixel-image")
    (synopsis
     "An interface for querying, manipulating and serializing/deserializing Sixel data")
    (description
     "This package provides An interface for querying, manipulating and serializing/deserializing Sixel
data.")
    (license license:expat)))

(define-public rust-highway-0.6
  (package
    (name "rust-highway")
    (version "0.6.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "highway" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0p9r4ss563gj44qamnrr5bqf0p9lb8gjc0w5jqmk3jlmyrlbjq9l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/nickbabcock/highway-rs")
    (synopsis
     "Native Rust port of Google's HighwayHash, which makes use of SIMD instructions for a fast and strong hash function")
    (description
     "This package provides Native Rust port of Google's @code{HighwayHash}, which makes use of SIMD
instructions for a fast and strong hash function.")
    (license license:expat)))

(define-public rust-zellij-server-0.40
  (package
    (name "rust-zellij-server")
    (version "0.40.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zellij-server" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11cci1wskg5kbq24xlzcwngb2v7025y0xbzb031ps9nzhfnya77n"))))
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
                       ("rust-uuid" ,rust-uuid-1)
                       ("rust-wasmer" ,rust-wasmer-3.3)
                       ("rust-wasmer-wasi" ,rust-wasmer-wasi-3.1)
                       ("rust-zellij-utils" ,rust-zellij-utils-0.40))))
    (home-page "")
    (synopsis "The server-side library for Zellij")
    (description "This package provides The server-side library for Zellij.")
    (license license:expat)))

(define-public rust-prost-types-0.11
  (package
    (name "rust-prost-types")
    (version "0.11.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "prost-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04ryk38sqkp2nf4dgdqdfbgn6zwwvjraw6hqq6d9a6088shj4di1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-prost" ,rust-prost-0.11))))
    (home-page "https://github.com/tokio-rs/prost")
    (synopsis "Prost definitions of Protocol Buffers well known types")
    (description
     "This package provides Prost definitions of Protocol Buffers well known types.")
    (license license:asl2.0)))

(define-public rust-prost-build-0.11
  (package
    (name "rust-prost-build")
    (version "0.11.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "prost-build" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0w5jx97q96ydhkg67wx3lb11kfy8195c56g0476glzws5iak758i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-heck" ,rust-heck-0.4)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-multimap" ,rust-multimap-0.8)
                       ("rust-petgraph" ,rust-petgraph-0.6)
                       ("rust-prettyplease" ,rust-prettyplease-0.1)
                       ("rust-prost" ,rust-prost-0.11)
                       ("rust-prost-types" ,rust-prost-types-0.11)
                       ("rust-pulldown-cmark" ,rust-pulldown-cmark-0.9)
                       ("rust-pulldown-cmark-to-cmark" ,rust-pulldown-cmark-to-cmark-10)
                       ("rust-regex" ,rust-regex-1.8.1)
                       ("rust-syn" ,rust-syn-1)
                       ("rust-tempfile" ,rust-tempfile-3)
                       ("rust-which" ,rust-which-4))))
    (home-page "https://github.com/tokio-rs/prost")
    (synopsis
     "Generate Prost annotated Rust types from Protocol Buffers files")
    (description
     "This package provides Generate Prost annotated Rust types from Protocol Buffers files.")
    (license license:asl2.0)))

(define-public rust-file-id-0.1
  (package
    (name "rust-file-id")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "file-id" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1hx8zmiqpydj4b471nd1llj1jb8bmjxbwqmq1jy92bm8dhgfffz1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1)
                       ("rust-winapi-util" ,rust-winapi-util-0.1))))
    (home-page "https://github.com/notify-rs/notify")
    (synopsis
     "Utility for reading inode numbers (Linux, MacOS) and file IDs (Windows)")
    (description
     "This package provides Utility for reading inode numbers (Linux, @code{MacOS}) and file IDs (Windows).")
    (license (list license:cc0 license:artistic2.0))))

(define-public rust-notify-debouncer-full-0.1
  (package
    (name "rust-notify-debouncer-full")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "notify-debouncer-full" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06a2wsi514dhrq8q5ghsvkgwj7n0pliid5plipxpdrwvnhg2r0gl"))))
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
    (synopsis "Notify event debouncer optimized for ease of use")
    (description
     "This package provides notify event debouncer optimized for ease of use.")
    (license (list license:cc0 license:artistic2.0))))

(define-public rust-destructure-traitobject-0.2
  (package
    (name "rust-destructure-traitobject")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "destructure_traitobject" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ir5x9f5zksr1fs788jy5g2hyyc2hnnx7kwi87wd451wd5apb1rw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page
     "https://github.com/philip-peterson/destructure_traitobject")
    (synopsis
     "Unsafe helpers for working with raw trait objects.
(Forked from traitobject)")
    (description
     "This package provides Unsafe helpers for working with raw trait objects. (Forked from traitobject).")
    (license (list license:expat license:asl2.0))))

(define-public rust-unsafe-any-ors-1
  (package
    (name "rust-unsafe-any-ors")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unsafe-any-ors" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1bf0hxfhb3gh9hy8pw6l0jaqjprzn9w1vnfph2b2sdk50v9h78z0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-destructure-traitobject" ,rust-destructure-traitobject-0.2))))
    (home-page "https://github.com/orphanage-rs/rust-unsafe-any")
    (synopsis "Traits and implementations for unchecked downcasting")
    (description
     "This package provides Traits and implementations for unchecked downcasting.")
    (license license:expat)))

(define-public rust-typemap-ors-1
  (package
    (name "rust-typemap-ors")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "typemap-ors" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rw8lbbh8aarfacyz133p0pqq1gj96fypk2c3s7x2bgh0yvj9356"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-unsafe-any-ors" ,rust-unsafe-any-ors-1))))
    (home-page "https://github.com/orphanage-rs/rust-typemap")
    (synopsis "Typesafe store for many value types")
    (description
     "This package provides a typesafe store for many value types.")
    (license license:expat)))

(define-public rust-log-mdc-0.1
  (package
    (name "rust-log-mdc")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "log-mdc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1iw1x3qhjvrac35spikn5h06a1rxd9vw216jk8h52jhz9i0j2kd9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/sfackler/rust-log-mdc")
    (synopsis "Mapped diagnostic context (MDC) for use with the `log` crate")
    (description
     "This package provides a mapped diagnostic context (MDC) for use with the `log`
crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-log4rs-1
  (package
    (name "rust-log4rs")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "log4rs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19jck058vgb2k1jypknjcgpadq1ydrzb7sl4y8f3kl2vw5d165h8"))))
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
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-rand" ,rust-rand-0.8.0)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-value" ,rust-serde-value-0.7)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-serde-yaml" ,rust-serde-yaml-0.9)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-thread-id" ,rust-thread-id-4)
                       ("rust-toml" ,rust-toml-0.8)
                       ("rust-typemap-ors" ,rust-typemap-ors-1)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/estk/log4rs")
    (synopsis
     "highly configurable multi-output logging implementation for the `log` facade")
    (description
     "This package provides a highly configurable multi-output logging implementation
for the `log` facade.")
    (license (list license:expat license:asl2.0))))

(define-public rust-kdl-4
  (package
    (name "rust-kdl")
    (version "4.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "kdl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ixfa7lyij6iars58r633164dm14707a816883ypddnch9a8fb06"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-miette" ,rust-miette-5)
                       ("rust-nom" ,rust-nom-7)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://kdl.dev")
    (synopsis
     "Document-oriented KDL parser and API")
    (description
     "This package provides Document-oriented KDL parser and API. Allows
formatting/whitespace/comment-preserving parsing and modification of KDL text.")
    (license license:asl2.0)))

(define-public rust-to-method-1
  (package
    (name "rust-to-method")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "to_method" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1s72l06fnb5kv6vm5ds0lilg1dyciyyis09ypi5kij0mrbpcxi67"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/whentze/to_method")
    (synopsis "utility micro-crate for using Into more ergonomically.")
    (description
     "This package provides a utility micro-crate for using Into more ergonomically.")
    (license license:cc0)))

(define-public rust-spinning-0.1
  (package
    (name "rust-spinning")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "spinning" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yrs2lzyyrwvs58pya2h22pfdx3vv0h76w1av5c2dbbw5630wkrd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-lock-api" ,rust-lock-api-0.4))))
    (home-page "https://github.com/4lDO2/spinning-rs")
    (synopsis "Mutexes and SIX locks implemented by spinning")
    (description
     "This package provides Mutexes and SIX locks implemented by spinning.")
    (license (list license:expat license:asl2.0))))

(define-public rust-intmap-0.7
  (package
    (name "rust-intmap")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "intmap" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ffph34qfda5zxdvy2pvjnip9hgzbjcxw53pvdpcjaxc8n7z4lmf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/JesperAxelsson/rust-intmap")
    (synopsis "Specialized HashMap for u64 keys")
    (description
     "This package provides Specialized @code{HashMap} for u64 keys.")
    (license license:expat)))

(define-public rust-interprocess-1
  (package
    (name "rust-interprocess")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "interprocess" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1yrq3xmyf8c506z2fkiyqcxiqv21rap72fz6npizybz47czm7wl1"))))
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
    (description "This package provides Interprocess communication toolkit.")
    (license (list license:expat license:asl2.0))))

(define-public rust-colorsys-0.6
  (package
    (name "rust-colorsys")
    (version "0.6.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "colorsys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1g8vwcv89n2dzi9bmbzqlj9cl9a89jz49668grbcncv4cjx1l9jl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/emgyrz/colorsys.rs")
    (synopsis
     "Module for color conversion and mutation")
    (description
     "This package provides a module for color conversion and mutation.  Works with
RGB(a)( as hexadecimal too), HSL(a), CMYK color models and with ANSI color
codes.")
    (license license:expat)))

(define-public rust-zellij-utils-0.40
  (package
    (name "rust-zellij-utils")
    (version "0.40.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zellij-utils" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02bhl9n3ccqh9vznsyiy3xfjaw1r7ygzalcqlxyvjrswg6jgk6q1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-async-channel" ,rust-async-channel-1)
                       ("rust-async-std" ,rust-async-std-1)
                       ("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-clap" ,rust-clap-3)
                       ("rust-clap-complete" ,rust-clap-complete-3)
                       ("rust-colored" ,rust-colored-2)
                       ("rust-colorsys" ,rust-colorsys-0.6)
                       ("rust-common-path" ,rust-common-path-1)
                       ("rust-crossbeam" ,rust-crossbeam-0.8)
                       ("rust-directories" ,rust-directories-5)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-humantime" ,rust-humantime-2)
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
                       ("rust-openssl-sys" ,rust-openssl-sys-0.9)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-prost" ,rust-prost-0.11)
                       ("rust-prost-build" ,rust-prost-build-0.11)
                       ("rust-regex" ,rust-regex-1.8.1)
                       ("rust-rmp-serde" ,rust-rmp-serde-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-shellexpand" ,rust-shellexpand-3)
                       ("rust-signal-hook" ,rust-signal-hook-0.3)
                       ("rust-strip-ansi-escapes" ,rust-strip-ansi-escapes-0.1)
                       ("rust-strum" ,rust-strum-0.20)
                       ("rust-strum-macros" ,rust-strum-macros-0.20)
                       ("rust-surf" ,rust-surf-2)
                       ("rust-tempfile" ,rust-tempfile-3)
                       ("rust-termwiz" ,rust-termwiz-0.20)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-unicode-width" ,rust-unicode-width-0.1)
                       ("rust-url" ,rust-url-2)
                       ("rust-uuid" ,rust-uuid-1)
                       ("rust-vte" ,rust-vte-0.11))))
    (native-inputs
     (list pkg-config))
    (inputs
     (list openssl zlib))
    (home-page "")
    (synopsis "utility library for Zellij client and server")
    (description
     "This package provides a utility library for Zellij client and server.")
    (license license:expat)))

(define-public rust-zellij-client-0.40
  (package
    (name "rust-zellij-client")
    (version "0.40.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zellij-client" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0h915870d43hv4303pmcw59hh0pdzwlmvk2906wfznjv3rs1rbbq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4)
                       ("rust-mio" ,rust-mio-0.7)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-serde-yaml" ,rust-serde-yaml-0.8)
                       ("rust-url" ,rust-url-2)
                       ("rust-zellij-utils" ,rust-zellij-utils-0.40))))
    (home-page "")
    (synopsis "The client-side library for Zellij")
    (description "This package provides The client-side library for Zellij.")
    (license license:expat)))

(define-public rust-lev-distance-0.1
  (package
    (name "rust-lev-distance")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lev_distance" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0pk26fp1fcjyg2ml8g5ma1jj2gvgnmmri4md8y3bqdjr46yx3nbj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/ken-matsui/lev_distance#readme")
    (synopsis "Copy of Levenshtein distance implementation from Rust Compiler")
    (description
     "This package provides a copy of Levenshtein distance implementation from Rust
Compiler.")
    (license license:expat)))

(define-public rust-suggest-0.4
  (package
    (name "rust-suggest")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "suggest" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0nb6axl4i58g7k0q3p3bg6m363aw6qnqdg31y5c8b43x6bbd0n15"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-clap" ,rust-clap-3)
                       ("rust-lev-distance" ,rust-lev-distance-0.1))))
    (home-page "https://github.com/ken-matsui/suggest#readme")
    (synopsis
     "Minimal library to provide similar name suggestions like \"Did you mean?\"")
    (description
     "This package provides a minimal library to provide similar name suggestions like
\"Did you mean?\".")
    (license license:expat)))

(define-public rust-names-0.14.0
  (package
    (name "rust-names")
    (version "0.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "names" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1g1rxifcsvj9zj2nmwbdix8b5ynpghs4rq40vs966jqlylxwvpbv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-clap" ,rust-clap-3)
                       ("rust-rand" ,rust-rand-0.8.0))))
    (home-page "https://github.com/fnichol/names")
    (synopsis "random name generator with names suitable for use in container
instances, project names, application instances, etc.")
    (description
     "This package provides a random name generator with names suitable for use in
container instances, project names, application instances, etc.")
    (license license:expat)))

(define-public rust-insta-1.6
  (package
    (name "rust-insta")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "insta" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14wakg768am7vva1n9g9hq5152j9c3vcl7mpkszl0yvfcc84y3bb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-console" ,rust-console-0.14)
                       ("rust-csv" ,rust-csv-1)
                       ("rust-globset" ,rust-globset-0.4)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-pest" ,rust-pest-2)
                       ("rust-pest-derive" ,rust-pest-derive-2)
                       ("rust-ron" ,rust-ron-0.6)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-serde-yaml" ,rust-serde-yaml-0.8)
                       ("rust-similar" ,rust-similar-1)
                       ("rust-toml" ,rust-toml-0.5)
                       ("rust-uuid" ,rust-uuid-0.8)
                       ("rust-walkdir" ,rust-walkdir-2))))
    (home-page "https://insta.rs/")
    (synopsis "snapshot testing library for Rust")
    (description "This package provides a snapshot testing library for Rust.")
    (license license:asl2.0)))

(define-public rust-rand-0.8.0
  (package
    (name "rust-rand")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04jgsfz4abrppp2fkgf40m0205lypixi23v7wfnb8yb693xk0qx7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-packed-simd-2" ,rust-packed-simd-2-0.3)
                       ("rust-rand-chacha" ,rust-rand-chacha-0.3)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-rand-hc" ,rust-rand-hc-0.3)
                       ("rust-serde" ,rust-serde-1))
       #:cargo-development-inputs (("rust-bincode" ,rust-bincode-1)
                                   ("rust-rand-hc" ,rust-rand-hc-0.3)
                                   ("rust-rand-pcg" ,rust-rand-pcg-0.3))))
    (home-page "https://rust-random.github.io/book")
    (synopsis "Random number generators and other randomness functionality")
    (description
     "This package provides Random number generators and other randomness functionality.")
    (license (list license:expat license:asl2.0))))

(define-public rust-regex-1.8.1
  (package
    (name "rust-regex")
    (version "1.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "regex" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0w2kgdvs2fsv39hrsb912zjq3bx5vw1cchslvbi6mk1iycbyd0xg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-aho-corasick" ,rust-aho-corasick-1)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-regex-syntax" ,rust-regex-syntax-0.7))
       #:cargo-development-inputs (("rust-lazy-static" ,rust-lazy-static-1)
                                   ("rust-quickcheck" ,rust-quickcheck-1)
                                   ("rust-rand" ,rust-rand-0.8.0))))
    (home-page "https://github.com/rust-lang/regex")
    (synopsis
     "An implementation of regular expressions for Rust. This implementation uses
finite automata and guarantees linear time matching on all inputs.")
    (description
     "This package provides An implementation of regular expressions for Rust.  This implementation uses
finite automata and guarantees linear time matching on all inputs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-libssh2-sys-0.2
  (package
    (name "rust-libssh2-sys")
    (version "0.2.23")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libssh2-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jplndqhlsygjmsni1ydb4zbw0j5jjr47bmqnjkwif5qnipa755h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-libz-sys" ,rust-libz-sys-1)
                       ("rust-openssl-sys" ,rust-openssl-sys-0.9)
                       ("rust-pkg-config" ,rust-pkg-config-0.3)
                       ("rust-vcpkg" ,rust-vcpkg-0.2))))
    (native-inputs
     (list pkg-config))
    (inputs
     (list openssl zlib libssh2))
    (home-page "https://github.com/alexcrichton/ssh2-rs")
    (synopsis "Native bindings to the libssh2 library")
    (description
     "This package provides Native bindings to the libssh2 library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ssh2-0.9.1
  (package
    (name "rust-ssh2")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ssh2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ms4g0jpplm699q96dkd8hd807s6b4vwazizsi2j5gvbgzax8xnq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-libssh2-sys" ,rust-libssh2-sys-0.2)
                       ("rust-parking-lot" ,rust-parking-lot-0.10))
       #:cargo-development-inputs (("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://github.com/alexcrichton/ssh2-rs")
    (synopsis
     "Bindings to libssh2 for interacting with SSH servers and executing remote
commands, forwarding local ports, etc.")
    (description
     "This package provides Bindings to libssh2 for interacting with SSH servers and executing remote
commands, forwarding local ports, etc.")
    (license (list license:expat license:asl2.0))))

