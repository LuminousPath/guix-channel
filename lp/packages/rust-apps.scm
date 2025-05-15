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
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:))

(module-define!
 (resolve-module '(gnu packages crates-io))
                 'rust-openssl-sys-0.9
                 rust-openssl-sys-0.9.104)

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
                       ("rust-names" ,rust-names-0.14)
                       ("rust-suggest" ,rust-suggest-0.4)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-zellij-client" ,rust-zellij-client-0.40)
                       ("rust-zellij-server" ,rust-zellij-server-0.40)
                       ("rust-zellij-utils" ,rust-zellij-utils-0.40))
       #:cargo-development-inputs (("rust-insta" ,rust-insta-1)
                                   ("rust-rand" ,rust-rand-0.8)
                                   ("rust-regex" ,rust-regex-1)
                                   ("rust-ssh2" ,rust-ssh2-0.9))))
    (native-inputs
     (list pkg-config gcc-toolchain))
    (inputs
     (list zlib openssl curl libssh2 perl))
    (home-page "https://zellij.dev")
    (synopsis "Terminal workspace with batteries included")
    (description
     "This package provides a terminal workspace with batteries included.")
    (license license:expat)))

(define-public dust-1
  (package
    (name "dust")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "du-dust" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qr6ikq2ds8bq35iw480qyhf3d43dj61wiwp8587n3mgqf5djx8w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-ansi-term" ,rust-ansi-term-0.12)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-clap" ,rust-clap-4)
                       ("rust-clap-complete" ,rust-clap-complete-4)
                       ("rust-clap-mangen" ,rust-clap-mangen-0.2)
                       ("rust-config-file" ,rust-config-file-0.2)
                       ("rust-ctrlc" ,rust-ctrlc-3)
                       ("rust-directories" ,rust-directories-4)
                       ("rust-filesize" ,rust-filesize-0.2)
                       ("rust-lscolors" ,rust-lscolors-0.13)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-stfu8" ,rust-stfu8-0.2)
                       ("rust-sysinfo" ,rust-sysinfo-0.27)
                       ("rust-terminal-size" ,rust-terminal-size-0.2)
                       ("rust-thousands" ,rust-thousands-0.2)
                       ("rust-unicode-width" ,rust-unicode-width-0.1)
                       ("rust-winapi-util" ,rust-winapi-util-0.1))
       #:cargo-development-inputs (("rust-assert-cmd" ,rust-assert-cmd-2)
                                   ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://github.com/bootandy/dust")
    (synopsis "More intuitive version of du")
    (description "This package provides a more intuitive version of du.")
    (license license:asl2.0)))
