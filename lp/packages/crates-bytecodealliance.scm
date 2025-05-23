(define-module (lp packages crates-bytecodealliance)
  #:use-module (gnu packages crates-check)
  #:use-module (gnu packages crates-compression)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-windows)
  #:use-module (lp packages crates-extra)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:))

(define-public rust-arf-strings-0.7
  (package
    (name "rust-arf-strings")
    (version "0.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arf-strings" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fdqcyss12hyk34wd6v2gsfrwxdclk7ddmyk9f2hb47345mv6f08"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-rustix" ,rust-rustix-1))))
    (home-page "https://github.com/bytecodealliance/arf-strings")
    (synopsis "Encoding and decoding for ARF strings")
    (description
     "This package provides Encoding and decoding for ARF strings.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-cap-async-std-3.4.4
  (package
    (name "rust-cap-async-std")
    (version "3.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cap-async-std" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08dwkndq25ci70ksvj1qd7ng8985xa86h23x59n39mqq4ry7wcnp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-arf-strings" ,rust-arf-strings-0.7)
                       ("rust-async-std" ,rust-async-std-1)
                       ("rust-camino" ,rust-camino-1)
                       ("rust-cap-primitives" ,rust-cap-primitives-3.4.4)
                       ("rust-io-extras" ,rust-io-extras-0.18)
                       ("rust-io-lifetimes" ,rust-io-lifetimes-2)
                       ("rust-rustix" ,rust-rustix-1))))
    (home-page "https://github.com/bytecodealliance/cap-std")
    (synopsis "Capability-based version of async-std")
    (description
     "This package provides Capability-based version of async-std.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-cap-fs-ext-3.4.4
  (package
    (name "rust-cap-fs-ext")
    (version "3.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cap-fs-ext" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0g0pdhz3w09pdza8xamzrzicjpmwk73y7h8mdzxfhgqra62w2774"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-arf-strings" ,rust-arf-strings-0.7)
                       ("rust-async-std" ,rust-async-std-1)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-camino" ,rust-camino-1)
                       ("rust-cap-async-std" ,rust-cap-async-std-3.4.4)
                       ("rust-cap-primitives" ,rust-cap-primitives-3.4.4)
                       ("rust-cap-std" ,rust-cap-std-3.4.4)
                       ("rust-io-lifetimes" ,rust-io-lifetimes-2)
                       ("rust-windows-sys" ,rust-windows-sys-0.59))))
    (home-page "https://github.com/bytecodealliance/cap-std")
    (synopsis "Extension traits for `Dir`, `File`, etc")
    (description
     "This package provides Extension traits for `Dir`, `File`, etc.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-cap-net-ext-3.4.4
  (package
    (name "rust-cap-net-ext")
    (version "3.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cap-net-ext" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0b3h14c31ibg65a21001jfh6w8gcgj4aq8ivj5p9hv662qw870wz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-cap-primitives" ,rust-cap-primitives-3.4.4)
                       ("rust-cap-std" ,rust-cap-std-3.4.4)
                       ("rust-rustix" ,rust-rustix-1)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://github.com/bytecodealliance/cap-std")
    (synopsis "Extension traits for `TcpListener`, `Pool`, etc")
    (description
     "This package provides Extension traits for `@code{TcpListener`},
`Pool`, etc.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-cap-primitives-3.4.4
  (package
    (name "rust-cap-primitives")
    (version "3.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cap-primitives" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0apni9ybd60z3d2zzbwv3c57zghd0464r7gm4syghfags573j7ha"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-ambient-authority" ,rust-ambient-authority-0.0.2)
                       ("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-fs-set-times" ,rust-fs-set-times-0.20)
                       ("rust-io-extras" ,rust-io-extras-0.18)
                       ("rust-io-lifetimes" ,rust-io-lifetimes-2)
                       ("rust-ipnet" ,rust-ipnet-2)
                       ("rust-maybe-owned" ,rust-maybe-owned-0.3)
                       ("rust-rustix" ,rust-rustix-1)
                       ("rust-rustix-linux-procfs" ,rust-rustix-linux-procfs-0.1)
                       ("rust-windows-sys" ,rust-windows-sys-0.59)
                       ("rust-winx" ,rust-winx-0.36))))
    (home-page "https://github.com/bytecodealliance/cap-std")
    (synopsis "Capability-based primitives")
    (description "This package provides Capability-based primitives.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-cap-rand-3.4.4
  (package
    (name "rust-cap-rand")
    (version "3.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cap-rand" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0h0vjjmdwpf0139y1silf84frkps1mix1280y21qd8lqyz68kjqa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-ambient-authority" ,rust-ambient-authority-0.0.2)
                       ("rust-rand" ,rust-rand-0.8))))
    (home-page "https://github.com/bytecodealliance/cap-std")
    (synopsis "Capability-based random number generators")
    (description
     "This package provides Capability-based random number generators.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-cap-std-3.4.4
  (package
    (name "rust-cap-std")
    (version "3.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cap-std" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12a1k1633flbznkfzjg3xmhkh5l4ss4j9hf3fvqmipc3lmf3bh07"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-arf-strings" ,rust-arf-strings-0.7)
                       ("rust-camino" ,rust-camino-1)
                       ("rust-cap-primitives" ,rust-cap-primitives-3.4.4)
                       ("rust-io-extras" ,rust-io-extras-0.18)
                       ("rust-io-lifetimes" ,rust-io-lifetimes-2)
                       ("rust-rustix" ,rust-rustix-1))))
    (home-page "https://github.com/bytecodealliance/cap-std")
    (synopsis "Capability-based version of the Rust standard library")
    (description
     "This package provides Capability-based version of the Rust standard
library.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-cap-tempfile-3.4.4
  (package
    (name "rust-cap-tempfile")
    (version "3.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cap-tempfile" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0zadccnn0m9a8cybd5hnkvnp6z4dcb2daypb60dmbhz6iv8m1p4v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-camino" ,rust-camino-1)
                       ("rust-cap-std" ,rust-cap-std-3.4.4)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rustix" ,rust-rustix-1)
                       ("rust-rustix-linux-procfs" ,rust-rustix-linux-procfs-0.1)
                       ("rust-uuid" ,rust-uuid-1))
       #:cargo-development-inputs (("rust-windows-sys" ,rust-windows-sys-0.59))))
    (home-page "https://github.com/bytecodealliance/cap-std")
    (synopsis "Capability-based temporary directories")
    (description
     "This package provides Capability-based temporary directories.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-cap-time-ext-3.4.4
  (package
    (name "rust-cap-time-ext")
    (version "3.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cap-time-ext" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0nqskcskhki1chj3ylln333nh0xrbp3phsa6l3d8a03pp0hga6j9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-ambient-authority" ,rust-ambient-authority-0.0.2)
                       ("rust-cap-primitives" ,rust-cap-primitives-3.4.4)
                       ("rust-cap-std" ,rust-cap-std-3.4.4)
                       ("rust-iana-time-zone" ,rust-iana-time-zone-0.1)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rustix" ,rust-rustix-1)
                       ("rust-winx" ,rust-winx-0.36))))
    (home-page "https://github.com/bytecodealliance/cap-std")
    (synopsis "Extension traits for `SystemClock` and `MonotonicClock`")
    (description
     "This package provides Extension traits for `@code{SystemClock`}
and `@code{MonotonicClock`}.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-fs-set-times-0.20
  (package
    (name "rust-fs-set-times")
    (version "0.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fs-set-times" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jm105d24vc6jkpxsvvan6yd2xbvc6fzzs2n2azarv0kcfghkrwl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-io-lifetimes" ,rust-io-lifetimes-2)
                       ("rust-rustix" ,rust-rustix-1)
                       ("rust-windows-sys" ,rust-windows-sys-0.59))))
    (home-page "https://github.com/bytecodealliance/fs-set-times")
    (synopsis "Set filesystem timestamps")
    (description "This package provides Set filesystem timestamps.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-regalloc2-0.9
  (package
    (name "rust-regalloc2")
    (version "0.9.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "regalloc2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19i94jyjma82hgyf5wj83zkqc5wnfxnh38k3lcj7m6w7ki9ns5dd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-hashbrown" ,rust-hashbrown-0.13)
                       ("rust-libfuzzer-sys" ,rust-libfuzzer-sys-0.4)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-rustc-hash" ,rust-rustc-hash-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-slice-group-by" ,rust-slice-group-by-0.3)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://github.com/bytecodealliance/regalloc2")
    (synopsis "Backtracking register allocator inspired from IonMonkey")
    (description
     "This package provides Backtracking register allocator inspired from
@code{IonMonkey}.")
    (license (list license:asl2.0 license:expat))))

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
                       ("rust-slice-group-by" ,rust-slice-group-by-0.3.1)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://github.com/bytecodealliance/regalloc2")
    (synopsis "Backtracking register allocator inspired from IonMonkey")
    (description
     "This package provides Backtracking register allocator inspired from
@code{IonMonkey}.")
    (license (list license:asl2.0))))

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
                       ("rust-slice-group-by" ,rust-slice-group-by-0.3.1)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://github.com/bytecodealliance/regalloc2")
    (synopsis "Backtracking register allocator inspired from IonMonkey")
    (description
     "This package provides Backtracking register allocator inspired from
@code{IonMonkey}.")
    (license (list license:asl2.0))))

(define-public rust-rustix-1
  (package
    (name "rust-rustix")
    (version "1.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustix" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rhjh16bnxi86nrn9qwcnw5632mvd5m1vdy61s4n9zz7mzb867n7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-errno" ,rust-errno-0.3)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-linux-raw-sys" ,rust-linux-raw-sys-0.9)
                       ("rust-rustc-std-workspace-alloc"
                        ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core"
                        ,rust-rustc-std-workspace-core-1)
                       ("rust-windows-sys" ,rust-windows-sys-0.59))
       #:cargo-development-inputs (("rust-criterion" ,rust-criterion-0.4)
                                   ("rust-errno" ,rust-errno-0.3)
                                   ("rust-flate2" ,rust-flate2-1)
                                   ("rust-libc" ,rust-libc-0.2)
                                   ("rust-memoffset" ,rust-memoffset-0.9)
                                   ("rust-once-cell" ,rust-once-cell-1)
                                   ("rust-serial-test" ,rust-serial-test-2)
                                   ("rust-static-assertions"
                                    ,rust-static-assertions-1)
                                   ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://github.com/bytecodealliance/rustix")
    (synopsis "Safe Rust bindings to POSIX/Unix/Linux/Winsock-like syscalls")
    (description
     "This package provides Safe Rust bindings to POSIX/Unix/Linux/Winsock-like
syscalls.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-system-interface-0.27
  (package
    (name "rust-system-interface")
    (version "0.27.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "system-interface" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ic7qxkgxh8hbphcawcz2xdnb5lmlirkhj4158f5466ffkv94ifc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-async-std" ,rust-async-std-1)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-cap-async-std" ,rust-cap-async-std-3.4.4)
                       ("rust-cap-fs-ext" ,rust-cap-fs-ext-3.4.4)
                       ("rust-cap-std" ,rust-cap-std-3.4.4)
                       ("rust-char-device" ,rust-char-device-0.16)
                       ("rust-fd-lock" ,rust-fd-lock-4)
                       ("rust-io-lifetimes" ,rust-io-lifetimes-2)
                       ("rust-os-pipe" ,rust-os-pipe-1)
                       ("rust-rustix" ,rust-rustix-0.38)
                       ("rust-socketpair" ,rust-socketpair-0.19)
                       ("rust-ssh2" ,rust-ssh2-0.9)
                       ("rust-windows-sys" ,rust-windows-sys-0.59)
                       ("rust-winx" ,rust-winx-0.36))
       #:cargo-development-inputs (("rust-cap-fs-ext" ,rust-cap-fs-ext-3.4.4)
                                   ("rust-cap-std" ,rust-cap-std-3.4.4)
                                   ("rust-cap-tempfile" ,rust-cap-tempfile-3.4.4)
                                   ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://github.com/bytecodealliance/system-interface")
    (synopsis "Extensions to the Rust standard library")
    (description
     "This package provides Extensions to the Rust standard library.")
    (license (list license:asl2.0 license:asl2.0 license:expat))))
