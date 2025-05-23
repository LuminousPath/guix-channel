(define-module (lp packages image-utils)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix build-system cmake)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages image-processing)
  #:use-module (gnu packages image-viewers)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages logging)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pretty-print)
  #:use-module (gnu packages tbb)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg))

(define-public ueberzugpp
  (package
    (name "ueberzugpp")
    (version "2.9.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jstkdng/ueberzugpp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0m1w53asd7sscxv20rb23p5lsmr5nz2510f08l1iyfksgk1533xa"))))
    (build-system cmake-build-system)
    (arguments
     (list
      ;; no tests idk
      #:tests? #f))
    (inputs (list chafa
                  cli11
                  fmt
                  libsixel
                  nlohmann-json
                  opencv
                  openssl
                  range-v3
                  spdlog
                  tbb
                  vips
                  cairo ;required by poppler
                  expat ;required by vips
                  fftw ;required by vips
                  glib ;required by vips
                  imagemagick ;required by vips
                  lcms ;required by vips
                  (librsvg-for-system) ;required by vips
                  libexif ;required by vips
                  libgsf ;required by vips
                  libwebp ;required by vips
                  matio ;required by vips
                  openexr-2 ;required by vips
                  orc ;required by vips
                  pango ;required by vips
                  poppler ;required by vips
                  xcb-util-image))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/jstkdng/ueberzugpp")
    (synopsis "Drop in replacement for ueberzug written in C++")
    (description
     "Überzug++ is a command line utility written in C++ which allows you to
draw images on terminals by using X11/wayland child windows, sixels, kitty and
iterm2..")
    (license license:gpl3+)))
