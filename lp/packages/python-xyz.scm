(define-module (lp packages python-xyz)
  #:use-module (guix packages)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages check)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages)
  #:use-module (guix build-system python)
  #:use-module (guix download)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:))

(define-public python-questionary
  (package
    (name "python-questionary")
    (version "1.10.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "questionary" version))
              (sha256
               (base32
                "143dji1lyb193vfvcfjcjdzw4jvfnvykdsgfjy6x89nfxkpkl3b0"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f)) ; The tests require an internet connection
    (propagated-inputs
     (list
      python-prompt-toolkit
      python-pyyaml
      python-jinja2))
    (home-page "https://github.com/tmbo/questionary")
    (synopsis
     "Python library to build pretty command line user prompts â­ï¸")
    (description
     "Python library to build pretty command line user prompts â­ï¸")
    (license license:expat)))

(define-public python-decli
  (package
    (name "python-decli")
    (version "0.5.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "decli" version))
              (sha256
               (base32
                "1bb3simdyr842sci5hj2iicz44n68jl5axhccff82p576i8fbkgj"))))
    (build-system python-build-system)
    (home-page "")
    (synopsis "Minimal, easy-to-use, declarative cli tool")
    (description "Minimal, easy-to-use, declarative cli tool")
    (license license:expat)))

(define-public python-argcomplete-1.12
  (package
    (inherit python-argcomplete)
    (name "python-argcomplete-1.12")
    (version "1.12.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "argcomplete" version))
       (sha256
        (base32
         "1rp4m3cvafr0yb09k4s22vvrphj4ysjhq43lx9d1gcjvqd229744")))))) ; might need to re-add a v1.11 patch for the fish shell
