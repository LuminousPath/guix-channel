(define-module (lp packages rust-apps)
  #:use-module (lp packages crates-extra)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system cargo)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:))

(define-public dust-0.8
  (package
    (name "dust")
    (version "0.8.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bootandy/dust")
             (commit (string-append "v" version))))
       (file-name
        (git-file-name name version))
       (sha256
        (base32 "04vf0nddlymm2f49jhr6nqx0793p6whgxyqssbmw0smjsnwx1nq8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-ansi-term" ,rust-ansi-term-0.12)
                       ("rust-clap" ,rust-clap-3)
                       ("rust-clap" ,rust-clap-3)
                       ("rust-clap-complete" ,rust-clap-complete-3)
                       ("rust-config-file" ,rust-config-file-0.2)
                       ("rust-directories" ,rust-directories-4)
                       ("rust-lscolors" ,rust-lscolors-0.7)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-stfu8" ,rust-stfu8-0.2)
                       ("rust-sysinfo" ,rust-sysinfo-0.15)
                       ("rust-terminal-size" ,rust-terminal-size-0.1)
                       ("rust-thousands" ,rust-thousands-0.2)
                       ("rust-unicode-width" ,rust-unicode-width-0.1)
                       ("rust-winapi-util" ,rust-winapi-util-0.1))
       #:cargo-development-inputs (("rust-assert-cmd" ,rust-assert-cmd-1)
                                   ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://github.com/bootandy/dust")
    (synopsis "A more intuitive version of du")
    (description "This package provides a more intuitive version of du")
    (license license:asl2.0)))

