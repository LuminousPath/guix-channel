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
    (version "2.39.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "commitizen" version))
              (sha256
               (base32
                "0ivxqlmj1s5rn8r50ahw0fjjcq6nmn0l0q7wwxszqhygnsk7fjqz"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f)) ; There are no tests
    (propagated-inputs
     (list
      python-typing-extensions
      python-termcolor
      python-questionary
      python-colorama
      python-decli
      python-argcomplete-1.12))
    (native-inputs
     (list
      poetry-1.1.12))
    (home-page "https://github.com/commitizen-tools/commitizen")
    (synopsis "Python commitizen client tool")
    (description "Python commitizen client tool")
    (license license:expat)))

