(define-module (lp packages version-control)
  #:use-module (guix packages)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages check)
  #:use-module (gnu packages python-build)
  #:use-module (lp packages python-xyz)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix download)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:))

(define-public commitizen
  (package
    (name "commitizen")
    (version "4.6.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "commitizen" version))
       (sha256
        (base32 "1ngz90jjk5xzf6hb126jwbhqgk2wxbyl6zkkjrsa5gl4knj4hzf9"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f)) ;There are no tests
    (propagated-inputs (list python-argcomplete
                             python-charset-normalizer
                             python-colorama
                             python-decli
                             python-importlib-metadata
                             python-jinja2
                             python-packaging
                             python-pyyaml
                             python-questionary
                             python-termcolor
                             python-tomlkit
                             python-typing-extensions))
    (native-inputs (list python-poetry-core-next))
    (home-page "https://github.com/commitizen-tools/commitizen")
    (synopsis "Python commitizen client tool")
    (description "Python commitizen client tool.")
    (license license:expat)))
