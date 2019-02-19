;;; evil-matchit-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "evil-matchit" "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit.el"
;;;;;;  "918d67097bf2c1b6fd07dcfb2de59a7b")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit.el

(autoload 'evilmi-load-plugin-rules "evil-matchit" "\
Load MODES's plugin RULES.

\(fn MODES RULES)" nil nil)

(autoload 'evilmi-init-plugins "evil-matchit" "\
Load plugins.

\(fn)" t nil)

(autoload 'evilmi-select-items "evil-matchit" "\
Select items/tags and the region between them.

\(fn &optional NUM)" t nil)

(autoload 'evilmi-delete-items "evil-matchit" "\
Delete items/tags and the region between them.

\(fn &optional NUM)" t nil)

(autoload 'evilmi-jump-to-percentage "evil-matchit" "\
Like Vim %.

\(fn NUM)" t nil)
 (autoload 'evilmi-jump-items "evil-matchit" nil t)

(autoload 'evilmi-version "evil-matchit" "\


\(fn)" t nil)

(autoload 'evil-matchit-mode "evil-matchit" "\
Buffer-local minor mode to emulate matchit.vim.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-evil-matchit-mode "evil-matchit" "\
Enable evil-matchit-mode in the current buffer.

\(fn)" nil nil)

(autoload 'turn-off-evil-matchit-mode "evil-matchit" "\
Disable evil-matchit-mode in the current buffer.

\(fn)" nil nil)

(defvar global-evil-matchit-mode nil "\
Non-nil if Global Evil-Matchit mode is enabled.
See the `global-evil-matchit-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-evil-matchit-mode'.")

(custom-autoload 'global-evil-matchit-mode "evil-matchit" nil)

(autoload 'global-evil-matchit-mode "evil-matchit" "\
Toggle Evil-Matchit mode in all buffers.
With prefix ARG, enable Global Evil-Matchit mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Evil-Matchit mode is enabled in all buffers where
`turn-on-evil-matchit-mode' would do it.
See `evil-matchit-mode' for more information on Evil-Matchit mode.

\(fn &optional ARG)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "evil-matchit"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-matchit" '("evilmi-")))

;;;***

;;;***

;;;### (autoloads nil "evil-matchit-c" "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-c.el"
;;;;;;  "7b99ac867a327c9f200b6cfcfbc29f3d")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-c.el

(autoload 'evilmi-c-get-tag "evil-matchit-c" "\


\(fn)" nil nil)

(autoload 'evilmi-c-jump "evil-matchit-c" "\


\(fn RLT NUM)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "evil-matchit-c"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-c.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-c.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-matchit-c" '("evilmi-c-")))

;;;***

;;;***

;;;### (autoloads nil "evil-matchit-cmake" "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-cmake.el"
;;;;;;  "b28b97e0e7054cdf724ad0dbe13f30dc")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-cmake.el

(autoload 'evilmi-cmake-get-tag "evil-matchit-cmake" "\


\(fn)" nil nil)

(autoload 'evilmi-cmake-jump "evil-matchit-cmake" "\


\(fn RLT NUM)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "evil-matchit-cmake"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-cmake.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-cmake.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-matchit-cmake" '("evilmi-cmake-")))

;;;***

;;;***

;;;### (autoloads nil "evil-matchit-diff" "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-diff.el"
;;;;;;  "9fc4371b0bd9966e324eea2212c484e9")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-diff.el

(autoload 'evilmi-diff-get-tag "evil-matchit-diff" "\


\(fn)" nil nil)

(autoload 'evilmi-diff-jump "evil-matchit-diff" "\


\(fn RLT NUM)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "evil-matchit-diff"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-diff.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-diff.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-matchit-diff" '("evilmi-diff-guess-final-pos")))

;;;***

;;;***

;;;### (autoloads nil "evil-matchit-elixir" "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-elixir.el"
;;;;;;  "3483c18d8e3c4854d92afa0a72e83ca5")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-elixir.el

(autoload 'evilmi-elixir-get-tag "evil-matchit-elixir" "\


\(fn)" nil nil)

(autoload 'evilmi-elixir-jump "evil-matchit-elixir" "\


\(fn RLT NUM)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "evil-matchit-elixir"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-elixir.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-elixir.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-matchit-elixir" '("evilmi-elixir-")))

;;;***

;;;***

;;;### (autoloads nil "evil-matchit-fortran" "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-fortran.el"
;;;;;;  "e48f6f9f6687cff161a568f82ff6f35b")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-fortran.el

(autoload 'evilmi-fortran-get-tag "evil-matchit-fortran" "\


\(fn)" nil nil)

(autoload 'evilmi-fortran-jump "evil-matchit-fortran" "\


\(fn RLT NUM)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "evil-matchit-fortran"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-fortran.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-fortran.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-matchit-fortran" '("evilmi-fortran-")))

;;;***

;;;***

;;;### (autoloads nil "evil-matchit-html" "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-html.el"
;;;;;;  "c22f45c1a58ca85d1696c16aec44bc79")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-html.el

(autoload 'evilmi-html-get-tag "evil-matchit-html" "\


\(fn)" nil nil)

(autoload 'evilmi-html-jump "evil-matchit-html" "\


\(fn RLT NUM)" nil nil)

;;;***

;;;### (autoloads nil "evil-matchit-javascript" "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-javascript.el"
;;;;;;  "313522fd0f0dc63c2dacf794c0dd8a58")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-javascript.el

(autoload 'evilmi-javascript-get-tag "evil-matchit-javascript" "\


\(fn)" nil nil)

(autoload 'evilmi-javascript-jump "evil-matchit-javascript" "\


\(fn RLT NUM)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "evil-matchit-javascript"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-javascript.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-javascript.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-matchit-javascript" '("evilmi-")))

;;;***

;;;***

;;;### (autoloads nil "evil-matchit-latex" "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-latex.el"
;;;;;;  "0ca99f06af555540fa06fe82c5237853")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-latex.el

(autoload 'evilmi-latex-get-tag "evil-matchit-latex" "\


\(fn)" nil nil)

(autoload 'evilmi-latex-jump "evil-matchit-latex" "\


\(fn RLT NUM)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "evil-matchit-latex"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-latex.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-latex.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-matchit-latex" '("evilmi-latex-")))

;;;***

;;;***

;;;### (autoloads nil "evil-matchit-markdown" "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-markdown.el"
;;;;;;  "1e1d80e170f8b4bc33cb2427750e2f2b")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-markdown.el

(autoload 'evilmi-markdown-get-tag "evil-matchit-markdown" "\
Get current tag.
Return (list start-position tag).

\(fn)" nil nil)

(autoload 'evilmi-markdown-jump "evil-matchit-markdown" "\
Jump to the next tag.

\(fn INFO NUM)" nil nil)

;;;***

;;;### (autoloads nil "evil-matchit-ocaml" "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-ocaml.el"
;;;;;;  "3a11ac32c4bea8fddabd0f3deac3a035")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-ocaml.el

(autoload 'evilmi-ocaml-get-tag "evil-matchit-ocaml" "\
Return information of current tag: (list position-of-word word).

\(fn)" nil nil)

(autoload 'evilmi-ocaml-jump "evil-matchit-ocaml" "\


\(fn RLT NUM)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "evil-matchit-ocaml"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-ocaml.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-ocaml.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-matchit-ocaml" '("evilmi-ocaml-")))

;;;***

;;;***

;;;### (autoloads nil "evil-matchit-org" "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-org.el"
;;;;;;  "e5ad5dfccb7d23643b5cb9f5c58a6b93")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-org.el

(autoload 'evilmi-org-get-tag "evil-matchit-org" "\


\(fn)" nil nil)

(autoload 'evilmi-org-jump "evil-matchit-org" "\


\(fn RLT NUM)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "evil-matchit-org"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-org.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-org.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-matchit-org" '("evilmi-")))

;;;***

;;;***

;;;### (autoloads nil "evil-matchit-python" "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-python.el"
;;;;;;  "8cf8942aa862a0ba95477f7f16eb23b0")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-python.el

(autoload 'evilmi-python-get-tag "evil-matchit-python" "\
Reutrn '(start-position tag-type keyword).

\(fn)" nil nil)

(autoload 'evilmi-python-jump "evil-matchit-python" "\


\(fn RLT NUM)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "evil-matchit-python"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-python.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-python.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-matchit-python" '("evilmi--python-")))

;;;***

;;;***

;;;### (autoloads nil "evil-matchit-ruby" "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-ruby.el"
;;;;;;  "38b28a3031c42bb97eb5ded3dd0deddb")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-ruby.el

(autoload 'evilmi-ruby-get-tag "evil-matchit-ruby" "\


\(fn)" nil nil)

(autoload 'evilmi-ruby-jump "evil-matchit-ruby" "\


\(fn RLT NUM)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "evil-matchit-ruby"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-ruby.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-ruby.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-matchit-ruby" '("evilmi-ruby-")))

;;;***

;;;***

;;;### (autoloads nil "evil-matchit-script" "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-script.el"
;;;;;;  "06ad55a8bca47a724139e5ae855f407b")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-script.el

(autoload 'evilmi-script-get-tag "evil-matchit-script" "\


\(fn)" nil nil)

(autoload 'evilmi-script-jump "evil-matchit-script" "\


\(fn RLT NUM)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "evil-matchit-script"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-script.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-script.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-matchit-script" '("evilmi-script-")))

;;;***

;;;***

;;;### (autoloads nil "evil-matchit-sdk" "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-sdk.el"
;;;;;;  "239a9d3d9ace3eb88dc1945d1fbee281")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-sdk.el

(autoload 'evilmi-sdk-curline "evil-matchit-sdk" "\


\(fn)" nil nil)

(autoload 'evilmi-sdk-member "evil-matchit-sdk" "\
Check if KEYWORD exist in KEYWORD-LIST.

\(fn KEYWORD KEYWORD-LIST)" nil nil)

(autoload 'evilmi-sdk-get-tag-info "evil-matchit-sdk" "\
Return (row column is-function-exit-point keyword).
The row and column marked position in evilmi-mylang-match-tags
is-function-exit-point could be unknown status

\(fn KEYWORD MATCH-TAGS)" nil nil)

(autoload 'evilmi-sdk-get-tag "evil-matchit-sdk" "\
Return '(start-point ((row column is-function-exit-point keyword)).

\(fn MATCH-TAGS HOWTOS)" nil nil)

(autoload 'evilmi-sdk-jump "evil-matchit-sdk" "\
Use RLT, NUM, MATCH-TAGS and HOWTOS to jump.
Return nil if no matching tag found.  Please note (point) is changed
after calling this function.

\(fn RLT NUM MATCH-TAGS HOWTOS)" nil nil)

(autoload 'evilmi-current-font-among-fonts-p "evil-matchit-sdk" "\
If current font at POS is among FONTS.

\(fn POS FONTS)" nil nil)

(autoload 'evilmi-in-comment-p "evil-matchit-sdk" "\
Check character at POS is comment by comparing font face.

\(fn POS)" nil nil)

(autoload 'evilmi-in-string-or-doc-p "evil-matchit-sdk" "\
Check character at POS is string or document by comparing font face.

\(fn POS)" nil nil)

(autoload 'evilmi-evenp "evil-matchit-sdk" "\


\(fn NUM)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "evil-matchit-sdk"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-sdk.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-sdk.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-matchit-sdk" '("evilmi-")))

;;;***

;;;***

;;;### (autoloads nil "evil-matchit-sh" "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-sh.el"
;;;;;;  "1e36009143c11216f4f57791ab413486")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-sh.el

(autoload 'evilmi-sh-get-tag "evil-matchit-sh" "\


\(fn)" nil nil)

(autoload 'evilmi-sh-jump "evil-matchit-sh" "\


\(fn RLT NUM)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "evil-matchit-sh"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-sh.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-sh.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-matchit-sh" '("evilmi-sh-")))

;;;***

;;;***

;;;### (autoloads nil "evil-matchit-simple" "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-simple.el"
;;;;;;  "47e8ebed638fca6449b408cb2d419985")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-simple.el

(autoload 'evilmi-simple-get-tag "evil-matchit-simple" "\


\(fn)" nil nil)

(autoload 'evilmi-simple-jump "evil-matchit-simple" "\


\(fn RLT NUM)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "evil-matchit-simple"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-simple.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-simple.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-matchit-simple" '("evilmi--simple-find-open-brace")))

;;;***

;;;***

;;;### (autoloads nil "evil-matchit-sql" "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-sql.el"
;;;;;;  "b0a76e27d7a417ae521922710e8959c4")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-sql.el

(autoload 'evilmi-sql-get-tag "evil-matchit-sql" "\


\(fn)" nil nil)

(autoload 'evilmi-sql-jump "evil-matchit-sql" "\


\(fn RLT NUM)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "evil-matchit-sql"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-sql.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-sql.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-matchit-sql" '("evilmi-sql-")))

;;;***

;;;***

;;;### (autoloads nil "evil-matchit-template" "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-template.el"
;;;;;;  "6aab3f4dd53e353d6435da022917e8c3")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-template.el

(autoload 'evilmi-template-get-tag "evil-matchit-template" "\


\(fn)" nil nil)

(autoload 'evilmi-template-jump "evil-matchit-template" "\


\(fn RLT NUM)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "evil-matchit-template"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-template.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-template.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-matchit-template" '("evilmi-template-")))

;;;***

;;;***

;;;### (autoloads nil "evil-matchit-verilog" "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-verilog.el"
;;;;;;  "1caeba492b06ccaf6ab8a0fcdb8db44c")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-verilog.el

(autoload 'evilmi-verilog-get-tag "evil-matchit-verilog" "\


\(fn)" nil nil)

(autoload 'evilmi-verilog-jump "evil-matchit-verilog" "\


\(fn ORIG-INFO NUM)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "evil-matchit-verilog"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-verilog.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-verilog.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-matchit-verilog" '("evilmi-verilog-")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-autoloads.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-c.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-cmake.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-diff.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-elixir.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-fortran.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-html.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-javascript.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-latex.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-markdown.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-ocaml.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-org.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-pkg.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-python.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-ruby.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-script.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-sdk.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-sh.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-simple.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-sql.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-template.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit-verilog.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/evil-matchit-20181230.139/evil-matchit.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; evil-matchit-autoloads.el ends here
