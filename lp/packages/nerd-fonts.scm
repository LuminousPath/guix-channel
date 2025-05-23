(define-module (lp packages nerd-fonts)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system font)
  #:use-module (gnu packages base)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages pkg-config))

(define-public font-nerd-fonts-hasklig
  (package
    (name "font-nerd-fonts-hasklig")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ryanoasis/nerd-fonts/releases/download/v"
             version "/Hasklig.tar.xz"))
       (sha256
        (base32 "117236vqcf2j70irb5a36n509swssmv2310c43b1ffxx5m4ysq0n"))))
    (build-system font-build-system)
    (arguments
     `(#:phases (modify-phases %standard-phases
                  (add-before 'install 'make-files-writable
                    (lambda _
                      (for-each make-file-writable
                                (find-files "." ".*\\.(otf|otc|ttf|ttc)$")) #t)))))
    (home-page "https://www.nerdfonts.com/")
    (synopsis "Nerd fonts variant of hasklig font")
    (description "Nerd fonts variant of hasklig")
    (license license:silofl1.1)))
