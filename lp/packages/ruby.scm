(define-module (lp packages ruby)
  #:use-module((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system ruby)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages ruby))

(define-public ruby-net-scp-1.2.0
  (package
    (name "ruby-net-scp")
    (version "1.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/net-ssh/net-scp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1lcnrv3fzwy9fj4c27qfinc5g4n9vkm14912qs9aih1ycdq9c2fi"))))
    (build-system ruby-build-system)
    (arguments
     `(#:tests? #f)) ; TODO: Re-enable.
    (native-inputs
     (list bundler ruby-test-unit ruby-mocha))
    (propagated-inputs
     (list ruby-net-ssh))
    (synopsis "Pure-Ruby SCP client library")
    (description "@code{Net::SCP} is a pure-Ruby implementation of the SCP
client protocol.")
    (home-page "https://github.com/net-ssh/net-scp")
    (license license:expat)))


(define-public ruby-fake-ftp
  (package
    (name "ruby-fake-ftp")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "fake_ftp" version))
              (sha256
               (base32
                "0rn7lxdk3sqc2i4v2c5k25b9ca1qnkdf32nv04y760aml9mszwf7"))))
    (build-system ruby-build-system)
    (arguments
     `(#:tests? #f)) ; TODO: Re-enable.
    (native-inputs (list bundler ruby-rake ruby-rspec))
    (synopsis "Testing FTP? Use this!")
    (description "Testing FTP? Use this!")
    (home-page "http://rubygems.org/gems/fake_ftp")
    (license license:expat)))

(define-public ruby-rspec-3.5
  (package
    (name "ruby-rspec")
    (version "3.5.0")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "rspec" version))
              (sha256
               (base32
                "16g3mmih999f0b6vcz2c3qsc7ks5zy4lj1rzjh8hf6wk531nvc6s"))))
    (build-system ruby-build-system)
    (arguments
     `(#:tests? #f)) ; TODO: Re-enable.
    (propagated-inputs (list ruby-rspec-core ruby-rspec-expectations
                             ruby-rspec-mocks))
    (synopsis "BDD for Ruby")
    (description "BDD for Ruby")
    (home-page "http://github.com/rspec")
    (license license:expat)))

(define-public ruby-rake-12
  (package
    (name "ruby-rake")
    (version "12.3.3")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "rake" version))
              (sha256
               (base32
                "1cvaqarr1m84mhc006g3l1vw7sa5qpkcw0138lsxlf769zdllsgp"))))
    (build-system ruby-build-system)
    (synopsis
     "Rake is a Make-like program implemented in Ruby. Tasks and dependencies are
specified in standard Ruby syntax.
Rake has the following features:
  * Rakefiles (rake's version of Makefiles) are completely defined in standard Ruby syntax.
    No XML files to edit. No quirky Makefile syntax to worry about (is that a tab or a space?)
  * Users can specify tasks with prerequisites.
  * Rake supports rule patterns to synthesize implicit tasks.
  * Flexible FileLists that act like arrays but know about manipulating file names and paths.
  * Supports parallel execution of tasks.
")
    (description
     "Rake is a Make-like program implemented in Ruby.  Tasks and dependencies are
specified in standard Ruby syntax.  Rake has the following features: * Rakefiles
(rake's version of Makefiles) are completely defined in standard Ruby syntax.
No XML files to edit.  No quirky Makefile syntax to worry about (is that a tab
or a space?) * Users can specify tasks with prerequisites. * Rake supports rule
patterns to synthesize implicit tasks. * Flexible FileLists that act like arrays
but know about manipulating file names and paths. * Supports parallel execution
of tasks.")
    (home-page "https://github.com/ruby/rake")
    (license license:expat)))

(define-public ruby-winrm-fs
  (package
    (name "ruby-winrm-fs")
    (version "1.3.5")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "winrm-fs" version))
              (sha256
               (base32
                "0gb91k6s1yjqw387x4w1nkpnxblq3pjdqckayl0qvz5n3ygdsb0d"))))
    (build-system ruby-build-system)
    (arguments
     `(#:tests? #f)) ; TODO: Re-enable.
    (propagated-inputs (list ruby-erubi ruby-logging ruby-rubyzip ruby-winrm))
    (synopsis
     "    Ruby library for file system operations via Windows Remote Management
")
    (description
     "Ruby library for file system operations via Windows Remote Management")
    (home-page "http://github.com/WinRb/winrm-fs")
    (license #f)))

(define-public ruby-rubyntlm
  (package
    (name "ruby-rubyntlm")
    (version "0.6.3")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "rubyntlm" version))
              (sha256
               (base32
                "0b8hczk8hysv53ncsqzx4q6kma5gy5lqc7s5yx8h64x3vdb18cjv"))))
    (build-system ruby-build-system)
    (arguments
     `(#:tests? #f)) ; TODO: Re-enable.
    (synopsis
     "Ruby/NTLM provides message creator and parser for the NTLM authentication.")
    (description
     "Ruby/NTLM provides message creator and parser for the NTLM authentication.")
    (home-page "https://github.com/winrb/rubyntlm")
    (license license:expat)))

(define-public ruby-little-plugger
  (package
    (name "ruby-little-plugger")
    (version "1.1.4")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "little-plugger" version))
              (sha256
               (base32
                "1frilv82dyxnlg8k1jhrvyd73l6k17mxc5vwxx080r4x1p04gwym"))))
    (build-system ruby-build-system)
    (arguments
     `(#:tests? #f)) ; TODO: Re-enable.
    (synopsis
     "LittlePlugger is a module that provides Gem based plugin management.
By extending your own class or module with LittlePlugger you can easily
manage the loading and initializing of plugins provided by other gems.")
    (description
     "LittlePlugger is a module that provides Gem based plugin management.  By
extending your own class or module with LittlePlugger you can easily manage the
loading and initializing of plugins provided by other gems.")
    (home-page "http://gemcutter.org/gems/little-plugger")
    (license #f)))

(define-public ruby-logging
  (package
    (name "ruby-logging")
    (version "2.3.1")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "logging" version))
              (sha256
               (base32
                "1zflchpx4g8c110gjdcs540bk5a336nq6nmx379rdg56xw0pjd02"))))
    (build-system ruby-build-system)
    (arguments
     `(#:tests? #f)) ; TODO: Re-enable.
    (propagated-inputs (list ruby-little-plugger ruby-multi-json))
    (synopsis
     "**Logging** is a flexible logging library for use in Ruby programs based on the
design of Java's log4j library. It features a hierarchical logging system,
custom level names, multiple output destinations per log event, custom
formatting, and more.")
    (description
     "**Logging** is a flexible logging library for use in Ruby programs based on the
design of Java's log4j library.  It features a hierarchical logging system,
custom level names, multiple output destinations per log event, custom
formatting, and more.")
    (home-page "http://rubygems.org/gems/logging")
    (license #f)))

(define-public ruby-gyoku
  (package
    (name "ruby-gyoku")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "gyoku" version))
              (sha256
               (base32
                "1kd2q59xpm39hpvmmvyi6g3f1fr05xjbnxwkrdqz4xy7hirqi79q"))))
    (build-system ruby-build-system)
    (arguments
     `(#:tests? #f)) ; TODO: Re-enable.
    (propagated-inputs (list ruby-builder ruby-rexml))
    (synopsis "Gyoku translates Ruby Hashes to XML")
    (description "Gyoku translates Ruby Hashes to XML")
    (home-page "https://github.com/savonrb/gyoku")
    (license license:expat)))

(define-public ruby-gssapi
  (package
    (name "ruby-gssapi")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "gssapi" version))
              (sha256
               (base32
                "1qdfhj12aq8v0y961v4xv96a1y2z80h3xhvzrs9vsfgf884g6765"))))
    (build-system ruby-build-system)
    (propagated-inputs (list ruby-ffi))
    (synopsis
     "    A FFI wrapper around the system GSSAPI library. Please make sure and read the
    Yard docs or standard GSSAPI documentation if you have any questions.

    There is also a class called GSSAPI::Simple that wraps many of the common features
    used for GSSAPI.
")
    (description
     "This package provides a FFI wrapper around the system GSSAPI library.  Please
make sure and read the Yard docs or standard GSSAPI documentation if you have
any questions.  There is also a class called GSSAPI::Simple that wraps many of
the common features used for GSSAPI.")
    (home-page "http://github.com/zenchild/gssapi")
    (license license:expat)))

(define-public ruby-winrm
  (package
    (name "ruby-winrm")
    (version "2.3.6")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "winrm" version))
              (sha256
               (base32
                "0nxf6a47d1xf1nvi7rbfbzjyyjhz0iakrnrsr2hj6y24a381sd8i"))))
    (build-system ruby-build-system)
    (arguments
     `(#:tests? #f)) ; TODO: Re-enable.
    (propagated-inputs (list ruby-builder
                             ruby-erubi
                             ruby-gssapi
                             ruby-gyoku
                             ruby-httpclient
                             ruby-logging
                             ruby-nori
                             ruby-rubyntlm))
    (synopsis "    Ruby library for Windows Remote Management
")
    (description "Ruby library for Windows Remote Management")
    (home-page "https://github.com/WinRb/WinRM")
    (license #f)))

(define-public ruby-wdm
  (package
    (name "ruby-wdm")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "wdm" version))
              (sha256
               (base32
                "1fb0fivhyzfq1pc7n5pr9f9vwfgdr5nvszn9q8wvm33kai4f3ddq"))))
    (build-system ruby-build-system)
    (arguments
     `(#:tests? #f)) ; TODO: Re-enable.
    (synopsis
     "Windows Directory Monitor (WDM) is a library which can be used to monitor directories for changes. It's mostly implemented in C and uses the Win32 API for a better performance.")
    (description
     "Windows Directory Monitor (WDM) is a library which can be used to monitor
directories for changes.  It's mostly implemented in C and uses the Win32 API
for a better performance.")
    (home-page "https://github.com/Maher4Ever/wdm")
    (license #f)))

(define-public ruby-vagrant-cloud
  (package
    (name "ruby-vagrant-cloud")
    (version "2.0.3")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "vagrant_cloud" version))
              (sha256
               (base32
                "16jpnq4xa7gavm024wk1rgmkfb850g89rv56f26dkh0rdhbqiqvs"))))
    (build-system ruby-build-system)
    (arguments
     `(#:tests? #f)) ; TODO: Re-enable.
    (propagated-inputs (list ruby-rest-client))
    (synopsis "Ruby library for the HashiCorp Vagrant Cloud API")
    (description "Ruby library for the HashiCorp Vagrant Cloud API")
    (home-page "https://github.com/hashicorp/vagrant_cloud")
    (license license:expat)))

(define-public ruby-winrm-elevated
  (package
    (name "ruby-winrm-elevated")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "winrm-elevated" version))
              (sha256
               (base32
                "1lmlaii8qapn84wxdg5d82gbailracgk67d0qsnbdnffcg8kswzd"))))
    (build-system ruby-build-system)
    (arguments
     `(#:tests? #f)) ; TODO: Re-enable.
    (propagated-inputs (list ruby-erubi ruby-winrm ruby-winrm-fs))
    (synopsis
     "Ruby library for running commands via WinRM as elevated through a scheduled task")
    (description
     "Ruby library for running commands via WinRM as elevated through a scheduled task")
    (home-page "https://github.com/WinRb/winrm-elevated")
    (license #f)))

(define-public ruby-rubyzip
  (package
    (name "ruby-rubyzip")
    (version "2.3.2")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "rubyzip" version))
              (sha256
               (base32
                "0grps9197qyxakbpw02pda59v45lfgbgiyw48i0mq9f2bn9y6mrz"))))
    (build-system ruby-build-system)
    (arguments
     `(#:tests? #f)) ; TODO: Re-enable.
    (synopsis "rubyzip is a ruby module for reading and writing zip files")
    (description "rubyzip is a ruby module for reading and writing zip files")
    (home-page "http://github.com/rubyzip/rubyzip")
    (license #f)))

(define-public ruby-ed25519
  (package
    (name "ruby-ed25519")
    (version "1.2.4")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "ed25519" version))
              (sha256
               (base32
                "1f5kr8za7hvla38fc0n9jiv55iq62k5bzclsa5kdb14l3r4w6qnw"))))
    (build-system ruby-build-system)
    (arguments
     `(#:tests? #f)) ; TODO: Re-enable.
    (synopsis
     "A Ruby binding to the Ed25519 elliptic curve public-key signature system described in RFC 8032.")
    (description
     "This package provides a Ruby binding to the Ed25519 elliptic curve public-key
signature system described in RFC 8032.")
    (home-page "https://github.com/RubyCrypto/ed25519")
    (license license:expat)))

(define-public ruby-bcrypt-pbkdf
  (package
    (name "ruby-bcrypt-pbkdf")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "bcrypt_pbkdf" version))
              (sha256
               (base32
                "0cj4k13c7qvvck7y25i3xarvyqq8d27vl61jddifkc7llnnap1hv"))))
    (build-system ruby-build-system)
    (arguments
     `(#:tests? #f)) ; TODO: Re-enable.
    (synopsis
     "    This gem implements bcrypt_pdkfd (a variant of PBKDF2 with bcrypt-based PRF)
")
    (description
     "This gem implements bcrypt_pdkfd (a variant of PBKDF2 with bcrypt-based PRF)")
    (home-page "https://github.com/net-ssh/bcrypt_pbkdf-ruby")
    (license license:expat)))

(define-public ruby-public-suffix
 (package
  (name "ruby-public-suffix")
  (version "3.0.2")
  (source
    (origin
      (method url-fetch)
      (uri (string-append "https://github.com/weppos/publicsuffix-ruby/archive/v" version ".tar.gz"))
      (sha256
        (base32
          "1qsyv6q073n9yw8kh27sml0sisn1r89syhkfl3kc266rlj350pkd"))))
  (build-system ruby-build-system)
  ; needs rubocop, git.
  (arguments
   `(#:tests? #f)) ; TODO: Re-enable.
  (native-inputs
   `(("bundler" ,bundler)))
  (synopsis
    "Decompose a domain name into top level domain, domain and subdomains")
  (description
    "PublicSuffix can parse and decompose a domain name into top level domain, domain and subdomains.")
  (home-page "https://simonecarletti.com/code/publicsuffix-ruby")
  (license license:expat)))

(define-public ruby-addressable
(package
  (name "ruby-addressable")
  (version "2.5.2")
  (source
    (origin
      (method url-fetch)
      (uri (rubygems-uri "addressable" version))
      (sha256
        (base32
          "0viqszpkggqi8hq87pqp0xykhvz60g99nwmkwsb0v45kc2liwxvk"))))
  (build-system ruby-build-system)
  (arguments
   `(#:tests? #f)) ; FIXME: Re-enable
  (native-inputs
   `(("ruby-rspec" ,ruby-rspec)))
  (propagated-inputs
    `(("ruby-public-suffix" ,ruby-public-suffix)))
  (synopsis
    "Addressable is a replacement for the URI implementation that is part of
Ruby's standard library. It more closely conforms to the relevant RFCs and
adds support for IRIs and URI templates.
")
  (description
    "Addressable is a replacement for the URI implementation that is part of
Ruby's standard library.  It more closely conforms to the relevant RFCs and
adds support for IRIs and URI templates.
")
  (home-page
    "https://github.com/sporkmonger/addressable")
  (license #f)))

(define-public ruby-safe-yaml
 (package
  (name "ruby-safe-yaml")
  (version "1.0.4")
  (source
    (origin
      (method url-fetch)
      (uri (rubygems-uri "safe_yaml" version))
      (sha256
        (base32
          "1hly915584hyi9q9vgd968x2nsi5yag9jyf5kq60lwzi5scr7094"))))
  (build-system ruby-build-system)
  (arguments
   `(#:tests? #f)) ; TODO: Re-enable.
  (native-inputs
   `(("ruby-rspec" ,ruby-rspec)))
  (synopsis "Parse YAML safely")
  (description "Parse YAML safely")
  (home-page "https://github.com/dtao/safe_yaml")
  (license license:expat)))

(define-public ruby-crack
 (package
  (name "ruby-crack")
  (version "0.4.3")
  (source
    (origin
      (method url-fetch)
      (uri (rubygems-uri "crack" version))
      (sha256
        (base32
          "0abb0fvgw00akyik1zxnq7yv391va148151qxdghnzngv66bl62k"))))
  (build-system ruby-build-system)
  (arguments
   `(#:tests? #f)) ; No Rakefile ??
  (propagated-inputs
    `(("ruby-safe-yaml" ,ruby-safe-yaml)))
  (synopsis
    "Really simple JSON and XML parsing, ripped from Merb and Rails.")
  (description
    "Really simple JSON and XML parsing, ripped from Merb and Rails.")
  (home-page "http://github.com/jnunemaker/crack")
  (license license:expat)))

(define-public ruby-hoe-mercurial
 (package
  (name "ruby-hoe-mercurial")
  (version "1.4.1")
  (source
    (origin
      (method url-fetch)
      (uri (rubygems-uri "hoe-mercurial" version))
      (sha256
        (base32
          "0w2113p7ga4x2yl6zb95qmzwpx4a4r5pjg469sx9fbkb8fbpg2n7"))))
  (build-system ruby-build-system)
  (propagated-inputs
   `(("ruby-hoe" ,ruby-hoe)))
  (synopsis "Fork of the @url{https://bitbucket.org/mml/hoe-hg,hoe-hg} plugin
with extra features")
  (description "hoe-mercurial, fork of the
@url{https://bitbucket.org/mml/hoe-hg,hoe-hg} plugin.")
  (home-page "http://bitbucket.org/ged/hoe-mercurial")
  (license license:bsd-3)))

(define-public ruby-bluecloth
 (package
  (name "ruby-bluecloth")
  (version "2.2.0")
  (source
    (origin
      (method url-fetch)
      (uri (rubygems-uri "bluecloth" version))
      (sha256
        (base32
          "1y83wzvhilyfqpn37d6rc23wl0p03q03wb5m1jdr10va7x1jh0dk"))))
  (build-system ruby-build-system)
  (arguments
   `(#:tests? #f)) ; FIXME: Re-enable.
  (native-inputs
   `(("ruby-hoe" ,ruby-hoe)
     ("ruby-hoe-mercurial" ,ruby-hoe-mercurial)
     ("ruby-rake-compiler" ,ruby-rake-compiler)))
  (synopsis "Markdown to HTML converter in Ruby")
  (description "@code{bluecloth} is a Markdown to HTML converter in Ruby.")
  (home-page "http://deveiate.org/projects/BlueCloth")
  (license #f))) ; FIXME what's the license? BSD-something.

(define-public ruby-hashdiff
 (package
  (name "ruby-hashdiff")
  (version "0.3.7")
  (source
    (origin
      (method url-fetch)
      (uri (rubygems-uri "hashdiff" version))
      (sha256
        (base32
          "0yj5l2rw8i8jc725hbcpc4wks0qlaaimr3dpaqamfjkjkxl0hjp9"))))
  (build-system ruby-build-system)
  (arguments
   `(#:tests? #f)) ; TODO: Re-enable.
  (native-inputs
   `(("bundler" ,bundler)
     ("ruby-bluecloth" ,ruby-bluecloth)
     ("ruby-rspec" ,ruby-rspec)
     ("ruby-yard" ,ruby-yard)))
  (synopsis "Compute the smallest difference between two hashes")
  (description "@code{HashDiff} is a diff lib to compute the smallest
difference between two hashes.")
  (home-page "https://github.com/liufengyun/hashdiff")
  (license license:expat)))

(define-public ruby-webmock
  (package
    (name "ruby-webmock")
    (version "3.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (rubygems-uri "webmock" version))
       (sha256
        (base32
         "03994dxs4xayvkxqp01dd1ivhg4xxx7z35f7cxw7y2mwj3xn24ib"))))
    (build-system ruby-build-system)
    (native-inputs
     `(("bundler" ,bundler)
       ("ruby-rspec" ,ruby-rspec)))
    (propagated-inputs
     `(("ruby-addressable" ,ruby-addressable)
       ("ruby-crack" ,ruby-crack)
       ("ruby-hashdiff" ,ruby-hashdiff)))
    (synopsis "Stub HTTP requests and set expectations on HTTP requests")
    (description "WebMock allows stubbing HTTP requests and setting
expectations on HTTP requests.")
    (home-page "http://github.com/bblimke/webmock")
    (license license:expat)))

(define-public ruby-ruby-dep
  (package
    (name "ruby-ruby-dep")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "ruby_dep" version))
              (sha256
               (base32
                "0v0qznxz999lx4vs76mr590r90i0cm5m76wwvgis7sq4y21l308l"))))
    (build-system ruby-build-system)
    (arguments
     `(#:tests? #f)) ; TODO: Re-enable.
    (synopsis
     "Creates a version constraint of supported Rubies,suitable for a gemspec file")
    (description
     "This package creates a version constraint of supported Rubies,suitable for a
gemspec file")
    (home-page "https://github.com/e2/ruby_dep")
    (license license:expat)))

(define-public ruby-i18n-1.8
  (package (inherit ruby-i18n)
    (version "1.8.0")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "i18n" version))
              (sha256
               (base32
                "0skjkfm7ppnzxdh54fdzsbl5w3q5z42ha11kwrxrzszbq1xr7ik4"))))))

(define-public ruby-listen-3.1
  (package (inherit ruby-listen)
    (name "ruby-listen")
    (version "3.1.5")
    (source
     (origin
       ;; The gem does not include a Rakefile, so fetch from the Git
       ;; repository.
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/guard/listen")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1hqmkfa9f2xb5jlvqbafdxjd5ax75jm8gqj5nh3k22xq0kacsvgg"))))
    (build-system ruby-build-system)
    (arguments
     `(#:tests? #f ; TODO: re-enable
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-files-in-gemspec
           (lambda _
             (substitute* "listen.gemspec"
               (("`git ls-files -z`") "`find . -type f -printf '%P\\\\0' |sort -z`"))
             #t))
         (add-before 'check 'remove-unnecessary-dependencies'
           (lambda _
             (substitute* "Rakefile"
               ;; Rubocop is for code linting, and is unnecessary for running
               ;; the tests.
               ((".*rubocop.*") ""))
             #t)))))
    (native-inputs
     (list bundler ruby-rspec))
    (inputs
     (list ;; ruby-thor is used for the command line interface, and is referenced
           ;; in the wrapper, and therefore just needs to be an input.
           ruby-thor))
    (propagated-inputs
     (list ruby-rb-fsevent ruby-rb-inotify ruby-dep))
    (synopsis "Listen to file modifications")
    (description "The Listen gem listens to file modifications and notifies
you about the changes.")
    (home-page "https://github.com/guard/listen")
    (license license:expat)))

(define-public ruby-net-ssh-5
  (package
    (name "ruby-net-ssh")
    (version "5.2.0")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "net-ssh" version))
              (sha256
               (base32
                "07c4v97zl1daabmri9zlbzs6yvkl56z1q14bw74d53jdj0c17nhx"))))
    (build-system ruby-build-system)
    (native-inputs
     (list bundler ruby-mocha ruby-test-unit))
    (synopsis "Ruby implementation of the SSH2 client protocol")
    (description "@code{Net::SSH} is a pure-Ruby implementation of the SSH2
client protocol.  It allows you to write programs that invoke and interact
with processes on remote servers, via SSH2.")
    (home-page "https://github.com/net-ssh/net-ssh")
    (license license:expat)))

(define-public ruby-net-sftp
  (package
    (name "ruby-net-sftp")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "net-sftp" version))
              (sha256
               (base32
                "1nsymscb30srnpxa5ml84my9gnfkn8x5hrzad2s0wdvi81j0z3yi"))))
    (build-system ruby-build-system)
    (propagated-inputs (list ruby-net-ssh))
    (synopsis "A pure Ruby implementation of the SFTP client protocol")
    (description
     "This package provides a pure Ruby implementation of the SFTP client protocol")
    (home-page "https://github.com/net-ssh/net-sftp")
    (license license:expat)))

(define-public ruby-rb-kqueue
  (package
    (name "ruby-rb-kqueue")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "rb-kqueue" version))
              (sha256
               (base32
                "1f2wimhq93a1zy2fbyj7iyh7hvzmzwn3pzhkwb3npy4mj1df83n3"))))
    (build-system ruby-build-system)
    (arguments
     `(#:tests? #f)) ; TODO: Re-enable.
    (propagated-inputs (list ruby-ffi))
    (synopsis "A Ruby wrapper for BSD's kqueue, using FFI")
    (description
     "This package provides a Ruby wrapper for BSD's kqueue, using FFI")
    (home-page "http://github.com/mat813/rb-kqueue")
    (license #f)))

(define-public ruby-hashicorp-checkpoint
 (package
  (name "ruby-hashicorp-checkpoint")
  (version "0.1.5")
  (source
    (origin
      (method url-fetch)
      (uri (rubygems-uri "hashicorp-checkpoint" version))
      (sha256
        (base32
          "1z6mwzvd7p2wqhmk07dwrhvm0ncgqm7pxn0pr2k025rwsspp9bsd"))))
  (build-system ruby-build-system)
  (arguments
   `(#:tests? #f)) ; TODO: Re-enable.
  (native-inputs
   `(("ruby-rspec" ,ruby-rspec)
     ("ruby-rspec-its" ,ruby-rspec-its)))
  (synopsis
    "Internal HashiCorp service to check version information")
  (description
    "Internal HashiCorp service to check version information")
  (home-page "http://www.hashicorp.com")
  (license #f)))
