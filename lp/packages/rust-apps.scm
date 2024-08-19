(define-module (lp packages rust-apps)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages tls)
  #:use-module (lp packages)
  #:use-module (lp packages crates-extra)
  #:use-module (lp packages crates-openssl)
  #:use-module (guix git-download)
  #:use-module (guix download)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system copy)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:))

(module-define!
 (resolve-module '(gnu packages crates-io))
                 'rust-openssl-sys-0.9
                 rust-openssl-sys-0.9.103)

(define-public zellij-0.40
  (package
    (name "zellij")
    (version "0.40.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zellij" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gmx51fjm6spfkbjnb3zxfnfhriakx3jjr1hyqr85c7vi10mmxy4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f ; no tests
       #:install-source? #f
       #:cargo-inputs (("rust-dialoguer" ,rust-dialoguer-0.10)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-names" ,rust-names-0.14.0)
                       ("rust-suggest" ,rust-suggest-0.4)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-zellij-client" ,rust-zellij-client-0.40)
                       ("rust-zellij-server" ,rust-zellij-server-0.40)
                       ("rust-zellij-utils" ,rust-zellij-utils-0.40))
       #:cargo-development-inputs (("rust-insta" ,rust-insta-1.6)
                                   ("rust-rand" ,rust-rand-0.8)
                                   ("rust-regex" ,rust-regex-1)
                                   ("rust-ssh2" ,rust-ssh2-0.9.4))))
    (native-inputs
     (list pkg-config gcc-toolchain))
    (inputs
     (list zlib openssl curl libssh2 perl))
    (home-page "https://zellij.dev")
    (synopsis "terminal workspace with batteries included")
    (description
     "This package provides a terminal workspace with batteries included.")
    (license license:expat)))

