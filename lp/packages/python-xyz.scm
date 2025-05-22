(define-module (lp packages python-xyz)
  #:use-module (guix packages)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-crypto)
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
    (name "python-argcomplete")
    (version "1.12.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "argcomplete" version))
       (sha256
        (base32
         "1rp4m3cvafr0yb09k4s22vvrphj4ysjhq43lx9d1gcjvqd229744")))))) ; might need to re-add a v1.11 patch for the fish shell
    (build-system python-build-system)
    (arguments
     ;; tests rely on some older functionality for packages that I don't want to recreate the old versions for.
     `(#:tests? #f))))

(define-public python-pyright
  (package
    (name "python-pyright")
    (version "1.1.291")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pyright" version))
              (sha256
               (base32
                "1gbi4sq3m6a5ja22bvfx6sndg2wxck88lwz1xqwf9y4r38zz8iir"))))
    (build-system python-build-system)
    (propagated-inputs (list python-nodeenv-1.6))
    (native-inputs (list python-twine python-pytest))
    (home-page "https://github.com/RobertCraigie/pyright-python")
    (synopsis "Command line wrapper for pyright")
    (description "Command line wrapper for pyright")
    (license license:expat)))

(define-public python-nodeenv-1.6
 (package
   (name "python-nodeenv")
   (version "1.6.0")
   (source (origin
             (method url-fetch)
             (uri (pypi-uri "nodeenv" version))
             (sha256
              (base32
               "0ascg98p2r7ay2n09gjd8q5d1z9znrwskyagg952mfli0bwkzw9y"))))
   (build-system python-build-system)
   (home-page "https://github.com/ekalinin/nodeenv")
   (synopsis "Node.js virtual environment builder")
   (description "Node.js virtual environment builder")
   (license license:bsd-3)) )

(define-public poetry-1.1.12
  (package
    (name "poetry")
    (version "1.1.12")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "poetry" version))
       (sha256
        (base32
         "0rr54mvcfcv9cv6vw2122y28xvd2pwqpv2x8c8j5ayz3gwsy4rjw"))))
    (build-system python-build-system)
    (arguments
     `(#:tests? #f                      ;PyPI does not have tests
       ;; (modify-phases %standard-phases
       ;;   (delete 'build))
        #:phases
       (modify-phases %standard-phases
         (add-before 'build 'patch-setup-py
           (lambda _
             (substitute* "setup.py"
               ;; Relax some of the requirements.
               (("(keyring>=21.2.0),<22.0.0" _ keyring) keyring)
               (("(packaging>=20.4),<21.0" _ packaging) packaging))))
         (delete 'sanity-check))))
    (propagated-inputs
     (list python-cachecontrol
           python-cachy
           python-cleo
           python-crashtest
           python-entrypoints
           python-html5lib
           python-keyring
           python-msgpack
           python-packaging
           python-pexpect
           python-pip
           python-pkginfo
           python-poetry-core-1.0.7
           python-requests
           python-requests-toolbelt
           python-shellingham
           python-tomlkit
           python-virtualenv))
    (native-inputs (list python-setuptools-scm))
    (home-page "https://python-poetry.org")
    (synopsis "Python dependency management and packaging made easy")
    (description "Poetry is a tool for dependency management and packaging
in Python.  It allows you to declare the libraries your project depends on and
it will manage (install/update) them for you.")
    (license license:expat)))

(define-public python-poetry-core-1.0.7
  (package
    (name "python-poetry-core")
    (version "1.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "poetry-core" version))
       (sha256
        (base32 "01n2rbsvks7snrq3m1d08r3xz9q2715ajb62fdb6rvqnb9sirhcq"))))
    (build-system python-build-system)
    (home-page "https://github.com/python-poetry/poetry-core")
    (synopsis "Poetry PEP 517 build back-end")
    (description
     "The @code{poetry-core} module provides a PEP 517 build back-end
implementation developed for Poetry.  This project is intended to be
a light weight, fully compliant, self-contained package allowing PEP 517
compatible build front-ends to build Poetry managed projects.")
    (license license:expat)))
