(define-module (lp packages virtualization)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system ruby)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (gnu packages ruby)
  #:use-module (lp packages ruby))

;; TODO: vagrant gives an error message about not using official installers, so this will likely need to be patched
(define-public vagrant
  (package
    (name "vagrant")
    (version "2.2.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/hashicorp/vagrant/archive/"
                                  "v" version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0fbickjjliaw3cpkh3pl9bp56b2gcqn87c5ag67amc450ah43rdq"))))
    (build-system ruby-build-system)
    (arguments
     `(#:ruby ,ruby-2.6
       #:tests? #f)) ; bundler error.
    (propagated-inputs
     `(("ruby-childprocess" ,ruby-childprocess)
       ("ruby-dotenv" ,ruby-dotenv)
       ("ruby-erubis" ,ruby-erubis)
       ("ruby-hashicorp-checkpoint" ,ruby-hashicorp-checkpoint)
       ("ruby-i18n" ,ruby-i18n-1.8)
       ("ruby-listen" ,ruby-listen-3.1)
       ("ruby-log4r" ,ruby-log4r)
       ;; ("ruby-net-ssh" ,ruby-net-ssh-5)
       ("ruby-net-scp" ,ruby-net-scp-1.2.0)
       ("ruby-net-sftp" ,ruby-net-sftp)
       ("ruby-rb-kqueue" ,ruby-rb-kqueue)
       ("ruby-ed25519" ,ruby-ed25519)
       ("ruby-bcrypt-pbkdf" ,ruby-bcrypt-pbkdf)
       ("ruby-rest-client" ,ruby-rest-client)
       ;; ("ruby-rubyzip" ,ruby-rubyzip-2)
       ("ruby-wdm" ,ruby-wdm)
       ("ruby-winrm" ,ruby-winrm)
       ("ruby-winrm-fs" ,ruby-winrm-fs)
       ("ruby-winrm-elevated" ,ruby-winrm-elevated)
       ("ruby-vagrant-cloud" ,ruby-vagrant-cloud)
       ("ruby-ruby-dep" ,ruby-ruby-dep)))
    (native-inputs
     `(("bundler" ,bundler)
       ("ruby-rake" ,ruby-rake-12)
       ("ruby-rspec" ,ruby-rspec-3.5)
       ("ruby-rspec-its" ,ruby-rspec-its)
       ("ruby-webmock" ,ruby-webmock-2)
       ("ruby-fake-ftp" ,ruby-fake-ftp)))
    (synopsis
     "Tool for building and distributing development environments")
    (description
     "Tool for building and distributing development environments")
    (home-page "http://www.vagrantup.com")
    (license license:expat)))
