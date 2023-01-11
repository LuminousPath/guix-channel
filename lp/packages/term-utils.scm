(define-module (lp packages term-utils)
  #:use-module (guix build-system copy)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:))

(define-public starship
  (package
   (name "starship")
   (version "1.12.0")
   (source (origin
             (method url-fetch/tarbomb)
             (uri (string-append
                   "https://github.com/starship/starship/releases/download/v"
                   version "/starship-x86_64-unknown-linux-musl.tar.gz"))
             (sha256
              (base32
               "0w2w20lxx8l662xdcvjdb033sglhgfg3dnm5jfjb5z5sixwd37x0"))))
   (build-system copy-build-system)
   (arguments
    '(#:install-plan '(("starship" "bin/"))))
   (home-page "https://starship.rs")
   (synopsis
    "The minimal, blazing-fast, and infinitely customizable prompt for any shell!")
   (description
    "The minimal, blazing-fast, and infinitely customizable prompt for any shell!")
   (license license:isc)))
