(define-module (lp packages nerd-fonts)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
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
       (uri
        (string-append
         "https://github.com/ryanoasis/nerd-fonts/releases/download/v"
         version
         "/Hasklig.zip"))
       (sha256
        (base32
         "1y9rshxsshhr365hxr1nplz1lvrccs6f4rl7q6qdl8f5ijwmv0m6"))))
    (build-system font-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'install 'make-files-writable
           (lambda _
             (for-each
              make-file-writable
              (find-files "." ".*\\.(otf|otc|ttf|ttc)$"))
             #t)))))
    (home-page "https://www.nerdfonts.com/")
    (synopsis "Nerd fonts variant of hasklig font")
    (description
     "nerd fonts variant of hasklig")
    (license license:silofl1.1)))
