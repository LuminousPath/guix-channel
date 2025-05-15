(define-module (lp packages crates-wasm)
  #:use-module (gnu packages crates-apple)
  #:use-module (gnu packages crates-compression)
  #:use-module (gnu packages crates-crypto)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-windows)
  #:use-module (gnu packages sequoia)
  #:use-module (lp packages crates-extra)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:))

(define-public rust-rusty-jsc-sys-0.1.0
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

(define-public rust-rusty-jsc-macros-0.1.0
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

(define-public rust-rusty-jsc-0.1.0
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
       #:cargo-inputs (("rust-rusty-jsc-macros" ,rust-rusty-jsc-macros-0.1.0)
                       ("rust-rusty-jsc-sys" ,rust-rusty-jsc-sys-0.1.0))))
    (home-page "https://github.com/wasmerio/rusty_jsc")
    (synopsis "Rust bindings for the JavaScriptCore engine")
    (description
     "This package provides Rust bindings for the @code{JavaScriptCore} engine.")
    (license license:expat)))

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

(define-public rust-cranelift-codegen-0.86.1
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
                       ("rust-cranelift-bforest" ,rust-cranelift-bforest-0.86.1)
                       ("rust-cranelift-codegen-meta" ,rust-cranelift-codegen-meta-0.86.1)
                       ("rust-cranelift-codegen-shared" ,rust-cranelift-codegen-shared-0.86.1)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.86.1)
                       ("rust-cranelift-isle" ,rust-cranelift-isle-0.86.1)
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

(define-public rust-cranelift-codegen-0.91.1
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
                       ("rust-cranelift-bforest" ,rust-cranelift-bforest-0.91.1)
                       ("rust-cranelift-codegen-meta" ,rust-cranelift-codegen-meta-0.91.1)
                       ("rust-cranelift-codegen-shared" ,rust-cranelift-codegen-shared-0.91.1)
                       ("rust-cranelift-egraph" ,rust-cranelift-egraph-0.91.1)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.91.1)
                       ("rust-cranelift-isle" ,rust-cranelift-isle-0.91.1)
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

(define-public rust-cranelift-bforest-0.86.1
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
       #:cargo-inputs (("rust-cranelift-entity" ,rust-cranelift-entity-0.86.1))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "forest of B+-trees")
    (description "This package provides a forest of B+-trees.")
    (license (list license:asl2.0 ))))

(define-public rust-cranelift-bforest-0.91.1
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
       #:cargo-inputs (("rust-cranelift-entity" ,rust-cranelift-entity-0.91.1))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Forest of B+-trees")
    (description "This package provides a forest of B+-trees.")
    (license (list license:asl2.0 ))))

(define-public rust-cranelift-entity-0.86.1
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

(define-public rust-cranelift-entity-0.91.1
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

(define-public rust-cranelift-codegen-meta-0.86.1
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
       #:cargo-inputs (("rust-cranelift-codegen-shared" ,rust-cranelift-codegen-shared-0.86.1))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Metaprogram for cranelift-codegen code generator library")
    (description
     "This package provides Metaprogram for cranelift-codegen code generator library.")
    (license (list license:asl2.0 ))))

(define-public rust-cranelift-codegen-meta-0.91.1
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
       #:cargo-inputs (("rust-cranelift-codegen-shared" ,rust-cranelift-codegen-shared-0.91.1))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Metaprogram for cranelift-codegen code generator library")
    (description
     "This package provides Metaprogram for cranelift-codegen code generator library.")
    (license (list license:asl2.0 ))))

(define-public rust-cranelift-codegen-shared-0.86.1
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

(define-public rust-cranelift-codegen-shared-0.91.1
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

(define-public rust-cranelift-egraph-0.91.1
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
       #:cargo-inputs (("rust-cranelift-entity" ,rust-cranelift-entity-0.91.1)
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

(define-public rust-cranelift-isle-0.86.1
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

(define-public rust-cranelift-isle-0.91.1
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

(define-public rust-cranelift-frontend-0.86.1
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
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.86.1)
                       ("rust-hashbrown" ,rust-hashbrown-0.11)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Cranelift IR builder helper")
    (description "This package provides Cranelift IR builder helper.")
    (license (list license:asl2.0 ))))

(define-public rust-cranelift-frontend-0.91.1
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
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.91.1)
                       ("rust-hashbrown" ,rust-hashbrown-0.12)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12))))
    (home-page "https://github.com/bytecodealliance/wasmtime")
    (synopsis "Cranelift IR builder helper")
    (description "This package provides Cranelift IR builder helper.")
    (license (list license:asl2.0 ))))

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
                       ("rust-rand" ,rust-rand-0.8)
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

(define-public rust-wasm-bindgen-downcast-macros-0.1.1
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

(define-public rust-wasm-bindgen-downcast-0.1.1
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
                       ("rust-wasm-bindgen-downcast-macros" ,rust-wasm-bindgen-downcast-macros-0.1.1))))
    (home-page "https://wasmer.io/")
    (synopsis
     "Downcast a JavaScript wrapper generated by `wasm-bindgen` back to its original struct")
    (description
     "This package provides Downcast a @code{JavaScript} wrapper generated by `wasm-bindgen` back to its
original struct.")
    (license (list license:expat license:asl2.0))))

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

(define-public rust-wat-1.215
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

(define-public rust-wasmer-wit-bindgen-rust-impl-0.1.1
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
                       ("rust-wasmer-wit-bindgen-gen-core" ,rust-wasmer-wit-bindgen-gen-core-0.1.1)
                       ("rust-wasmer-wit-bindgen-gen-rust-wasm" ,rust-wasmer-wit-bindgen-gen-rust-wasm-0.1.1))))
    (home-page "")
    (synopsis "wit-bindgen-gen-c")
    (description "This package provides wit-bindgen-gen-c.")
    (license license:asl2.0)))

(define-public rust-wasmer-wit-bindgen-rust-0.1.1
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
                       ("rust-wasmer-wit-bindgen-rust-impl" ,rust-wasmer-wit-bindgen-rust-impl-0.1.1))))
    (home-page "")
    (synopsis "Wit-bindgen-gen-c")
    (description "This package provides wit-bindgen-gen-c.")
    (license license:asl2.0)))

(define-public rust-wasmer-wit-bindgen-gen-rust-0.1.1
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
                       ("rust-wasmer-wit-bindgen-gen-core" ,rust-wasmer-wit-bindgen-gen-core-0.1.1))))
    (home-page "")
    (synopsis "wit-bindgen-gen-c")
    (description "This package provides wit-bindgen-gen-c.")
    (license license:asl2.0)))

(define-public rust-wasmer-wit-bindgen-gen-rust-wasm-0.1.1
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
                       ("rust-wasmer-wit-bindgen-gen-core" ,rust-wasmer-wit-bindgen-gen-core-0.1.1)
                       ("rust-wasmer-wit-bindgen-gen-rust" ,rust-wasmer-wit-bindgen-gen-rust-0.1.1))))
    (home-page "")
    (synopsis "Wit-bindgen-gen-c")
    (description "This package provides wit-bindgen-gen-c.")
    (license license:asl2.0)))

(define-public rust-wasmer-wit-parser-0.1.1
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

(define-public rust-wasmer-wit-bindgen-gen-core-0.1.1
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
                       ("rust-wasmer-wit-parser" ,rust-wasmer-wit-parser-0.1.1))))
    (home-page "")
    (synopsis "Wit-bindgen-gen-c")
    (description "This package provides wit-bindgen-gen-c.")
    (license license:asl2.0)))

(define-public rust-wasmer-wasi-types-3.1.1
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
                       ("rust-wasmer" ,rust-wasmer-3.1.1)
                       ("rust-wasmer-derive" ,rust-wasmer-derive-3.1.1)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.1.1)
                       ("rust-wasmer-wit-bindgen-gen-core" ,rust-wasmer-wit-bindgen-gen-core-0.1.1)
                       ("rust-wasmer-wit-bindgen-gen-rust-wasm" ,rust-wasmer-wit-bindgen-gen-rust-wasm-0.1.1)
                       ("rust-wasmer-wit-bindgen-rust" ,rust-wasmer-wit-bindgen-rust-0.1.1)
                       ("rust-wasmer-wit-parser" ,rust-wasmer-wit-parser-0.1.1))))
    (home-page "https://github.com/wasmerio/wasmer")
    (synopsis "WASI types for Wasmer WebAssembly runtime")
    (description
     "This package provides WASI types for Wasmer @code{WebAssembly} runtime.")
    (license license:expat)))

(define-public rust-wasmer-wasi-local-networking-3.1.1
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
                       ("rust-wasmer-vfs" ,rust-wasmer-vfs-3.1.1)
                       ("rust-wasmer-vnet" ,rust-wasmer-vnet-3.1.1))))
    (home-page "https://github.com/wasmerio/wasmer")
    (synopsis "An WASIX extension for local networking")
    (description
     "This package provides An WASIX extension for local networking.")
    (license license:expat)))

(define-public rust-wasmer-wasi-3.1.1
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
                       ("rust-wasmer" ,rust-wasmer-3.1.1)
                       ("rust-wasmer-emscripten" ,rust-wasmer-emscripten-3.1.1)
                       ("rust-wasmer-vbus" ,rust-wasmer-vbus-3.1.1)
                       ("rust-wasmer-vfs" ,rust-wasmer-vfs-3.1.1)
                       ("rust-wasmer-vnet" ,rust-wasmer-vnet-3.1.1)
                       ("rust-wasmer-wasi-local-networking"
                        ,rust-wasmer-wasi-local-networking-3.1.1)
                       ("rust-wasmer-wasi-types" ,rust-wasmer-wasi-types-3.1.1)
                       ("rust-webc" ,rust-webc-3)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/wasmerio/wasmer")
    (synopsis "WASI implementation library for Wasmer WebAssembly runtime")
    (description
     "This package provides WASI implementation library for Wasmer
@code{WebAssembly} runtime.")
    (license license:expat)))

(define-public rust-wasmer-vnet-3.1.1
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
                       ("rust-wasmer-vfs" ,rust-wasmer-vfs-3.1.1))))
    (home-page "")
    (synopsis "Wasmer Virtual Networking")
    (description "This package provides Wasmer Virtual Networking.")
    (license license:expat)))

(define-public rust-wasmer-vfs-3.1.1
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

(define-public rust-wasmer-vbus-3.1.1
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
                       ("rust-wasmer-vfs" ,rust-wasmer-vfs-3.1.1))))
    (home-page "")
    (synopsis "Wasmer Virtual Bus")
    (description "This package provides Wasmer Virtual Bus.")
    (license license:expat)))

(define-public rust-wasmer-emscripten-3.1.1
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
                       ("rust-wasmer" ,rust-wasmer-3.1.1)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.1.1))))
    (home-page "https://wasmer.io/")
    (synopsis
     "Emscripten implementation library for Wasmer WebAssembly runtime")
    (description
     "This package provides Emscripten implementation library for Wasmer @code{WebAssembly} runtime.")
    (license license:expat)))

(define-public rust-wasmer-derive-3.1.1
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

(define-public rust-wasmer-derive-3.3.0
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

(define-public rust-wasmer-compiler-singlepass-3.1.1
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
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-3.1.1)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.1.1))))
    (home-page "https://wasmer.io/")
    (synopsis "Singlepass compiler for Wasmer WebAssembly runtime")
    (description
     "This package provides Singlepass compiler for Wasmer @code{WebAssembly} runtime.")
    (license license:expat)))

(define-public rust-wasmer-compiler-singlepass-3.3.0
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
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-3.3.0)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.3.0))))
    (home-page "https://wasmer.io/")
    (synopsis "Singlepass compiler for Wasmer WebAssembly runtime")
    (description
     "This package provides Singlepass compiler for Wasmer @code{WebAssembly} runtime.")
    (license license:expat)))

(define-public rust-wasmer-compiler-llvm-3.1.1
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
                       ("rust-regex" ,rust-regex-1)
                       ("rust-rustc-version" ,rust-rustc-version-0.4)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-3.1.1)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.1.1)
                       ("rust-wasmer-vm" ,rust-wasmer-vm-3.1.1))))
    (home-page "https://wasmer.io/")
    (synopsis "LLVM compiler for Wasmer WebAssembly runtime")
    (description
     "This package provides LLVM compiler for Wasmer @code{WebAssembly} runtime.")
    (license license:expat)))

(define-public rust-wasmer-compiler-llvm-3.3.0
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
                       ("rust-regex" ,rust-regex-1)
                       ("rust-rustc-version" ,rust-rustc-version-0.4)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-3.3.0)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.3.0)
                       ("rust-wasmer-vm" ,rust-wasmer-vm-3.3.0))))
    (home-page "https://wasmer.io/")
    (synopsis "LLVM compiler for Wasmer WebAssembly runtime")
    (description
     "This package provides LLVM compiler for Wasmer @code{WebAssembly} runtime.")
    (license license:expat)))

(define-public rust-wasmer-compiler-cranelift-3.1.1
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
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.86.1)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.86.1)
                       ("rust-cranelift-frontend" ,rust-cranelift-frontend-0.86.1)
                       ("rust-gimli" ,rust-gimli-0.26)
                       ("rust-hashbrown" ,rust-hashbrown-0.11)
                       ("rust-more-asserts" ,rust-more-asserts-0.2)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-3.1.1)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.1.1))))
    (home-page "https://wasmer.io/")
    (synopsis "Cranelift compiler for Wasmer WebAssembly runtime")
    (description
     "This package provides Cranelift compiler for Wasmer @code{WebAssembly} runtime.")
    (license (list license:expat license:asl2.0 ))))

(define-public rust-wasmer-compiler-cranelift-3.3.0
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
       #:cargo-inputs (("rust-cranelift-codegen" ,rust-cranelift-codegen-0.91.1)
                       ("rust-cranelift-entity" ,rust-cranelift-entity-0.91.1)
                       ("rust-cranelift-frontend" ,rust-cranelift-frontend-0.91.1)
                       ("rust-gimli" ,rust-gimli-0.26)
                       ("rust-hashbrown" ,rust-hashbrown-0.11)
                       ("rust-more-asserts" ,rust-more-asserts-0.2)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-3.3.0)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.3.0))))
    (home-page "https://wasmer.io/")
    (synopsis "Cranelift compiler for Wasmer WebAssembly runtime")
    (description
     "This package provides Cranelift compiler for Wasmer @code{WebAssembly} runtime.")
    (license (list license:expat license:asl2.0 ))))

(define-public rust-wasmer-vm-3.1.1
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
                       ("rust-wasmer-types" ,rust-wasmer-types-3.1.1)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://wasmer.io/")
    (synopsis "Runtime library support for Wasmer")
    (description "This package provides Runtime library support for Wasmer.")
    (license (list license:expat license:asl2.0 ))))

(define-public rust-wasmer-vm-3.3.0
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
                       ("rust-wasmer-types" ,rust-wasmer-types-3.3.0)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://wasmer.io/")
    (synopsis "Runtime library support for Wasmer")
    (description "This package provides Runtime library support for Wasmer.")
    (license (list license:expat license:asl2.0 ))))

(define-public rust-wasmer-types-3.1.1
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

(define-public rust-wasmer-types-3.3.0
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

(define-public rust-wasmer-object-3.1.1
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
                       ("rust-wasmer-types" ,rust-wasmer-types-3.1.1))))
    (home-page "https://wasmer.io/")
    (synopsis "Wasmer Native Object generator")
    (description "This package provides Wasmer Native Object generator.")
    (license license:expat)))

(define-public rust-wasmer-object-3.3.0
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
                       ("rust-wasmer-types" ,rust-wasmer-types-3.3.0))))
    (home-page "https://wasmer.io/")
    (synopsis "Wasmer Native Object generator")
    (description "This package provides Wasmer Native Object generator.")
    (license license:expat)))

(define-public rust-wasmer-compiler-3.1.1
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
                       ("rust-wasmer-object" ,rust-wasmer-object-3.1.1)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.1.1)
                       ("rust-wasmer-vm" ,rust-wasmer-vm-3.1.1)
                       ("rust-wasmparser" ,rust-wasmparser-0.83)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://wasmer.io/")
    (synopsis "Base compiler abstraction for Wasmer WebAssembly runtime")
    (description
     "This package provides Base compiler abstraction for Wasmer @code{WebAssembly} runtime.")
    (license (list license:expat license:asl2.0 ))))

(define-public rust-wasmer-compiler-3.3.0
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
                       ("rust-wasmer-object" ,rust-wasmer-object-3.3.0)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.3.0)
                       ("rust-wasmer-vm" ,rust-wasmer-vm-3.3.0)
                       ("rust-wasmparser" ,rust-wasmparser-0.95)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://wasmer.io/")
    (synopsis "Base compiler abstraction for Wasmer WebAssembly runtime")
    (description
     "This package provides Base compiler abstraction for Wasmer @code{WebAssembly} runtime.")
    (license (list license:expat license:asl2.0 ))))

(define-public rust-wasmer-3.1.1
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
                       ("rust-wasm-bindgen-downcast" ,rust-wasm-bindgen-downcast-0.1.1)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-3.1.1)
                       ("rust-wasmer-compiler-cranelift" ,rust-wasmer-compiler-cranelift-3.1.1)
                       ("rust-wasmer-compiler-llvm" ,rust-wasmer-compiler-llvm-3.1.1)
                       ("rust-wasmer-compiler-singlepass" ,rust-wasmer-compiler-singlepass-3.1.1)
                       ("rust-wasmer-derive" ,rust-wasmer-derive-3.1.1)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.1.1)
                       ("rust-wasmer-vm" ,rust-wasmer-vm-3.1.1)
                       ("rust-wasmparser" ,rust-wasmparser-0.83)
                       ("rust-wat" ,rust-wat-1.215)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://wasmer.io/")
    (synopsis "High-performance WebAssembly runtime")
    (description
     "This package provides High-performance @code{WebAssembly} runtime.")
    (license license:expat)))

(define-public rust-wasmer-3.3.0
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
                       ("rust-rusty-jsc" ,rust-rusty-jsc-0.1.0)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-wasm-bindgen" ,rust-serde-wasm-bindgen-0.4)
                       ("rust-target-lexicon" ,rust-target-lexicon-0.12)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-wasm-bindgen-downcast" ,rust-wasm-bindgen-downcast-0.1.1)
                       ("rust-wasmer-compiler" ,rust-wasmer-compiler-3.3.0)
                       ("rust-wasmer-compiler-cranelift" ,rust-wasmer-compiler-cranelift-3.3.0)
                       ("rust-wasmer-compiler-llvm" ,rust-wasmer-compiler-llvm-3.3.0)
                       ("rust-wasmer-compiler-singlepass" ,rust-wasmer-compiler-singlepass-3.3.0)
                       ("rust-wasmer-derive" ,rust-wasmer-derive-3.3.0)
                       ("rust-wasmer-types" ,rust-wasmer-types-3.3.0)
                       ("rust-wasmer-vm" ,rust-wasmer-vm-3.3.0)
                       ("rust-wasmparser" ,rust-wasmparser-0.95)
                       ("rust-wasmparser" ,rust-wasmparser-0.83)
                       ("rust-wat" ,rust-wat-1.215)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://wasmer.io/")
    (synopsis "High-performance WebAssembly runtime")
    (description
     "This package provides High-performance @code{WebAssembly} runtime.")
    (license license:expat)))
