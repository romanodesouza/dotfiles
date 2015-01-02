; Look'n feel
(require-package 'seti-theme)
(load-theme 'seti t)
(set-default-font "DejaVu Sans Mono-14")

; Key bindings
(define-key evil-normal-state-map (kbd "/") 'helm-swoop)
(define-key evil-normal-state-map (kbd "w") 'forward-word)
(define-key evil-normal-state-map (kbd "b") 'backward-word)

(key-chord-define-global ",a" 'back-to-indentation)
(key-chord-define-global "!!" 'flycheck-next-error)
(key-chord-define-global "@@" 'flycheck-previous-error)

(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-insert-state-map "oo" 'evil-open-below)
(key-chord-define evil-insert-state-map "oO" 'evil-open-above)

; Jinja2 mode
(require-package 'jinja2-mode)
(add-to-list 'auto-mode-alist '("\\.html" . jinja2-mode))
(add-hook 'sgml-mode-hook (lambda ()
                            (key-chord-define jinja2-mode-map "jo" 'jinja2-insert-tag)
                            (key-chord-define jinja2-mode-map "jc" 'my-jinja2-close-tag)
                            (key-chord-define jinja2-mode-map "jv" 'jinja2-var-tag)))

(defun my-jinja2-close-tag ()
  "Close the previously opened template tag."
  (interactive)
  (let ((open-tag (save-excursion (jinja2-find-open-tag))))
    (if open-tag
      (insert
          (format "{%% end%s %%}"
                  (match-string 2)))
      (error "Nothing to close")))
  (save-excursion (jinja2-indent-line)))

(provide 'init-local-config)
