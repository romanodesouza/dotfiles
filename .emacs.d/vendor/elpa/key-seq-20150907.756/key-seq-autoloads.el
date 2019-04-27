;;; key-seq-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "key-seq" "../../../../../../../.emacs.d/elpa/key-seq-20150907.756/key-seq.el"
;;;;;;  "8b304e21bd5d70da2bfa12539bae3ef6")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/key-seq-20150907.756/key-seq.el

(autoload 'key-seq-define-global "key-seq" "\
Define a key sequence of the two keys in KEYS starting a COMMAND.

KEYS can be a string or a vector of two elements. Currently only elements
that corresponds to ascii codes in the range 32 to 126 can be used.

COMMAND can be an interactive function, a string, or nil.
If COMMAND is nil, the key-chord is removed.

Note that KEYS defined locally in the current buffer will have precedence.

\(fn KEYS COMMAND)" t nil)

(autoload 'key-seq-define-local "key-seq" "\
Locally define a key sequence of the two keys in KEYS starting a COMMAND.

KEYS can be a string or a vector of two elements. Currently only elements
that corresponds to ascii codes in the range 32 to 126 can be used.

COMMAND can be an interactive function, a string, or nil.
If COMMAND is nil, the key-chord is removed.

The binding goes in the current buffer's local map,
which in most cases is shared with all other buffers in the same major mode.

\(fn KEYS COMMAND)" t nil)

(autoload 'key-seq-define "key-seq" "\
Define in KEYMAP, a key sequence of the two keys in KEYS starting a COMMAND.

KEYS can be a string or a vector of two elements. Currently only elements
that corresponds to ascii codes in the range 32 to 126 can be used.

COMMAND can be an interactive function, a string, or nil.
If COMMAND is nil, the key-chord is removed.

\(fn KEYMAP KEYS COMMAND)" nil nil)

;;;***

;;;### (autoloads nil nil ("../../../../../../../.emacs.d/elpa/key-seq-20150907.756/key-seq-autoloads.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/key-seq-20150907.756/key-seq.el")
;;;;;;  (23748 11257 959975 764000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; key-seq-autoloads.el ends here
