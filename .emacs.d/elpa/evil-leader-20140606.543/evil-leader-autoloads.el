;;; evil-leader-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "evil-leader" "../../../../../../.emacs.d/elpa/evil-leader-20140606.543/evil-leader.el"
;;;;;;  "dd103e8bfad854692967bba4b96e1d69")
;;; Generated autoloads from ../../../../../../.emacs.d/elpa/evil-leader-20140606.543/evil-leader.el

(autoload 'global-evil-leader-mode "evil-leader" "\
Global minor mode for <leader> support.

\(fn &optional ARG)" t nil)

(autoload 'evil-leader-mode "evil-leader" "\
Minor mode to enable <leader> support.

\(fn &optional ARG)" t nil)

(autoload 'evil-leader/set-key "evil-leader" "\
Bind `key' to command `def' in `evil-leader/default-map'.

Key has to be readable by `read-kbd-macro' and `def' a command.
Accepts further `key' `def' pairs.

\(fn KEY DEF &rest BINDINGS)" t nil)

(autoload 'evil-leader/set-key-for-mode "evil-leader" "\
Create keybindings for major-mode `mode' with `key' bound to command `def'.

See `evil-leader/set-key'.

\(fn MODE KEY DEF &rest BINDINGS)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../../.emacs.d/elpa/evil-leader-20140606.543/evil-leader-autoloads.el"
;;;;;;  "../../../../../../.emacs.d/elpa/evil-leader-20140606.543/evil-leader.el")
;;;;;;  (23116 1781 380792 294000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; evil-leader-autoloads.el ends here
