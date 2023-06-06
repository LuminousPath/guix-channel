(define-module (lp packages rust-apps)
  #:use-module (lp packages crates-extra)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages)
  #:use-module (lp packages)
  #:use-module (guix git-download)
  #:use-module (guix download)
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
       #:cargo-test-flags
       '("--release"
         "--"
         "--skip=test_apparent_size")
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
     (list libgit2-1.4 libssh2 openssl zlib))
    (home-page "https://github.com/dandavison/delta")
    (synopsis "A syntax-highlighting pager for git")
    (description "This package provides a syntax-highlighting pager for git")
    (license license:expat)))

;; This was added specifically to fix the issue in tealdeer: https://issues/guix.gnu.org/57867
;; TODO: remove this when tealdeer is updated/fixed
(define-public tealdeer-patched
  (package
    (name "tealdeer-patched")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tealdeer" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0cwf46k2rszcpydrqajnm4dvhggr3ms7sjma0jx02ch4fjicxch7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'install 'install-completions
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out  (assoc-ref outputs "out"))
                    (bash (string-append out "/etc/bash_completion.d/"))
                    (fish (string-append out "/share/fish/vendor_completions.d/")))
               (mkdir-p bash)
               (mkdir-p fish)
               (copy-file "bash_tealdeer"
                          (string-append bash "tealdeer"))
               (copy-file "fish_tealdeer"
                          (string-append fish "tealdeer.fish"))))))
       #:install-source? #f
       #:cargo-test-flags
       '("--release" "--"
         ;; These tests go to the network
         "--skip=test_quiet_old_cache"
         "--skip=test_quiet_cache"
         "--skip=test_quiet_failures"
         "--skip=test_pager_flag_enable"
         "--skip=test_markdown_rendering"
         "--skip=test_spaces_find_command"
         "--skip=test_autoupdate_cache"
         "--skip=test_update_cache")
       #:cargo-inputs
       (("rust-ansi-term" ,rust-ansi-term-0.12)
        ("rust-app-dirs2" ,rust-app-dirs2-2)
        ("rust-atty" ,rust-atty-0.2)
        ("rust-docopt" ,rust-docopt-1)
        ("rust-env-logger" ,rust-env-logger-0.7)
        ("rust-flate2" ,rust-flate2-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-pager" ,rust-pager-0.15)
        ("rust-reqwest" ,rust-reqwest-0.10.10-patched)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-derive" ,rust-serde-derive-1)
        ("rust-tar" ,rust-tar-0.4)
        ("rust-toml" ,rust-toml-0.5)
        ("rust-walkdir" ,rust-walkdir-2)
        ("rust-xdg" ,rust-xdg-2))
       #:cargo-development-inputs
       (("rust-assert-cmd" ,rust-assert-cmd-1)
        ("rust-escargot" ,rust-escargot-0.5)
        ("rust-filetime" ,rust-filetime-0.2)
        ("rust-predicates" ,rust-predicates-1)
        ;; This earlier version is required to fix a bug.
        ;; Remove rust-remove-dir-all-0.5.2 when tealdeer gets upgraded
        ("rust-remove-dir-all" ,rust-remove-dir-all-0.5)
        ("rust-tempfile" ,rust-tempfile-3))))
    (native-inputs
     (list pkg-config))
    (inputs
     (list openssl))
    (home-page "https://github.com/dbrgn/tealdeer/")
    (synopsis "Fetch and show tldr help pages for many CLI commands")
    (description
     "This package fetches and shows tldr help pages for many CLI commands.
Full featured offline client with caching support.")
    (license (list license:expat license:asl2.0))))

(define-public rust-analyzer-patched
  (package
    (name "rust-analyzer")
    (version "2022-01-10")
    (source
     (origin
       ;; The crate at "crates.io" is empty.
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rust-analyzer/rust-analyzer")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1ci85bp8xwqrk8nqr8sh6yj8njgd98nhgnhaks2g00c77wwyra41"))))
    (build-system cargo-build-system)
    (arguments
     `(#:install-source? #f             ; virtual manifest
       #:cargo-test-flags
       '("--release" "--"
         "--skip=tests::test_version_check" ;it need rustc's version
         ;; FIXME: Guix's rust does not install source in
         ;; %out/lib/rustlib/src/rust so "can't load standard library from
         ;; sysroot"
         "--skip=tests::test_loading_rust_analyzer"
         ;; Failed to run rustfmt from toolchain 'stable'.  Please run `rustup
         ;; component add rustfmt --toolchain stable` to install it
         "--skip=tests::sourcegen::sourcegen_assists_docs" ;need rustfmt
         "--skip=tests::sourcegen_ast::sourcegen_ast"      ;same

         "--skip=test_derive_empty"             ; creates memory buffer overflow issue
         "--skip=test_derive_error"             ; same
         "--skip=test_fn_like_macro"            ; same
         "--skip=test_fn_like_macro2"           ; same
         "--skip=test_attr_macro"               ; same
         "--skip=list_test_macros"              ; same
         "--skip=tidy::cargo_files_are_tidy"    ;not needed
         "--skip=tidy::check_licenses"          ;it runs cargo metadata
         "--skip=tidy::check_merge_commits"     ;it runs git rev-list
         "--skip=tidy::check_code_formatting"   ;need rustfmt as cargo fmt
         "--skip=tidy::generate_grammar"        ;same
         "--skip=tidy::generate_assists_tests") ;same
       #:cargo-development-inputs
       (("rust-arbitrary" ,rust-arbitrary-1)
        ("rust-derive-arbitrary" ,rust-derive-arbitrary-1)
        ("rust-expect-test" ,rust-expect-test-1)
        ("rust-oorandom" ,rust-oorandom-11.1)
        ("rust-quote" ,rust-quote-1)
        ("rust-rayon" ,rust-rayon-1)
        ("rust-tracing" ,rust-tracing-0.1)
        ("rust-tracing-subscriber" ,rust-tracing-subscriber-0.3)
        ("rust-tracing-tree" ,rust-tracing-tree-0.2)
        ("rust-ungrammar" ,rust-ungrammar-1))
       #:cargo-inputs
       (("rust-always-assert" ,rust-always-assert-0.1)
        ("rust-anyhow" ,rust-anyhow-1)
        ("rust-anymap" ,rust-anymap-0.12)
        ("rust-arrayvec" ,rust-arrayvec-0.7)
        ("rust-backtrace" ,rust-backtrace-0.3)
        ("rust-cargo-metadata" ,rust-cargo-metadata-0.14)
        ("rust-cfg-if" ,rust-cfg-if-1)
        ("rust-chalk-ir" ,rust-chalk-ir-0.75)
        ("rust-chalk-recursive" ,rust-chalk-recursive-0.75)
        ("rust-chalk-solve" ,rust-chalk-solve-0.75)
        ("rust-countme" ,rust-countme-3)
        ("rust-cov-mark" ,rust-cov-mark-2)
        ("rust-crossbeam-channel" ,rust-crossbeam-channel-0.5)
        ("rust-dashmap" ,rust-dashmap-4)
        ("rust-dissimilar" ,rust-dissimilar-1)
        ("rust-dot" ,rust-dot-0.1)
        ("rust-drop-bomb" ,rust-drop-bomb-0.1)
        ("rust-either" ,rust-either-1)
        ("rust-ena" ,rust-ena-0.14)
        ("rust-env-logger" ,rust-env-logger-0.8)
        ("rust-flate2" ,rust-flate2-1)
        ("rust-fst" ,rust-fst-0.4)
        ("rust-home" ,rust-home-0.5)
        ("rust-indexmap" ,rust-indexmap-1)
        ("rust-itertools" ,rust-itertools-0.10)
        ("rust-jod-thread" ,rust-jod-thread-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libloading" ,rust-libloading-0.7)
        ("rust-log" ,rust-log-0.4)
        ("rust-lsp-server" ,rust-lsp-server-0.5)
        ("rust-lsp-types" ,rust-lsp-types-0.91)
        ("rust-memmap2" ,rust-memmap2-0.5)
        ("rust-mimalloc" ,rust-mimalloc-0.1)
        ("rust-miow" ,rust-miow-0.4)
        ("rust-notify" ,rust-notify-5-pre)
        ("rust-object" ,rust-object-0.28)
        ("rust-once-cell" ,rust-once-cell-1)
        ("rust-parking-lot" ,rust-parking-lot-0.11)
        ("rust-perf-event" ,rust-perf-event-0.4)
        ("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-pulldown-cmark" ,rust-pulldown-cmark-0.8)
        ("rust-pulldown-cmark-to-cmark" ,rust-pulldown-cmark-to-cmark-7)
        ("rust-rowan" ,rust-rowan-0.15)
        ("rust-rustc-ap-rustc-lexer" ,rust-rustc-ap-rustc-lexer-725)
        ("rust-rustc-hash" ,rust-rustc-hash-1)
        ("rust-salsa" ,rust-salsa-0.17)
        ("rust-scoped-tls" ,rust-scoped-tls-1)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-json" ,rust-serde-json-1)
        ("rust-serde-path-to-error" ,rust-serde-path-to-error-0.1)
        ("rust-typed-arena" ,rust-typed-arena-2)
        ("rust-smallvec" ,rust-smallvec-1)
        ("rust-smol-str" ,rust-smol-str-0.1)
        ("rust-snap" ,rust-snap-1)
        ("rust-text-size" ,rust-text-size-1)
        ("rust-threadpool" ,rust-threadpool-1)
        ("rust-tikv-jemalloc-ctl" ,rust-tikv-jemalloc-ctl-0.4)
        ("rust-tikv-jemallocator" ,rust-tikv-jemallocator-0.4)
        ("rust-url" ,rust-url-2)
        ("rust-walkdir" ,rust-walkdir-2)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-write-json" ,rust-write-json-0.1)
        ("rust-xflags" ,rust-xflags-0.2)
        ("rust-xshell" ,rust-xshell-0.1))
       #:phases
       (modify-phases %standard-phases
         (add-before 'check 'fix-tests
           (lambda _
             (let ((bash (string-append "#!" (which "bash"))))
               (with-directory-excursion "crates/parser/test_data/lexer/ok"
                 (substitute* "single_line_comments.txt"
                   (("SHEBANG 19")
                    (string-append "SHEBANG "
                                   (number->string (string-length bash))))
                   (("#!/usr/bin/env bash") bash))))))
         (add-before 'install 'install-doc
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (doc (string-append out "/share/doc/rust-analyzer-"
                                        ,version)))
               (copy-recursively "docs" doc))))
         (add-before 'install 'chdir
           (lambda _
             (chdir "crates/rust-analyzer")))
         (add-after 'install 'wrap-program
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin"))
                    (rust-src-path (search-input-directory
                                    inputs "/lib/rustlib/src/rust/library")))
               ;; if environment variable RUST_SRC_PATH is not set, set it,
               ;; make rust-analyzer work out of box.
               (with-directory-excursion bin
                 (let* ((prog "rust-analyzer")
                        (wrapped-file (string-append (dirname prog)
                                                     "/." (basename prog) "-real"))
                        (prog-tmp (string-append wrapped-file "-tmp")))
                   (link prog wrapped-file)
                   (call-with-output-file prog-tmp
                     (lambda (port)
                       (format port "#!~a
if test -z \"${RUST_SRC_PATH}\";then export RUST_SRC_PATH=~S;fi;
exec -a \"$0\" \"~a\" \"$@\""
                               (which "bash")
                               rust-src-path
                               (canonicalize-path wrapped-file))))
                   (chmod prog-tmp #o755)
                   (rename-file prog-tmp prog))))))
         (replace 'install-license-files
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (doc (string-append out "/share/doc/rust-analyzer-"
                                        ,version)))
               (chdir "../..")
               (install-file "LICENSE-MIT" doc)
               (install-file "LICENSE-APACHE" doc)))))))
    (native-inputs (list rust-src))
    (home-page "https://rust-analyzer.github.io/")
    (synopsis "Experimental Rust compiler front-end for IDEs")
    (description "Rust-analyzer is a modular compiler frontend for the Rust
language.  It is a part of a larger rls-2.0 effort to create excellent IDE
support for Rust.")
    (license (list license:expat license:asl2.0))))
