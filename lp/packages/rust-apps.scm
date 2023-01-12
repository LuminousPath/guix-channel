(define-module (lp packages rust-apps)
  #:use-module (lp packages crates-extra)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages)
  #:use-module (lp packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system cargo)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:))

(define-public dust
  (package
    (name "dust")
    (version "0.8.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bootandy/dust")
             (commit (string-append "v" version))))
       (file-name
        (git-file-name name version))
       (sha256
        (base32 "04vf0nddlymm2f49jhr6nqx0793p6whgxyqssbmw0smjsnwx1nq8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:install-source? #f
       #:cargo-inputs
       (("rust-ansi-term" ,rust-ansi-term-0.12)
        ("rust-clap" ,rust-clap-3)
        ("rust-clap" ,rust-clap-3)
        ("rust-clap-complete" ,rust-clap-complete-3)
        ("rust-config-file" ,rust-config-file-0.2)
        ("rust-directories" ,rust-directories-4)
        ("rust-lscolors" ,rust-lscolors-0.7)
        ("rust-rayon" ,rust-rayon-1)
        ("rust-regex" ,rust-regex-1)
        ("rust-serde" ,rust-serde-1)
        ("rust-stfu8" ,rust-stfu8-0.2)
        ("rust-sysinfo" ,rust-sysinfo-0.15)
        ("rust-terminal-size" ,rust-terminal-size-0.1)
        ("rust-thousands" ,rust-thousands-0.2)
        ("rust-unicode-width" ,rust-unicode-width-0.1)
        ("rust-winapi-util" ,rust-winapi-util-0.1))
       #:cargo-development-inputs
       (("rust-assert-cmd" ,rust-assert-cmd-1)
        ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://github.com/bootandy/dust")
    (synopsis "A more intuitive version of du")
    (description "This package provides a more intuitive version of du")
    (license license:asl2.0)))

(define-public git-delta
  (package
    (name "git-delta")
    (version "0.13.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dandavison/delta")
             (commit version)))
       (file-name
        (git-file-name name version))
       (sha256
        (base32
         "033kmhvsz4mqrkc9ygdpf2x8ysi29d0pxdbmr9i1cffibnjiw7p6"))
       (patches (search-patches "rust-delta-add-bool-to-option-feature.patch"))))
    (build-system cargo-build-system)
    (arguments
     `(#:install-source? #f
       #:cargo-inputs
       (("rust-ansi-colours" ,rust-ansi-colours-1)
        ("rust-ansi-term" ,rust-ansi-term-0.12)
        ("rust-atty" ,rust-atty-0.2)
        ("rust-bat" ,rust-bat-0.21)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-box-drawing" ,rust-box-drawing-0.1)
        ("rust-bytelines" ,rust-bytelines-2)
        ("rust-chrono" ,rust-chrono-0.4)
        ("rust-chrono-humanize" ,rust-chrono-humanize-0.2)
        ("rust-clap" ,rust-clap-3)
        ("rust-console" ,rust-console-0.15)
        ("rust-ctrlc" ,rust-ctrlc-3.2)
        ("rust-dirs-next" ,rust-dirs-next-2)
        ("rust-error-chain" ,rust-error-chain-0.12)
        ("rust-git2" ,rust-git2-0.14)
        ("rust-grep-cli" ,rust-grep-cli-0.1)
        ("rust-itertools" ,rust-itertools-0.10)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-palette" ,rust-palette-0.6)
        ("rust-pathdiff" ,rust-pathdiff-0.2)
        ("rust-regex" ,rust-regex-1)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-json" ,rust-serde-json-1)
        ("rust-shell-words" ,rust-shell-words-1.1)
        ("rust-smol-str" ,rust-smol-str-0.1)
        ("rust-syntect" ,rust-syntect-5)
        ("rust-sysinfo" ,rust-sysinfo-0.23)
        ("rust-unicode-segmentation" ,rust-unicode-segmentation-1.10)
        ("rust-unicode-width" ,rust-unicode-width-0.1)
        ("rust-vte" ,rust-vte-0.10.1)
        ("rust-xdg" ,rust-xdg-2))
       #:cargo-test-flags
       '("--release"
         "--"
         "--skip=subcommands::diff::main_tests::test_diff_empty_vs_non_empty_file"
         "--skip=subcommands::diff::main_tests::test_diff_same_non_empty_file"
         "--skip=subcommands::diff::main_tests::test_diff_two_non_empty_files")))
    (native-inputs
     (list pkg-config))
    (inputs
     (list libgit2 zlib))
    (home-page "https://github.com/dandavison/delta")
    (synopsis "A syntax-highlighting pager for git")
    (description "This package provides a syntax-highlighting pager for git")
    (license license:expat)))
