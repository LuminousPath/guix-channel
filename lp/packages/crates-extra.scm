(define-module (lp packages crates-extra)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crates-apple)
  #:use-module (gnu packages crates-check)
  #:use-module (gnu packages crates-compression)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-web)
  #:use-module (gnu packages crates-windows)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages tls)
  #:use-module (lp packages crates-bytecodealliance)
  #:use-module (lp packages crates-wasm)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:))

(define-public rust-afl-0.15
  (package
    (name "rust-afl")
    (version "0.15.18")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "afl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yw4v7gkqz5dqba70r3s7c2gl9ikjms0gwy3i6sfxlj37021ra7d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-home" ,rust-home-0.5)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-rustc-version" ,rust-rustc-version-0.4)
                       ("rust-xdg" ,rust-xdg-2))))
    (home-page "https://github.com/rust-fuzz/afl.rs")
    (synopsis "Fuzzing Rust code with american-fuzzy-lop")
    (description
     "This package provides Fuzzing Rust code with american-fuzzy-lop.")
    (license license:asl2.0)))

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
     "Non-cryptographic hash function using AES-NI for high performance")
    (description
     "This package provides a non-cryptographic hash function using AES-NI for
high performance.")
    (license (list license:expat license:asl2.0))))

(define-public rust-alloc-counter-0.0.4
  (package
    (name "rust-alloc-counter")
    (version "0.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "alloc_counter" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1agxzprqi37bcy9hh3clbsl3n0awbb34vrlv4rp5afib8w53m31s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-alloc-counter-macro"
                        ,rust-alloc-counter-macro-0.0.2)
                       ("rust-pin-utils" ,rust-pin-utils-0.1))
       #:cargo-development-inputs (("rust-futures-executor"
                                    ,rust-futures-executor-0.3))))
    (home-page "https://gitlab.com/sio4/code/alloc-counter")
    (synopsis
     "Count allocations etc. Allow, deny, or forbid allocations")
    (description
     "This package provides Count allocations, reallocations, deallocations.
Allow, deny, or forbid allocations on an expression or function basis.")
    (license (list license:expat license:asl2.0))))

(define-public rust-alloc-counter-macro-0.0.2
  (package
    (name "rust-alloc-counter-macro")
    (version "0.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "alloc_counter_macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0nifqalryavmrdlkyv7cznp8yfjj16x0bjqzvjndw0fxk8gzhlhs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://gitlab.com/sio4/code/alloc-counter")
    (synopsis "The #[no_alloc] macro for the alloc_counter crate")
    (description
     "This package provides The #[no_alloc] macro for the alloc_counter crate.")
    (license (list license:expat license:asl2.0))))

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
    (home-page "https://github.com/197g/static-alloc")
    (synopsis "Traits to replace or supplement the alloc module in no_std")
    (description
     "This package provides Traits to replace or supplement the alloc module in
no_std.")
    (license license:expat)))

(define-public rust-ambient-authority-0.0.2
  (package
    (name "rust-ambient-authority")
    (version "0.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ambient-authority" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0fxsfyhy64jx7zrkb85h1vhr5nfqncja3pwpikid471d8w6yxm79"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/sunfishcode/ambient-authority")
    (synopsis "Ambient Authority")
    (description "This package provides Ambient Authority.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

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

(define-public rust-assert-unordered-0.3
  (package
    (name "rust-assert-unordered")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "assert_unordered" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0r123d4az6rhivpsymwmg0k4hn9iagp0hkhka6rkwcl1g0xk4x0w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-ansi-term" ,rust-ansi-term-0.12))))
    (home-page "https://github.com/nu11ptr/assert_unordered")
    (synopsis "Direct replacement for `assert_eq` for unordered collections")
    (description
     "This package provides a direct replacement for `assert_eq` for unordered
collections.")
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
    (synopsis "Fast bump allocation arena for Rust")
    (description
     "This package provides a fast bump allocation arena for Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-char-device-0.16
  (package
    (name "rust-char-device")
    (version "0.16.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "char-device" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qsmmh886sjxl8izdd1fm4y08yflq0mxvj030sfx70n1bmhixksm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-async-std" ,rust-async-std-1)
                       ("rust-io-extras" ,rust-io-extras-0.18)
                       ("rust-io-lifetimes" ,rust-io-lifetimes-2)
                       ("rust-rustix" ,rust-rustix-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-winx" ,rust-winx-0.36))
       #:cargo-development-inputs (("rust-async-std" ,rust-async-std-1)
                                   ("rust-tokio" ,rust-tokio-1))))
    (home-page "https://github.com/sunfishcode/char-device")
    (synopsis "Character Device I/O")
    (description "This package provides Character Device I/O.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

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
    (synopsis "Module for color conversion and mutation")
    (description
     "This package provides a module for color conversion and mutation.  Works
with RGB(a)( as hexadecimal too), HSL(a), CMYK color models and with ANSI color
codes.")
    (license license:expat)))

(define-public rust-common-path-1
  (package
    (name "rust-common-path")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "common-path" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "00firjly5xpb5hhmivnnhwakr1cwbqv8ckzyj0vbxczl89czg0i3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs (("rust-rand" ,rust-rand-0.6))))
    (synopsis "Finds the common prefix between a set of paths")
    (home-page "https://gitlab.com/pwoolcoc")
    (description
     "This package provides Finds the common prefix between a set of paths.")
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
     "This package provides a fast and safe implementation of stackful
coroutines.")
    (license (list license:expat license:asl2.0))))

(define-public rust-countme-3
  (package
    (name "rust-countme")
    (version "3.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "countme" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0dn62hhvgmwyxslh14r4nlbvz8h50cp5mnn1qhqsw63vs7yva13p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-dashmap" ,rust-dashmap-5)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rustc-hash" ,rust-rustc-hash-1))))
    (home-page "https://github.com/rust-analyzer/countme")
    (synopsis "Counts the number of live instances of types")
    (description
     "This package provides Counts the number of live instances of types.")
    (license (list license:expat license:asl2.0))))

(define-public rust-cpp-demangle-0.4.4
  (package
    (name "rust-cpp-demangle")
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cpp_demangle" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0z8c656jiwphnw1brkb0whm4kgh39h1msvgig2wc44yi58s8vrcn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-afl" ,rust-afl-0.15)
                       ("rust-cfg-if" ,rust-cfg-if-1))))
    (home-page "https://github.com/gimli-rs/cpp_demangle")
    (synopsis "Crate for demangling C++ symbols")
    (description "This package provides a crate for demangling C++ symbols.")
    (license (list license:expat license:asl2.0))))

(define-public rust-criterion-0.5
  (package
    (inherit rust-criterion-0.4)
    (name "rust-criterion")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "criterion" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0bv9ipygam3z8kk6k771gh9zi0j0lb9ir0xi1pc075ljg80jvcgj"))))
    (arguments
     `(#:cargo-inputs (("rust-anes" ,rust-anes-0.1)
                       ("rust-async-std" ,rust-async-std-1)
                       ("rust-cast" ,rust-cast-0.3)
                       ("rust-ciborium" ,rust-ciborium-0.2)
                       ("rust-clap" ,rust-clap-4)
                       ("rust-criterion-plot" ,rust-criterion-plot-0.5)
                       ("rust-csv" ,rust-csv-1)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-is-terminal" ,rust-is-terminal-0.4)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-oorandom" ,rust-oorandom-11)
                       ("rust-plotters" ,rust-plotters-0.3)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-smol" ,rust-smol-1)
                       ("rust-tinytemplate" ,rust-tinytemplate-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-walkdir" ,rust-walkdir-2))
       #:cargo-development-inputs (("rust-approx" ,rust-approx-0.5)
                                   ("rust-futures" ,rust-futures-0.3)
                                   ("rust-quickcheck" ,rust-quickcheck-1)
                                   ("rust-rand" ,rust-rand-0.8)
                                   ("rust-tempfile" ,rust-tempfile-3))))))

(define-public rust-criterion-0.4
  (package
    (name "rust-criterion")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "criterion" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jsl4r0yc3fpkyjbi8aa1jrm69apqq9rxwnjnd9brqmaq44nxiz7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-anes" ,rust-anes-0.1)
                       ("rust-async-std" ,rust-async-std-1)
                       ("rust-atty" ,rust-atty-0.2)
                       ("rust-cast" ,rust-cast-0.3)
                       ("rust-ciborium" ,rust-ciborium-0.2)
                       ("rust-clap" ,rust-clap-3)
                       ("rust-criterion-plot" ,rust-criterion-plot-0.5)
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
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-smol" ,rust-smol-1)
                       ("rust-tinytemplate" ,rust-tinytemplate-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-walkdir" ,rust-walkdir-2))
       #:cargo-development-inputs (("rust-approx" ,rust-approx-0.5)
                                   ("rust-futures" ,rust-futures-0.3)
                                   ("rust-quickcheck" ,rust-quickcheck-1)
                                   ("rust-rand" ,rust-rand-0.8)
                                   ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://bheisler.github.io/criterion.rs/book/index.html")
    (synopsis "Statistics-driven micro-benchmarking library")
    (description
     "This package provides Statistics-driven micro-benchmarking library.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-daemonize-0.4
  (package
    (name "rust-daemonize")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "daemonize" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "05cqr2zjxrxyg23snykd03sgqwxn0pvwj2lzh50bclsgwc9lbhkh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-boxfnonce" ,rust-boxfnonce-0.1)
                       ("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs (("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://github.com/knsd/daemonize")
    (synopsis
     "Library to enable your code run as a daemon process on Unix-like systems")
    (description
     "This package provides Library to enable your code run as a daemon
process on Unix-like systems.")
    (license (list license:expat license:asl2.0))))

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
    (home-page "https://github.com/philip-peterson/destructure_traitobject")
    (synopsis "Unsafe helpers for working with raw trait objects.
(Forked from traitobject)")
    (description
     "This package provides Unsafe helpers for working with raw trait objects.
(Forked from traitobject).")
    (license (list license:expat license:asl2.0))))

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
    (synopsis "Plugin for assembling code at runtime")
    (description
     "This package provides a plugin for assembling code at runtime.  Combined
with the runtime crate dynasmrt it can be used to write JIT compilers easily.")
    (license license:mpl2.0)))

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
    (synopsis "Simple runtime for assembling code at runtime")
    (description
     "This package provides a simple runtime for assembling code at
runtime.  Combined with the plugin crate dynasm it can be used to write JIT
compilers easily.")
    (license license:mpl2.0)))

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
       #:cargo-inputs (("rust-enum-iterator-derive"
                        ,rust-enum-iterator-derive-0.7))))
    (home-page "https://github.com/stephaneyfx/enum-iterator")
    (synopsis "Tools to iterate over all values of a type")
    (description
     "This package provides tools to iterate over all values of a type (e.g. all
variants of an enumeration).")
    (license license:bsd-0)))

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

(define-public rust-file-id-0.1.0
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
     "This package provides Utility for reading inode numbers (Linux,
@code{MacOS}) and file IDs (Windows).")
    (license (list license:cc0 license:artistic2.0))))

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
                       ("rust-rustc-std-workspace-alloc"
                        ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core"
                        ,rust-rustc-std-workspace-core-1)
                       ("rust-stable-deref-trait" ,rust-stable-deref-trait-1))))
    (home-page "https://github.com/gimli-rs/gimli")
    (synopsis "Library for reading and writing the DWARF debugging format")
    (description
     "This package provides a library for reading and writing the DWARF
debugging format.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gimli-0.26
  (package
    (inherit rust-gimli-0.30)
    (name "rust-gimli")
    (version "0.26.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gimli" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0pafbk64rznibgnvfidhm1pqxd14a5s9m50yvsgnbv38b8n0w0r2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-fallible-iterator" ,rust-fallible-iterator-0.2)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-rustc-std-workspace-alloc"
                        ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core"
                        ,rust-rustc-std-workspace-core-1)
                       ("rust-stable-deref-trait" ,rust-stable-deref-trait-1))
       #:cargo-development-inputs (("rust-crossbeam" ,rust-crossbeam-0.8)
                                   ("rust-getopts" ,rust-getopts-0.2)
                                   ("rust-memmap2" ,rust-memmap2-0.5)
                                   ("rust-num-cpus" ,rust-num-cpus-1)
                                   ("rust-object" ,rust-object-0.29)
                                   ("rust-rayon" ,rust-rayon-1)
                                   ("rust-regex" ,rust-regex-1)
                                   ("rust-test-assembler"
                                    ,rust-test-assembler-0.1)
                                   ("rust-typed-arena" ,rust-typed-arena-2))))))

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
    (synopsis "Native Rust port of Google's HighwayHash")
    (description
     "This package provides Native Rust port of Google's @code{HighwayHash},
which makes use of SIMD instructions for a fast and strong hash function.")
    (license license:expat)))

(define-public rust-human-name-2
  (package
    (name "rust-human-name")
    (version "2.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "human_name" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11f0vb0qsp1bfyrx1y4gq9h6cmn92iqs9pyff2i36fhgcbchmmzv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-compact-str" ,rust-compact-str-0.7)
                       ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.8)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-phf" ,rust-phf-0.11)
                       ("rust-phf-codegen" ,rust-phf-codegen-0.11)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-unicode-case-mapping"
                        ,rust-unicode-case-mapping-0.4)
                       ("rust-unicode-normalization"
                        ,rust-unicode-normalization-0.1)
                       ("rust-unicode-segmentation" ,rust-unicode-segmentation-1)
                       ("rust-unidecode" ,rust-unidecode-0.3))
       #:cargo-development-inputs (("rust-alloc-counter"
                                    ,rust-alloc-counter-0.0.4))))
    (home-page "https://github.com/djudd/human-name")
    (synopsis "Library for parsing and comparing human names")
    (description
     "This package provides a library for parsing and comparing human names.")
    (license license:asl2.0)))

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
     "Interface for your own programming languages by safely wrapping llvm-sys")
    (description
     "This package provides Inkwell aims to help you pen your own programming
languages by safely wrapping llvm-sys.")
    (license license:asl2.0)))

(define-public rust-inkwell-0.1.0
  (package
    (inherit rust-inkwell-0.1)
    (name "rust-inkwell")
    (version "0.1.0-beta.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "inkwell" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02zrx7fkdah9ldp78hcbyghp2d0l14r6l338wjil0vdfl3mx08r2"))))
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
                       ("rust-regex" ,rust-regex-1)
                       ("rust-static-alloc" ,rust-static-alloc-0.2))))))

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

(define-public rust-inkwell-internals-0.5
  (package
    (inherit rust-inkwell-internals-0.7)
    (name "rust-inkwell-internals")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "inkwell_internals" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ya9zf1f12hq5q3jq9v1x1qcshfagg4vhxhrm352811h7npr0w1w"))))))

(define-public rust-insta-1
  (package
    (name "rust-insta")
    (version "1.43.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "insta" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wa3iz1bafg3jwaqkjcs63spyalcm6chnhyxassm9065f3m38j8m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-clap" ,rust-clap-4)
                       ("rust-console" ,rust-console-0.15)
                       ("rust-csv" ,rust-csv-1)
                       ("rust-globset" ,rust-globset-0.4)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-pest" ,rust-pest-2)
                       ("rust-pest-derive" ,rust-pest-derive-2)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-ron" ,rust-ron-0.7)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-similar" ,rust-similar-2)
                       ("rust-toml" ,rust-toml-0.5)
                       ("rust-walkdir" ,rust-walkdir-2))
       #:cargo-development-inputs (("rust-rustc-version" ,rust-rustc-version-0.4)
                                   ("rust-serde" ,rust-serde-1)
                                   ("rust-similar-asserts"
                                    ,rust-similar-asserts-1))))
    (home-page "https://insta.rs/")
    (synopsis "Snapshot testing library for Rust")
    (description "This package provides a snapshot testing library for Rust.")
    (license license:asl2.0)))

(define-public rust-insta-1.6
  (package
    (inherit rust-insta-1)
    (name "rust-insta")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "insta" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14wakg768am7vva1n9g9hq5152j9c3vcl7mpkszl0yvfcc84y3bb"))))
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
                       ("rust-walkdir" ,rust-walkdir-2))))))

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

(define-public rust-isocountry-0.3
  (package
    (name "rust-isocountry")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "isocountry" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "011y6sb6rs2i85g2jvifx5s54clw7nprinzzhfx08jgvy15xr88y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/sifton/isocountry-rs")
    (synopsis "ISO 3166-1 enumeration for Rust")
    (description "This package provides ISO 3166-1 enumeration for Rust.")
    (license license:expat)))

(define-public rust-jod-thread-0.1
  (package
    (name "rust-jod-thread")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jod-thread" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1bj7g6l59ybcf33znf80ccqbxvs1cmd8ynd4m8h7ywdqk473c8wb"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/matklad/jod-thread")
    (synopsis "Package std::thread which joins on drop by default")
    (description
     "This package provides std::thread which joins on drop by default.")
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
    (synopsis "Document-oriented KDL parser and API")
    (description
     "This package provides Document-oriented KDL parser and API. Allows
formatting/whitespace/comment-preserving parsing and modification of KDL text.")
    (license license:asl2.0)))

(define-public rust-leb128fmt-0.1
  (package
    (name "rust-leb128fmt")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "leb128fmt" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1chxm1484a0bly6anh6bd7a99sn355ymlagnwj3yajafnpldkv89"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/bluk/leb128fmt")
    (synopsis "Library to encode and decode LEB128 compressed integers")
    (description
     "This package provides a library to encode and decode LEB128 compressed
integers.")
    (license (list license:expat license:asl2.0))))

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
     "This package provides a copy of Levenshtein distance implementation from
Rust Compiler.")
    (license license:expat)))

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
    (native-inputs (list pkg-config))
    (inputs (list openssl zlib libssh2))
    (home-page "https://github.com/alexcrichton/ssh2-rs")
    (synopsis "Native bindings to the libssh2 library")
    (description
     "This package provides Native bindings to the libssh2 library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-linux-raw-sys-0.9
  (package
    (name "rust-linux-raw-sys")
    (version "0.9.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "linux-raw-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04kyjdrq79lz9ibrf7czk6cv9d3jl597pb9738vzbsbzy1j5i56d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-rustc-std-workspace-core"
                        ,rust-rustc-std-workspace-core-1))
       #:cargo-development-inputs (("rust-libc" ,rust-libc-0.2)
                                   ("rust-static-assertions"
                                    ,rust-static-assertions-1))))
    (home-page "https://github.com/sunfishcode/linux-raw-sys")
    (synopsis "Generated bindings for Linux's userspace API")
    (description
     "This package provides Generated bindings for Linux's userspace API.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

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
                       ("rust-regex" ,rust-regex-1)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://gitlab.com/taricorp/llvm-sys.rs")
    (synopsis "Bindings to LLVM's C API")
    (description "This package provides Bindings to LLVM's C API.")
    (license license:expat)))

(define-public rust-llvm-sys-140
  (package
    (inherit rust-llvm-sys-150)
    (name "rust-llvm-sys")
    (version "140.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "030srgq5vgshgpmb0w05gpf3yjbh73vcrgg327n320kwhplpip73"))))))

(define-public rust-llvm-sys-130
  (package
    (inherit rust-llvm-sys-140)
    (name "rust-llvm-sys")
    (version "130.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0z6nzm49gav2x2mvmvqjsqqphrkr5w8hvbyvdq1y9gf43z4l40f2"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-clang-sys" ,rust-clang-sys-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-semver" ,rust-semver-0.11)
                       ("rust-tempfile" ,rust-tempfile-3))))))

(define-public rust-llvm-sys-120
  (package
    (inherit rust-llvm-sys-130)
    (name "rust-llvm-sys")
    (version "120.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vr1kvqr0z2pr4x4gl1b9dd71fbg7z5fw4ssp1z9qxinyj92ckv2"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-semver" ,rust-semver-0.11))))))

(define-public rust-llvm-sys-110
  (package
    (inherit rust-llvm-sys-120)
    (name "rust-llvm-sys")
    (version "110.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gbwa9i39l0rx66v8wgrg6ixpf7r35vvj9kxplg98q29qksddfks"))))))

(define-public rust-llvm-sys-100
  (package
    (inherit rust-llvm-sys-110)
    (name "rust-llvm-sys")
    (version "100.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0d2v8y9fwqqhidmdxhra7509vj503bj0zlivp9wm1xw4g28il9bj"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-semver" ,rust-semver-0.9))))))

(define-public rust-llvm-sys-90
  (package
    (inherit rust-llvm-sys-100)
    (name "rust-llvm-sys")
    (version "90.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fbrfchskrbgvf6ri2sg1qf05w53a093kig7g0vnfz3yggav0dhh"))))))

(define-public rust-llvm-sys-80
  (package
    (inherit rust-llvm-sys-90)
    (name "rust-llvm-sys")
    (version "80.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06nlp13zc47q55zscqz6fdhvh4cxjpdcxs7q23r5pz6dzpxpd9aw"))))))

(define-public rust-llvm-sys-70
  (package
    (inherit rust-llvm-sys-80)
    (name "rust-llvm-sys")
    (version "70.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1k9z7qdrss9dfdc64bbbq846plvgp98yir7yyzk7hy61gq900cv7"))))))

(define-public rust-llvm-sys-60
  (package
    (inherit rust-llvm-sys-70)
    (name "rust-llvm-sys")
    (version "60.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ky5xqmc5k7lq9lwfp95yinyxzwsd3d5x06gybcl0scvd4wsg9z8"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-0.2)
                       ("rust-semver" ,rust-semver-0.9))))))

(define-public rust-llvm-sys-50
  (package
    (inherit rust-llvm-sys-60)
    (name "rust-llvm-sys")
    (version "50.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "15g89sslrf5c6z5bdrpssimpsr2il9bwaaql5nvscgwybzrhizdf"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-lazy-static" ,rust-lazy-static-0.2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-0.2)
                       ("rust-semver" ,rust-semver-0.6))))))

(define-public rust-llvm-sys-40
  (package
    (inherit rust-llvm-sys-50)
    (name "rust-llvm-sys")
    (version "40.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "099lk8w19is1s4hywilpmnaqp5lm8gp2hw5f06g6f8xn65yi7sm7"))))))

(define-public rust-llvm-sys-39
  (package
    (inherit rust-llvm-sys-40)
    (name "rust-llvm-sys")
    (version "39.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0j1l36n0vz7vpz8gys9pg5qay5vjjavmgxryf7cib09mz8i6pys4"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-0.7)
                       ("rust-gcc" ,rust-gcc-0.3)
                       ("rust-lazy-static" ,rust-lazy-static-0.2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-regex" ,rust-regex-0.1)
                       ("rust-semver" ,rust-semver-0.4))))))

(define-public rust-llvm-sys-38
  (package
    (inherit rust-llvm-sys-39)
    (name "rust-llvm-sys")
    (version "38.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ac98n14q7idk69rcja73rijrhqdk2klv14z82dsgndv4xl2x3hs"))))))

(define-public rust-llvm-sys-37
  (package
    (inherit rust-llvm-sys-38)
    (name "rust-llvm-sys")
    (version "37.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qm1fzfddzr6njms5w7vpg11xqxvdb0hzvfv8q32fja6gkkrgnn7"))))))

(define-public rust-llvm-sys-36
  (package
    (inherit rust-llvm-sys-37)
    (name "rust-llvm-sys")
    (version "36.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "llvm-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ffbzs4svw3rvcypk6a0qnp2c7k140n6n8cffhf7b2mlw3cb7983"))))))

(define-public rust-log-mdc-0.1.0
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
     "This package provides a mapped diagnostic context (MDC) for use with the
`log` crate.")
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
                       ("rust-log-mdc" ,rust-log-mdc-0.1.0)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-rand" ,rust-rand-0.8)
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
     "Highly configurable multi-output logging implementation for the `log`
facade")
    (description
     "This package provides a highly configurable multi-output logging
implementation for the `log` facade.")
    (license (list license:expat license:asl2.0))))

(define-public rust-logos-0.12
  (package
    (name "rust-logos")
    (version "0.12.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "logos" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1w82qm3hck5cr6ax3j3yzrpf4zzbffahz126ahyqwyn6h8b072xz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-logos-derive" ,rust-logos-derive-0.12))))
    (home-page "https://logos.maciej.codes/")
    (synopsis "Create ridiculously fast Lexers")
    (description "This package provides Create ridiculously fast Lexers.")
    (license (list license:expat license:asl2.0))))

(define-public rust-logos-derive-0.12
  (package
    (name "rust-logos-derive")
    (version "0.12.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "logos-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0v295x78vcskab88hshl530w9d1vn61cmlaic4d6dydsila4kn51"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-beef" ,rust-beef-0.5)
                       ("rust-fnv" ,rust-fnv-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-regex-syntax" ,rust-regex-syntax-0.6)
                       ("rust-syn" ,rust-syn-1))
       #:cargo-development-inputs (("rust-pretty-assertions"
                                    ,rust-pretty-assertions-0.6))))
    (home-page "https://logos.maciej.codes/")
    (synopsis "Create ridiculously fast Lexers")
    (description "This package provides Create ridiculously fast Lexers.")
    (license (list license:expat license:asl2.0))))

(define-public rust-lsp-server-0.6
  (package
    (name "rust-lsp-server")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lsp-server" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0nkp6sy5dmvishsg5rjvv3q57h87ald21zmq5506bxlwqb0p01gp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-crossbeam-channel" ,rust-crossbeam-channel-0.5)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1))
       #:cargo-development-inputs (("rust-lsp-types" ,rust-lsp-types-0.93))))
    (home-page
     "https://github.com/rust-lang/rust-analyzer/tree/master/lib/lsp-server")
    (synopsis "Generic LSP server scaffold")
    (description "This package provides Generic LSP server scaffold.")
    (license (list license:expat license:asl2.0))))

(define-public rust-lsp-types-0.93
  (package
    (name "rust-lsp-types")
    (version "0.93.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lsp-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lfawrvxq3k6jpblyikfvzh1759zf3zpl39pfhcnb3yiwb3ykrlv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-serde-repr" ,rust-serde-repr-0.1)
                       ("rust-url" ,rust-url-2))))
    (home-page "https://github.com/gluon-lang/lsp-types")
    (synopsis
     "Types for a language server, using VSCode's Language Server Protocol")
    (description
     "This package provides Types for interaction with a language server, using
VSCode's Language Server Protocol.")
    (license license:expat)))

(define-public rust-mach2-0.4
  (package
    (name "rust-mach2")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mach2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02gpyq89rcrqdbz4hgp5bpjas21dllxfc70jgw8vj0iaxg6mbf8r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/JohnTitor/mach2")
    (synopsis
     "Interface to the user-space API of the Mach 3 kernel that underlies OSX")
    (description
     "This package provides a Rust interface to the user-space API of the Mach
3.0 kernel that underlies OSX.")
    (license (list license:bsd-2 license:expat license:asl2.0))))

(define-public rust-maybe-owned-0.3
  (package
    (name "rust-maybe-owned")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "maybe-owned" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1d3sqiv59i06k73x6p7mf294zgdfb2qkky127ipfnjj9mr9wgb2g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-serde" ,rust-serde-1))
       #:cargo-development-inputs (("rust-serde-derive" ,rust-serde-derive-1)
                                   ("rust-serde-json" ,rust-serde-json-1))))
    (home-page "https://github.com/rustonaut/maybe-owned")
    (synopsis
     "Provides a `MaybeOwned` (and `MaybeOwnedMut`) type similar to std's
`Cow`")
    (description
     "This package provides provides a @code{MaybeOwned} (and
@code{MaybeOwnedMut}) type similar to std's `Cow` but it implements
@code{From<T>} and @code{From<&'a T>} and does not require @code{ToOwned}.")
    (license (list license:expat license:asl2.0))))

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
     "Diagnostic reporting library and protocol for whom aren't compiler hackers")
    (description
     "This package provides Fancy diagnostic reporting library and protocol for
us mere mortals who aren't compiler hackers.")
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
     "This package provides Derive macros for miette.  Like `thiserror` for
Diagnostics.")
    (license license:asl2.0)))

(define-public rust-names-0.14
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
                       ("rust-rand" ,rust-rand-0.8))))
    (home-page "https://github.com/fnichol/names")
    (synopsis "Random name generator with names")
    (description
     "This package provides a random name generator with names suitable for use
in container instances, project names, application instances, etc.")
    (license license:expat)))

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
                       ("rust-file-id" ,rust-file-id-0.1.0)
                       ("rust-notify" ,rust-notify-6)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-walkdir" ,rust-walkdir-2))))
    (home-page "https://github.com/notify-rs/notify")
    (synopsis "Notify event debouncer optimized for ease of use")
    (description
     "This package provides notify event debouncer optimized for ease of use.")
    (license (list license:cc0 license:artistic2.0))))

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
                       ("rust-pulldown-cmark-to-cmark"
                        ,rust-pulldown-cmark-to-cmark-10)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-syn" ,rust-syn-1)
                       ("rust-tempfile" ,rust-tempfile-3)
                       ("rust-which" ,rust-which-4))))
    (home-page "https://github.com/tokio-rs/prost")
    (synopsis
     "Generate Prost annotated Rust types from Protocol Buffers files")
    (description
     "This package provides Generate Prost annotated Rust types from Protocol
Buffers files.")
    (license license:asl2.0)))

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
     "This package provides Prost definitions of Protocol Buffers well known
types.")
    (license license:asl2.0)))

(define-public rust-rand-0.8
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
    (home-page "https://rust-random.github.io/book/")
    (synopsis "Random number generators and other randomness functionality")
    (description
     "This package provides Random number generators and other randomness
functionality.")
    (license (list license:expat license:asl2.0))))

(define-public rust-regex-1
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
                                   ("rust-rand" ,rust-rand-0.8))))
    (home-page "https://github.com/rust-lang/regex")
    (synopsis
     "Implementation of regular expressions for Rust")
    (description
     "This package provides An implementation of regular expressions for Rust.
This implementation uses finite automata and guarantees linear time matching on
all inputs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rowan-0.15
  (package
    (name "rust-rowan")
    (version "0.15.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rowan" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gdf8whwfzv41dr6xp2rhvgy83ckgg7wa7bss8rfcipsac12nm0a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-countme" ,rust-countme-3)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-rustc-hash" ,rust-rustc-hash-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-text-size" ,rust-text-size-1))
       #:cargo-development-inputs (("rust-m-lexer" ,rust-m-lexer-0.0.4))))
    (home-page "https://github.com/rust-analyzer/rowan")
    (synopsis "Library for generic lossless syntax trees")
    (description
     "This package provides Library for generic lossless syntax trees.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rustix-linux-procfs-0.1
  (package
    (name "rust-rustix-linux-procfs")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustix-linux-procfs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0mi0w4zgw263gaf2ss5a2qg38hcqvh979wjqqzrc85max7vlpj1g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rustix" ,rust-rustix-1))
       #:cargo-development-inputs (("rust-rustix" ,rust-rustix-1))))
    (home-page "https://github.com/sunfishcode/rustix-linux-procfs")
    (synopsis "Utilities for opening Linux procfs files and directories")
    (description
     "This package provides Utilities for opening Linux procfs files and
directories.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

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
     "This package provides Parser and evaluator for Cargo's flavor of Semantic
Versioning.")
    (license (list license:expat license:asl2.0))))

(define-public rust-semver-0.4
  (package
    (inherit rust-semver-0.6)
    (name "rust-semver")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "semver" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kirdvbj06x6hffrab86raqy3dyf9i903ny1qlmj12iyq2phc76a"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-semver-parser" ,rust-semver-parser-0.6))))))

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
    (synopsis "Parsing of the semver spec")
    (description "This package provides Parsing of the semver spec.")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-millis-0.1
  (package
    (name "rust-serde-millis")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_millis" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "002d8dk3fwidh5j44aixjbzw80q24w0d208xklv2rvm51iwdrqp6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-serde" ,rust-serde-1))
       #:cargo-development-inputs (("rust-serde-derive" ,rust-serde-derive-1)
                                   ("rust-serde-json" ,rust-serde-json-1))))
    (home-page "https://github.com/tailhook/serde-millis")
    (synopsis
     "Serde wrapper stores integer millisecond value for timestamps and
durations")
    (description
     "This package provides a serde wrapper that stores integer millisecond
value for timestamps and durations (used similarly to serde_bytes).")
    (license (list license:expat license:asl2.0))))

(define-public rust-similar-1
  (package
    (name "rust-similar")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "similar" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1v4ara277c2s8gcv821b9392ki5zzw95brfs8vy3bcjpln4d9l8s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bstr" ,rust-bstr-0.2)
                       ("rust-unicode-segmentation"
                        ,rust-unicode-segmentation-1))
       #:cargo-development-inputs (("rust-console" ,rust-console-0.14)
                                   ("rust-insta" ,rust-insta-1))))
    (home-page "https://github.com/mitsuhiko/similar")
    (synopsis "IFF library for Rust")
    (description "This package provides a diff library for Rust.")
    (license license:asl2.0)))

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
     "Interface for querying, manipulating serializing/deserializing Sixel data")
    (description
     "This package provides An interface for querying, manipulating and
serializing/deserializing Sixel
data.")
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

(define-public rust-slice-group-by-0.3.1
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
    (synopsis "Library for manipulating Souper IR")
    (description "This package provides a library for manipulating Souper IR.")
    (license (list license:expat license:asl2.0))))

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

(define-public rust-ssh2-0.9
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
     "Libssh2 bindings for interacting with SSH servers and executing commands")
    (description
     "This package provides Bindings to libssh2 for interacting with SSH servers
and executing remote commands, forwarding local ports, etc.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ssh2-0.9.1
  (package
    (inherit rust-ssh2-0.9)
    (name "rust-ssh2")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ssh2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ms4g0jpplm699q96dkd8hd807s6b4vwazizsi2j5gvbgzax8xnq"))))
    (arguments
     `(#:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-libssh2-sys" ,rust-libssh2-sys-0.2)
                       ("rust-parking-lot" ,rust-parking-lot-0.10))
       #:cargo-development-inputs (("rust-tempdir" ,rust-tempdir-0.3))))))

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
    (home-page "https://github.com/197g/static-alloc")
    (synopsis "Bump allocator on static memory for the alloc-traits crate")
    (description
     "This package provides a bump allocator on static memory for the
alloc-traits crate.")
    (license (list license:expat license:asl2.0 license:zlib))))

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
     "This package provides a minimal library to provide similar name
suggestions like \"Did you mean?\".")
    (license license:expat)))

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
     "This package provides Detects whether a terminal supports rendering
hyperlinks.")
    (license license:asl2.0)))

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

(define-public rust-syn-1
  (package
    (name "rust-syn")
    (version "1.0.109")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "syn" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ds2if4600bd59wsv7jjgfkayfzy3hnazs394kz6zdkmna8l3dkj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-unicode-ident" ,rust-unicode-ident-1))
       #:cargo-development-inputs (("rust-anyhow" ,rust-anyhow-1)
                                   ("rust-automod" ,rust-automod-1)
                                   ("rust-flate2" ,rust-flate2-1)
                                   ("rust-insta" ,rust-insta-1)
                                   ("rust-rayon" ,rust-rayon-1)
                                   ("rust-ref-cast" ,rust-ref-cast-1)
                                   ("rust-regex" ,rust-regex-1)
                                   ("rust-reqwest" ,rust-reqwest-0.11)
                                   ("rust-syn-test-suite"
                                    ,rust-syn-test-suite-0.0.0)
                                   ("rust-tar" ,rust-tar-0.4)
                                   ("rust-termcolor" ,rust-termcolor-1)
                                   ("rust-walkdir" ,rust-walkdir-2))))
    (home-page "https://github.com/dtolnay/syn")
    (synopsis "Parser for Rust source code")
    (description "This package provides Parser for Rust source code.")
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
                       ("rust-core-foundation-sys"
                        ,rust-core-foundation-sys-0.8)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-ntapi" ,rust-ntapi-0.3)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/GuillaumeGomez/sysinfo")
    (synopsis
     "Library to get system information")
    (description
     "This package provides Library to get system information such as
processes, CPUs, disks, components and networks.")
    (license license:expat)))

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
    (synopsis "Utility micro-crate for using Into more ergonomically")
    (description
     "Provides a utility micro-crate for using Into more ergonomically.")
    (license license:cc0)))

(define-public rust-typed-builder-0.11
  (package
    (name "rust-typed-builder")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "typed-builder" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "07nlizmjyya5f792qy0zdrqa4lz0ildxc34h421rxwxz1nj2d8a7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/idanarye/rust-typed-builder")
    (synopsis "Compile-time type-checked builder derive")
    (description
     "This package provides Compile-time type-checked builder derive.")
    (license (list license:expat license:asl2.0))))

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
       #:cargo-inputs (("rust-unsafe-any-ors" ,rust-unsafe-any-ors-1.0.0))))
    (home-page "https://github.com/orphanage-rs/rust-typemap")
    (synopsis "Typesafe store for many value types")
    (description
     "This package provides a typesafe store for many value types.")
    (license license:expat)))

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

(define-public rust-unicode-case-mapping-0.4
  (package
    (name "rust-unicode-case-mapping")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-case-mapping" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17rrnk7vbk995qdcm0jdj0hhslrvx59s7bzx41i5pg7zc8f3jsli"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/yeslogic/unicode-case-mapping")
    (synopsis
     "Fast lowercase, uppercase, and titlecase mapping for characters")
    (description
     "This package provides Fast lowercase, uppercase, and titlecase mapping for
characters.")
    (license license:asl2.0)))

(define-public rust-unsafe-any-ors-1.0.0
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
       #:cargo-inputs (("rust-destructure-traitobject"
                        ,rust-destructure-traitobject-0.2))))
    (home-page "https://github.com/orphanage-rs/rust-unsafe-any")
    (synopsis "Traits and implementations for unchecked downcasting")
    (description
     "This package provides Traits and implementations for unchecked downcasting.")
    (license license:expat)))

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

(define-public rust-windows-sys-0.52
  (package
    (name "rust-windows-sys")
    (version "0.52.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gd3v4ji88490zgb6b5mq5zgbvwv7zx1ibn8v3x83rwcdbryaar8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-windows-targets" ,rust-windows-targets-0.52))))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Rust for Windows")
    (description "This package provides Rust for Windows.")
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
       #:cargo-inputs (("rust-windows-aarch64-msvc"
                        ,rust-windows-aarch64-msvc-0.33)
                       ("rust-windows-i686-gnu" ,rust-windows-i686-gnu-0.33)
                       ("rust-windows-i686-msvc" ,rust-windows-i686-msvc-0.33)
                       ("rust-windows-x86-64-gnu" ,rust-windows-x86-64-gnu-0.33)
                       ("rust-windows-x86-64-msvc"
                        ,rust-windows-x86-64-msvc-0.33))))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Rust for Windows")
    (description "This package provides Rust for Windows.")
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

(define-public rust-winx-0.36
  (package
    (name "rust-winx")
    (version "0.36.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winx" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0bgls70sd0lxyhbklbs6ccchx0r2bbz0rcmgwxibhn0ryxvd6grz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-windows-sys" ,rust-windows-sys-0.59))))
    (home-page "https://github.com/sunfishcode/winx")
    (synopsis "Windows API helper library")
    (description "This package provides Windows API helper library.")
    (license (list license:asl2.0))))

(define-public rust-zellij-client-0.41
  (package
    (name "rust-zellij-client")
    (version "0.41.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zellij-client" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fdvr94g4dygssb877fakiic0mnlmp0f3zi93glcvx5rv79zp6ls"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-log" ,rust-log-0.4)
                       ("rust-mio" ,rust-mio-0.7)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-serde-yaml" ,rust-serde-yaml-0.8)
                       ("rust-url" ,rust-url-2)
                       ("rust-zellij-utils" ,rust-zellij-utils-0.41))))
    (home-page "https://zellij.dev")
    (synopsis "The client-side library for Zellij")
    (description "This package provides The client-side library for Zellij.")
    (license license:expat)))

(define-public rust-zellij-server-0.41
  (package
    (name "rust-zellij-server")
    (version "0.41.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zellij-server" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qq4g2w66gcxjgqvbq4xr1yfccnq2naf6d1rla08zn02wmsjwzzh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ansi-term" ,rust-ansi-term-0.12)
                       ("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-base64" ,rust-base64-0.13)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-cassowary" ,rust-cassowary-0.3)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-close-fds" ,rust-close-fds-0.3)
                       ("rust-daemonize" ,rust-daemonize-0.5)
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
                       ("rust-wasmtime" ,rust-wasmtime-21)
                       ("rust-wasmtime-wasi" ,rust-wasmtime-wasi-21)
                       ("rust-zellij-utils" ,rust-zellij-utils-0.41))))
    (home-page "https://zellij.dev")
    (synopsis "The server-side library for Zellij")
    (description "This package provides The server-side library for Zellij.")
    (license license:expat)))

(define-public rust-zellij-utils-0.41
  (package
    (name "rust-zellij-utils")
    (version "0.41.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zellij-utils" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0y39vfjxgx37psng49k534nazq7v3i9cz3wdiz5vq299ajp1yy8a"))
       (modules '((guix build utils)))
       (snippet '(substitute* "Cargo.toml"
                   ((".*isahc/static-curl.*")
                    "")))))
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
                       ("rust-crossbeam" ,rust-crossbeam-0.8)
                       ("rust-curl-sys" ,rust-curl-sys-0.4)
                       ("rust-directories" ,rust-directories-5)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-humantime" ,rust-humantime-2)
                       ("rust-include-dir" ,rust-include-dir-0.7)
                       ("rust-interprocess" ,rust-interprocess-1)
                       ("rust-isahc" ,rust-isahc-1)
                       ("rust-kdl" ,rust-kdl-4)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-log4rs" ,rust-log4rs-1)
                       ("rust-miette" ,rust-miette-5)
                       ("rust-nix" ,rust-nix-0.23)
                       ("rust-notify-debouncer-full"
                        ,rust-notify-debouncer-full-0.1)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-openssl-sys" ,rust-openssl-sys-0.9)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-prost" ,rust-prost-0.11)
                       ("rust-prost-build" ,rust-prost-build-0.11)
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
                       ("rust-termwiz" ,rust-termwiz-0.22)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-unicode-width" ,rust-unicode-width-0.1)
                       ("rust-url" ,rust-url-2)
                       ("rust-uuid" ,rust-uuid-1)
                       ("rust-vte" ,rust-vte-0.11))))
    (native-inputs (list pkg-config))
    (inputs (list openssl zlib))
    (home-page "https://zellij.dev")
    (synopsis "Utility library for Zellij client and server")
    (description
     "This package provides a utility library for Zellij client and server.")
    (license license:expat)))
