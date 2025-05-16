(define-module (lp packages crates-wasm)
  ;; #:use-module (gnu packages crates-apple)
  #:use-module (gnu packages crates-compression)
  #:use-module (gnu packages crates-crypto)
  #:use-module (gnu packages crates-io)
  ;; #:use-module (gnu packages crates-windows)
  ;; #:use-module (gnu packages sequoia)
  #:use-module (lp packages crates-bytecodealliance)
  #:use-module (lp packages crates-extra)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:))

(define-public rust-winch-codegen-0.19
  (package
    (name "rust-winch-codegen")
    (version "0.19.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winch-codegen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02izkmyd3rqj47zzmbkippf2xjhvr6clfpb03nwy06kgax0sd8wi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cranelift-codegen" ,rust-cranelift-codegen-0.108)
                       ("rust-gimli" ,rust-gimli-0.28)
                       ("rust-regalloc2" ,rust-regalloc2-0.9)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-wasmparser" ,rust-wasmparser-0.207)
                       ("rust-wasmtime-cranelift" ,rust-wasmtime-cranelift-21)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-21))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Winch code generation library")
    (description "This package provides Winch code generation library.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmtime-wmemcheck-21
  (package
    (name "rust-wasmtime-wmemcheck")
    (version "21.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-wmemcheck" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "10n6v6750nhvdw4px1sq3ag8xpl5axgp17sd7j5icx7cx0xqgrli"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Memcheck implementation for Wasmtime")
    (description "This package provides Memcheck implementation for Wasmtime.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmtime-winch-21
  (package
    (name "rust-wasmtime-winch")
    (version "21.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-winch" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0j55lz24zz91h4l59c7kjiq215drpzzxrrd8q38b9lyiqv9s9xw8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cranelift-codegen" ,rust-cranelift-codegen-0.108)
                       ("rust-gimli" ,rust-gimli-0.28)
                       ("rust-object" ,rust-object-0.33)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-wasmparser" ,rust-wasmparser-0.207)
                       ("rust-wasmtime-cranelift" ,rust-wasmtime-cranelift-21)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-21)
                       ("rust-winch-codegen" ,rust-winch-codegen-0.19))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Integration between Wasmtime and Winch")
    (description
     "This package provides Integration between Wasmtime and Winch.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmtime-slab-21
  (package
    (name "rust-wasmtime-slab")
    (version "21.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-slab" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xciprxxxfny30k4dib6mlqgxplxi2kgf1x0mbc74yh6p7ygx5xw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Uni-typed slab with a free list for use in Wasmtime")
    (description
     "This package provides Uni-typed slab with a free list for use in Wasmtime.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmtime-jit-icache-coherence-21
  (package
    (name "rust-wasmtime-jit-icache-coherence")
    (version "21.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-jit-icache-coherence" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zgrs921q4b4mxb99i4j72ymz7f6xfkxzvmvaq943zabk6lwmjrx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Utilities for JIT icache maintenance")
    (description "This package provides Utilities for JIT icache maintenance.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmtime-jit-debug-21
  (package
    (name "rust-wasmtime-jit-debug")
    (version "21.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-jit-debug" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hb852xsl76ifpxmdi30mjs88d74sb9axk2kfc1m2xx14bcbgsk0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-object" ,rust-object-0.33)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-21))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "JIT debug interfaces support for Wasmtime")
    (description
     "This package provides JIT debug interfaces support for Wasmtime.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmtime-fiber-21
  (package
    (name "rust-wasmtime-fiber")
    (version "21.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-fiber" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jgjmzrax23ywqgrbm15d4bx9x2q737fhbf5895z6ma4qq5cwxgs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cc" ,rust-cc-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-wasmtime-asm-macros" ,rust-wasmtime-asm-macros-21)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-21)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-21)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Fiber support for Wasmtime")
    (description "This package provides Fiber support for Wasmtime.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmtime-versioned-export-macros-21
  (package
    (name "rust-wasmtime-versioned-export-macros")
    (version "21.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-versioned-export-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1s34brjp2kbszmzixd0miw9kvikj4hwr98dv5gnk1vkhacnhsjyj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Macros for defining versioned exports in Wasmtime")
    (description
     "This package provides Macros for defining versioned exports in Wasmtime.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmprinter-0.207
  (package
    (name "rust-wasmprinter")
    (version "0.207.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmprinter" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "05cic6n0fgcwwqljb2q30m2yhrjpvgck8hvbiqh61d5b9mxqlbcw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-wasmparser" ,rust-wasmparser-0.207))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasmprinter")
    (synopsis
     "Rust converter from the WebAssembly binary format to the text format.")
    (description
     "This package provides Rust converter from the @code{WebAssembly} binary format to the text format.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmprinter-0.230
  (package
    (name "rust-wasmprinter")
    (version "0.230.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmprinter" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0cpw0ihmly3h9jyd9kyga8p2m9ibl2qakcq6n13j4jwgwjhykj4x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-termcolor" ,rust-termcolor-1)
                       ("rust-wasmparser" ,rust-wasmparser-0.230))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasmprinter")
    (synopsis
     "Rust converter from the WebAssembly binary format to the text format.")
    (description
     "This package provides Rust converter from the @code{WebAssembly} binary format to the text format.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-wit-parser-0.207
  (package
    (name "rust-wit-parser")
    (version "0.207.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wit-parser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qg6zzg1xkdplcqxpigg2y6d1zyyck43qmp3ry38sqd96fmkvj3q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-id-arena" ,rust-id-arena-2)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-unicode-xid" ,rust-unicode-xid-0.2)
                       ("rust-wasmparser" ,rust-wasmparser-0.207)
                       ("rust-wat" ,rust-wat-1))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wit-parser")
    (synopsis
     "Tooling for parsing `*.wit` files and working with their contents.")
    (description
     "This package provides Tooling for parsing `*.wit` files and working with their contents.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmparser-0.201
  (package
    (name "rust-wasmparser")
    (version "0.201.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmparser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "027pdclgl642hqzdi592nnhdf7j570bhyi9sqsppy3bcp9nxzrc4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-semver" ,rust-semver-1))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasmparser")
    (synopsis
     "simple event-driven library for parsing WebAssembly binary files.")
    (description
     "This package provides a simple event-driven library for parsing
@code{WebAssembly} binary files.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmparser-0.207
  (package
    (name "rust-wasmparser")
    (version "0.207.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmparser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0b694q3frf4xvavj0rw7xk3j852gqljdp2pghajnsq87mgwbk6z1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ahash" ,rust-ahash-0.8)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-semver" ,rust-semver-1))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasmparser")
    (synopsis
     "simple event-driven library for parsing WebAssembly binary files.")
    (description
     "This package provides a simple event-driven library for parsing
@code{WebAssembly} binary files.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmparser-0.230
  (package
    (name "rust-wasmparser")
    (version "0.230.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmparser" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1va68fhy3safhv200j5hz8fjc55akd2iv9bh6dc3a1askfk9i0c0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-hashbrown" ,rust-hashbrown-0.15)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-serde" ,rust-serde-1))
       #:cargo-development-inputs (("rust-anyhow" ,rust-anyhow-1)
                                   ("rust-criterion" ,rust-criterion-0.5)
                                   ("rust-env-logger" ,rust-env-logger-0.11)
                                   ("rust-log" ,rust-log-0.4)
                                   ("rust-once-cell" ,rust-once-cell-1)
                                   ("rust-rayon" ,rust-rayon-1))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasmparser")
    (synopsis
     "simple event-driven library for parsing WebAssembly binary files.")
    (description
     "This package provides a simple event-driven library for parsing
@code{WebAssembly} binary files.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-wasm-encoder-0.207
  (package
    (name "rust-wasm-encoder")
    (version "0.207.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-encoder" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "05zynckhybg946r2hrwzy753c0nzf3vf5nvs2pcy1bmfndpk15nr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-leb128" ,rust-leb128-0.2)
                       ("rust-wasmparser" ,rust-wasmparser-0.207))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasm-encoder")
    (synopsis "low-level WebAssembly encoder.")
    (description
     "This package provides a low-level @code{WebAssembly} encoder.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasm-encoder-0.230
  (package
    (name "rust-wasm-encoder")
    (version "0.230.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-encoder" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0q36rvamparnn57ki5jbr8yhk4v2hyg67fai9d1nx3ki8c4rsd6l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-leb128fmt" ,rust-leb128fmt-0.1)
                       ("rust-wasmparser" ,rust-wasmparser-0.230))
       #:cargo-development-inputs (("rust-anyhow" ,rust-anyhow-1)
                                   ("rust-tempfile" ,rust-tempfile-3)
                                   ("rust-wasmprinter" ,rust-wasmprinter-0.230))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wasm-encoder")
    (synopsis "low-level WebAssembly encoder.")
    (description
     "This package provides a low-level @code{WebAssembly} encoder.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-wat-1
  (package
    (name "rust-wat")
    (version "1.230.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wat" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1558xrjpmh5ky86fknmhd8v55fgbc5gwpfijmhzbi3g354idcxqd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-wast" ,rust-wast-230))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wat")
    (synopsis "Rust parser for the WebAssembly Text format, WAT")
    (description
     "This package provides Rust parser for the @code{WebAssembly} Text format, WAT.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-wast-35
  (package
    (name "rust-wast")
    (version "35.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wast" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0s2d43g326dw21bygpalzjnr1fi83lx4afimg1h5hilrnkql1w9f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-leb128" ,rust-leb128-0.2))
       #:cargo-development-inputs (("rust-anyhow" ,rust-anyhow-1)
                                   ("rust-rayon" ,rust-rayon-1))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wast")
    (synopsis
     "Customizable Rust parsers for the WebAssembly Text formats WAT and WAST")
    (description
     "This package provides Customizable Rust parsers for the @code{WebAssembly} Text formats WAT and WAST.")
    (license (list license:asl2.0))))

(define-public rust-wast-230
  (package
    (name "rust-wast")
    (version "230.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wast" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1w9lgdxx3ibybhilm0aglihxrwzs8f294cqmad8iasgsql1srvdq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bumpalo" ,rust-bumpalo-3)
                       ("rust-gimli" ,rust-gimli-0.31)
                       ("rust-leb128fmt" ,rust-leb128fmt-0.1)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-unicode-width" ,rust-unicode-width-0.2)
                       ("rust-wasm-encoder" ,rust-wasm-encoder-0.230))
       #:cargo-development-inputs (("rust-anyhow" ,rust-anyhow-1)
                                   ("rust-libtest-mimic" ,rust-libtest-mimic-0.8)
                                   ("rust-rand" ,rust-rand-0.8))))
    (home-page
     "https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wast")
    (synopsis
     "Customizable Rust parsers for the WebAssembly Text formats WAT and WAST")
    (description
     "This package provides Customizable Rust parsers for the @code{WebAssembly} Text formats WAT and WAST.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-wasmtime-environ-21
  (package
    (name "rust-wasmtime-environ")
    (version "21.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-environ" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16mcmgp0f8dghpnl5c049s41qvnsbzzsn29ma6j305zn23sw9854"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cpp-demangle" ,rust-cpp-demangle-0.4.4)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.108)
                       ("rust-gimli" ,rust-gimli-0.28)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-object" ,rust-object-0.33)
                       ("rust-postcard" ,rust-postcard-1)
                       ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-wasm-encoder" ,rust-wasm-encoder-0.207)
                       ("rust-wasmparser" ,rust-wasmparser-0.207)
                       ("rust-wasmprinter" ,rust-wasmprinter-0.207)
                       ("rust-wasmtime-component-util" ,rust-wasmtime-component-util-21)
                       ("rust-wasmtime-types" ,rust-wasmtime-types-21))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis
     "Standalone environment support for WebAssembly code in Cranelift")
    (description
     "This package provides Standalone environment support for @code{WebAssembly} code in Cranelift.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmtime-types-21
  (package
    (name "rust-wasmtime-types")
    (version "21.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yskl032ads5qcg74vldagn2cc7ynclqg5j81avhygnajh8jbl44"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-entity" ,rust-cranelift-entity-0.108)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-wasmparser" ,rust-wasmparser-0.207))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "WebAssembly type definitions for Cranelift")
    (description
     "This package provides @code{WebAssembly} type definitions for Cranelift.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-cranelift-wasm-0.108
  (package
    (name "rust-cranelift-wasm")
    (version "0.108.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-wasm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0r09x038sxy0mvlb8h3n3zdyl7x0aap8lm0rn0lbfrdnp727a8md"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.108)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.108)
                       ("rust-cranelift-frontend" ,rust-cranelift-frontend-0.108)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-itertools" ,rust-itertools-0.12)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-wasmparser" ,rust-wasmparser-0.207)
                       ("rust-wasmtime-types" ,rust-wasmtime-types-21))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Translator from WebAssembly to Cranelift IR")
    (description
     "This package provides Translator from @code{WebAssembly} to Cranelift IR.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-cranelift-native-0.108
  (package
    (name "rust-cranelift-native")
    (version "0.108.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-native" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "00hygwn20xaanxqhir7lj2yy34almrqpmb79bilz6hpdc43fn3dm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.108)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Support for targeting the host with Cranelift")
    (description
     "This package provides Support for targeting the host with Cranelift.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-cranelift-frontend-0.108
  (package
    (name "rust-cranelift-frontend")
    (version "0.108.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-frontend" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11dc753rp40ksfajliywbpps2qdl8z2vvb4mvpddfs1ipp23m74c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.108)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Cranelift IR builder helper")
    (description "This package provides Cranelift IR builder helper.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-cranelift-isle-0.108
  (package
    (name "rust-cranelift-isle")
    (version "0.108.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-isle" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yfxglkwcpbjjkj42zwrlz0f71x1v4h57aahl8wnlq5rkvr07b0r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-codespan-reporting" ,rust-codespan-reporting-0.11)
                       ("rust-log" ,rust-log-0.4))))
    (home-page
     "https://github.com/bytecodealliance/wasmtime/tree/main/cranelift/isle")
    (synopsis
     "ISLE: Instruction Selection and Lowering Expressions. A domain-specific language for instruction selection in Cranelift")
    (description
     "This package provides ISLE: Instruction Selection and Lowering Expressions.  A domain-specific
language for instruction selection in Cranelift.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-cranelift-control-0.108
  (package
    (name "rust-cranelift-control")
    (version "0.108.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-control" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19w5wzdsixwz48rwafipc95bsdg7vyh7z8zw9w1rbm590j0hbhzq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "White-box fuzz testing framework")
    (description "This package provides White-box fuzz testing framework.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-cranelift-codegen-shared-0.108
  (package
    (name "rust-cranelift-codegen-shared")
    (version "0.108.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-codegen-shared" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "10vk6cyp0dk5nw9mz7q1ici7bdbh4hs9a2h8h3akzy93q0pa4y5b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis
     "For code shared between cranelift-codegen-meta and cranelift-codegen")
    (description
     "This package provides For code shared between cranelift-codegen-meta and cranelift-codegen.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-cranelift-codegen-meta-0.108
  (package
    (name "rust-cranelift-codegen-meta")
    (version "0.108.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-codegen-meta" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "18k2ilk0jb7ly379vq7a8j6ldaxb7dyavwwhc6admmc0vm51id6v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-codegen-shared" ,rust-cranelift-codegen-shared-0.108))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Metaprogram for cranelift-codegen code generator library")
    (description
     "This package provides Metaprogram for cranelift-codegen code generator library.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-cranelift-entity-0.108
  (package
    (name "rust-cranelift-entity")
    (version "0.108.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-entity" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gfa7a376aqg75n5yd0ba5qhdl6rswx500mric628yp06g06zk5f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Data structures using entity references as mapping keys")
    (description
     "This package provides Data structures using entity references as mapping keys.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-cranelift-bforest-0.108
  (package
    (name "rust-cranelift-bforest")
    (version "0.108.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-bforest" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xccxsxr85b5vw2aras398jx8l8jc9jvrdgzb07bycsc5646z60f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cranelift-entity" ,rust-cranelift-entity-0.108))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "forest of B+-trees")
    (description "This package provides a forest of B+-trees.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-capstone-sys-0.16
  (package
    (name "rust-capstone-sys")
    (version "0.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "capstone-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qshi53z72yciyqskswyll6i9q40yjxf90347b3bgzqi2wkq6wgy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bindgen" ,rust-bindgen-0.59)
                       ("rust-cc" ,rust-cc-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1))))
    (home-page
     "https://github.com/capstone-rust/capstone-rs/tree/master/capstone-sys")
    (synopsis "System bindings to the capstone disassembly library")
    (description
     "This package provides System bindings to the capstone disassembly library.")
    (license license:expat)))

(define-public rust-capstone-0.12
  (package
    (name "rust-capstone")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "capstone" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0v2vfzpibdbbabi7nzqrbxn2i5p0a7m8hbhcdchjnnjqv4wa935h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-capstone-sys" ,rust-capstone-sys-0.16)
                       ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/capstone-rust/capstone-rs")
    (synopsis
     "High level bindings to capstone disassembly engine (https://capstone-engine.org/)")
    (description
     "This package provides High level bindings to capstone disassembly engine
(https://capstone-engine.org/).")
    (license license:expat)))

(define-public rust-cranelift-codegen-0.108
  (package
    (name "rust-cranelift-codegen")
    (version "0.108.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cranelift-codegen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jj5gv9pp8f65b6bn447812vrqf8pcm6rf0wjar5qc3q15dpi7ka"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-bumpalo" ,rust-bumpalo-3)
                       ("rust-capstone" ,rust-capstone-0.12)
                       ("rust-cranelift-bforest" ,rust-cranelift-bforest-0.108)
                       ("rust-cranelift-codegen-meta" ,rust-cranelift-codegen-meta-0.108)
                       ("rust-cranelift-codegen-shared" ,rust-cranelift-codegen-shared-0.108)
                       ("rust-cranelift-control" ,rust-cranelift-control-0.108)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.108)
                       ("rust-cranelift-isle" ,rust-cranelift-isle-0.108)
                       ("rust-gimli" ,rust-gimli-0.28)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-postcard" ,rust-postcard-1)
                       ("rust-regalloc2" ,rust-regalloc2-0.9)
                       ("rust-rustc-hash" ,rust-rustc-hash-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-souper-ir" ,rust-souper-ir-2)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Low-level code generator library")
    (description "This package provides Low-level code generator library.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmtime-cranelift-21
  (package
    (name "rust-wasmtime-cranelift")
    (version "21.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-cranelift" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01qpzhczghhx8vhnw6yclhk1yw7ghm55ahjk3c0p7fjmfhrils91"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-cranelift-codegen" ,rust-cranelift-codegen-0.108)
                       ("rust-cranelift-control" ,rust-cranelift-control-0.108)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.108)
                       ("rust-cranelift-frontend" ,rust-cranelift-frontend-0.108)
                       ("rust-cranelift-native" ,rust-cranelift-native-0.108)
                       ("rust-cranelift-wasm" ,rust-cranelift-wasm-0.108)
                       ("rust-gimli" ,rust-gimli-0.28)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-object" ,rust-object-0.33)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasmparser" ,rust-wasmparser-0.207)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-21)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-21))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Integration between Cranelift and Wasmtime")
    (description
     "This package provides Integration between Cranelift and Wasmtime.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmtime-wit-bindgen-21
  (package
    (name "rust-wasmtime-wit-bindgen")
    (version "21.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-wit-bindgen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12czscqga6lxkljdm3cbl6v38rcwkbdxr9rc5jl4bww0swqzqsfm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-heck" ,rust-heck-0.4)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-wit-parser" ,rust-wit-parser-0.207))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Internal `*.wit` support for the `wasmtime` crate's macros")
    (description
     "This package provides Internal `*.wit` support for the `wasmtime` crate's macros.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmtime-component-util-21
  (package
    (name "rust-wasmtime-component-util")
    (version "21.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-component-util" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1mrxsmdvd0yyifrpzks4ch1715wbx0kq52q589y4sqc4v5c1m34n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis
     "Utility types and functions to support the component model in Wasmtime")
    (description
     "This package provides Utility types and functions to support the component model in Wasmtime.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmtime-component-macro-21
  (package
    (name "rust-wasmtime-component-macro")
    (version "21.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-component-macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0bp5fs6rj2xh5mn4gj0xfnwg0aqd3j9scazb9br0k7llp5a45y9c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-wasmtime-component-util" ,rust-wasmtime-component-util-21)
                       ("rust-wasmtime-wit-bindgen" ,rust-wasmtime-wit-bindgen-21)
                       ("rust-wit-parser" ,rust-wit-parser-0.207))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Macros for deriving component interface types from Rust types")
    (description
     "This package provides Macros for deriving component interface types from Rust types.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmtime-cache-21
  (package
    (name "rust-wasmtime-cache")
    (version "21.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-cache" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1d9yay3r0krszc34z0h9g0jzq0vhdc28a1yx6g1qmb3cn8makmx3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-base64" ,rust-base64-0.21)
                       ("rust-directories-next" ,rust-directories-next-2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-postcard" ,rust-postcard-1)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-sha2" ,rust-sha2-0.10)
                       ("rust-toml" ,rust-toml-0.8)
                       ("rust-windows-sys" ,rust-windows-sys-0.52)
                       ("rust-zstd" ,rust-zstd-0.13))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Support for automatic module caching with Wasmtime")
    (description
     "This package provides Support for automatic module caching with Wasmtime.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmtime-asm-macros-21
  (package
    (name "rust-wasmtime-asm-macros")
    (version "21.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-asm-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0csan3876ahdvmgccm6z5p0pxk0qckbaa0xkadvmzq6aqdxhldqs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Macros for defining asm functions in Wasmtime")
    (description
     "This package provides Macros for defining asm functions in Wasmtime.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-psm-0.1
  (package
    (name "rust-psm")
    (version "0.1.26")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "psm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "07xfl8gpz8v9qz2zvnpcy9r3nppbhxlxkgqbxcdwsdl5xij4953f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1))))
    (home-page "https://github.com/rust-lang/stacker/")
    (synopsis
     "Portable Stack Manipulation: stack manipulation and introspection routines")
    (description
     "This package provides Portable Stack Manipulation: stack manipulation and introspection routines.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ruzstd-0.6
  (package
    (name "rust-ruzstd")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ruzstd" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yygqpar2x910lnii4k5p43aj4943hlnxpczmqhsfddmxrqa8x2i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-derive-more" ,rust-derive-more-0.99)
                       ("rust-twox-hash" ,rust-twox-hash-1))))
    (home-page "https://github.com/KillingSpark/zstd-rs")
    (synopsis "decoder for the zstd compression format")
    (description
     "This package provides a decoder for the zstd compression format.")
    (license license:expat)))

(define-public rust-object-0.33
  (package
    (name "rust-object")
    (version "0.33.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "object" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0g8xf0s1jirbipnl79lqr3cbz88zwvy2ndp10vhbqaclvw66rpfq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-crc32fast" ,rust-crc32fast-1)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-ruzstd" ,rust-ruzstd-0.6)
                       ("rust-wasmparser" ,rust-wasmparser-0.201))))
    (home-page "https://github.com/gimli-rs/object")
    (synopsis "unified interface for reading and writing object file formats.")
    (description
     "This package provides a unified interface for reading and writing object file
formats.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-memfd-0.6
  (package
    (name "rust-memfd")
    (version "0.6.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "memfd" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0r5cm3wzyr1x7768h3hns77b494qbz0g05cb9wgpjvrcsm5gmkxj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rustix" ,rust-rustix-0.38))))
    (home-page "https://github.com/lucab/memfd-rs")
    (synopsis "pure-Rust library to work with Linux memfd and sealing")
    (description
     "This package provides a pure-Rust library to work with Linux memfd and sealing.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ittapi-sys-0.4
  (package
    (name "rust-ittapi-sys")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ittapi-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1z7lgc7gwlhcvkdk6bg9sf1ww4w0b41blp90hv4a4kq6ji9kixaj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1))))
    (home-page "https://github.com/intel/ittapi/tree/master/rust/ittapi-sys")
    (synopsis "Rust bindings for ittapi")
    (description "This package provides Rust bindings for ittapi.")
    (license (list license:gpl2 license:bsd-3))))

(define-public rust-ittapi-0.4
  (package
    (name "rust-ittapi")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ittapi" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cb41dapbximlma0vnar144m2j2km44g8g6zmv6ra4y42kk6z6bb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-ittapi-sys" ,rust-ittapi-sys-0.4)
                       ("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/intel/ittapi/tree/master/rust/ittapi")
    (synopsis "High-level Rust bindings for ittapi")
    (description "This package provides High-level Rust bindings for ittapi.")
    (license (list license:gpl2 license:bsd-3))))

(define-public rust-fxprof-processed-profile-0.6
  (package
    (name "rust-fxprof-processed-profile")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fxprof-processed-profile" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ggsn3im2bfcnxic0jzk00qgiacfrg2as6i4d8kj87kzxl52rl97"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-debugid" ,rust-debugid-0.8)
                       ("rust-fxhash" ,rust-fxhash-0.2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1))))
    (home-page "https://github.com/mstange/samply/")
    (synopsis
     "Create profiles in the Firefox Profiler's processed profile JSON format")
    (description
     "This package provides Create profiles in the Firefox Profiler's processed profile JSON format.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gimli-0.28
  (package
    (name "rust-gimli")
    (version "0.28.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gimli" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lv23wc8rxvmjia3mcxc6hj9vkqnv1bqq0h8nzjcgf71mrxx6wa2"))))
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
    (synopsis "library for reading and writing the DWARF debugging format.")
    (description
     "This package provides a library for reading and writing the DWARF debugging
format.")
    (license (list license:expat license:asl2.0))))

(define-public rust-addr2line-0.21
  (package
    (name "rust-addr2line")
    (version "0.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "addr2line" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jx0k3iwyqr8klqbzk6kjvr496yd94aspis10vwsj5wy7gib4c4a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-cpp-demangle" ,rust-cpp-demangle-0.4)
                       ("rust-fallible-iterator" ,rust-fallible-iterator-0.3)
                       ("rust-gimli" ,rust-gimli-0.28)
                       ("rust-memmap2" ,rust-memmap2-0.5)
                       ("rust-object" ,rust-object-0.32)
                       ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://github.com/gimli-rs/addr2line")
    (synopsis
     "cross-platform symbolication library written in Rust, using `gimli`")
    (description
     "This package provides a cross-platform symbolication library written in Rust,
using `gimli`.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmtime-21
  (package
    (name "rust-wasmtime")
    (version "21.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qv5agvf8di77msvflpp2fj8f7qx8z29dw8mrwc3312y86a4dj4f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-addr2line" ,rust-addr2line-0.21)
                       ("rust-anyhow" ,rust-anyhow-1)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-bumpalo" ,rust-bumpalo-3)
                       ("rust-cc" ,rust-cc-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-fxprof-processed-profile" ,rust-fxprof-processed-profile-0.6)
                       ("rust-gimli" ,rust-gimli-0.28)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-indexmap" ,rust-indexmap-2)
                       ("rust-ittapi" ,rust-ittapi-0.4)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-libm" ,rust-libm-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-mach2" ,rust-mach2-0.4)
                       ("rust-memfd" ,rust-memfd-0.6)
                       ("rust-memoffset" ,rust-memoffset-0.9)
                       ("rust-object" ,rust-object-0.33)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-postcard" ,rust-postcard-1)
                       ("rust-psm" ,rust-psm-0.1)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-sptr" ,rust-sptr-0.3)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-wasm-encoder" ,rust-wasm-encoder-0.207)
                       ("rust-wasmparser" ,rust-wasmparser-0.207)
                       ("rust-wasmtime-asm-macros" ,rust-wasmtime-asm-macros-21)
                       ("rust-wasmtime-cache" ,rust-wasmtime-cache-21)
                       ("rust-wasmtime-component-macro" ,rust-wasmtime-component-macro-21)
                       ("rust-wasmtime-component-util" ,rust-wasmtime-component-util-21)
                       ("rust-wasmtime-cranelift" ,rust-wasmtime-cranelift-21)
                       ("rust-wasmtime-environ" ,rust-wasmtime-environ-21)
                       ("rust-wasmtime-fiber" ,rust-wasmtime-fiber-21)
                       ("rust-wasmtime-jit-debug" ,rust-wasmtime-jit-debug-21)
                       ("rust-wasmtime-jit-icache-coherence" ,rust-wasmtime-jit-icache-coherence-21)
                       ("rust-wasmtime-slab" ,rust-wasmtime-slab-21)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-21)
                       ("rust-wasmtime-versioned-export-macros" ,rust-wasmtime-versioned-export-macros-21)
                       ("rust-wasmtime-winch" ,rust-wasmtime-winch-21)
                       ("rust-wasmtime-wmemcheck" ,rust-wasmtime-wmemcheck-21)
                       ("rust-wat" ,rust-wat-1)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))
       #:cargo-development-inputs (("rust-proptest" ,rust-proptest-1)
                                   ("rust-rand" ,rust-rand-0.8)
                                   ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "High-level API to expose the Wasmtime runtime")
    (description
     "This package provides High-level API to expose the Wasmtime runtime.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasmtime-wasi-21
  (package
    (name "rust-wasmtime-wasi")
    (version "21.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasmtime-wasi" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "158li85g9kij9whgbfcr4xm4kz5c0nr8mdp9v3b01i2p7q1l87j6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-cap-fs-ext" ,rust-cap-fs-ext-3.4.4)
                       ("rust-cap-net-ext" ,rust-cap-net-ext-3.4.4)
                       ("rust-cap-rand" ,rust-cap-rand-3.4.4)
                       ("rust-cap-std" ,rust-cap-std-3.4.4)
                       ("rust-cap-time-ext" ,rust-cap-time-ext-3.4.4)
                       ("rust-fs-set-times" ,rust-fs-set-times-0.20)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-io-extras" ,rust-io-extras-0.18)
                       ("rust-io-lifetimes" ,rust-io-lifetimes-2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-system-interface" ,rust-system-interface-0.27)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-url" ,rust-url-2)
                       ("rust-wasmtime" ,rust-wasmtime-21)
                       ("rust-wiggle" ,rust-wiggle-21)
                       ("rust-windows-sys" ,rust-windows-sys-0.52))
       #:cargo-development-inputs (("rust-tempfile" ,rust-tempfile-3)
                                   ("rust-test-log" ,rust-test-log-0.2)
                                   ("rust-tokio" ,rust-tokio-1)
                                   ("rust-tracing-subscriber" ,rust-tracing-subscriber-0.3)
                                   ("rust-wasmtime" ,rust-wasmtime-21))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "WASI implementation in Rust")
    (description "This package provides WASI implementation in Rust.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wiggle-21
  (package
    (name "rust-wiggle")
    (version "21.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wiggle" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0r4c42n6v33p0q0ypm7k5b2krcarkc0iwpla7lmqs3avjqkaxg7h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-wasmtime" ,rust-wasmtime-21)
                       ("rust-wiggle-macro" ,rust-wiggle-macro-21)
                       ("rust-witx" ,rust-witx-0.9))
       #:cargo-development-inputs (("rust-proptest" ,rust-proptest-1)
                                   ("rust-tokio" ,rust-tokio-1)
                                   ("rust-wasmtime" ,rust-wasmtime-21))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Runtime components of wiggle code generator")
    (description
     "This package provides Runtime components of wiggle code generator.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wiggle-macro-21
  (package
    (name "rust-wiggle-macro")
    (version "21.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wiggle-macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02fc9q53sdrv5d8icqfwmzbpk7cs5psa2ibacij9y72igiwdfckn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-wiggle-generate" ,rust-wiggle-generate-21))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Wiggle code generator")
    (description "This package provides Wiggle code generator.")
    (license (list license:asl2.0))))

(define-public rust-witx-0.9
  (package
    (name "rust-witx")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "witx" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jzgmayh2jjbv70jzfka38g4bk4g1fj9d0m70qkxpkdbbixg4rp3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wast" ,rust-wast-35))
       #:cargo-development-inputs (("rust-rayon" ,rust-rayon-1))))
    (home-page "https://github.com/WebAssembly/WASI")
    (synopsis "Parse and validate witx file format")
    (description "This package provides Parse and validate witx file format.")
    (license license:asl2.0)))

(define-public rust-wiggle-generate-21
  (package
    (name "rust-wiggle-generate")
    (version "21.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wiggle-generate" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1z9p69mqq8yywv1j8xi6hvk4s2hvspq13vh526xwjfnm2xa03knn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-heck" ,rust-heck-0.4)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-shellexpand" ,rust-shellexpand-2)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-witx" ,rust-witx-0.9))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Library crate for wiggle code generator")
    (description
     "This package provides Library crate for wiggle code generator.")
    (license (list license:asl2.0))))


