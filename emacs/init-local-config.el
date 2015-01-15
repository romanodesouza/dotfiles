; Look'n feel
(require-package 'seti-theme)
(load-theme 'seti t)
(set-default-font "DejaVu Sans Mono-14")

; Go Oracle
(add-hook 'go-mode-hook (lambda ()
                          (load-file "~/.go/src/code.google.com/p/go.tools/cmd/oracle/oracle.el")
                          (go-oracle-mode)))

; PHP mode
(require-package 'php-mode)

; Jinja2 mode
(require-package 'jinja2-mode)
(add-to-list 'auto-mode-alist '("\\.html" . jinja2-mode))
(add-to-list 'auto-mode-alist '("\\.volt" . jinja2-mode))
(add-hook 'sgml-mode-hook (lambda ()
                            (key-chord-define sgml-mode-map "hd" 'sgml-delete-tag)
                            (key-chord-define sgml-mode-map "hf" 'sgml-skip-tag-forward)
                            (key-chord-define sgml-mode-map "hb" 'sgml-skip-tag-backward)
                            ; TODO: Change "//" by "</"
                            (key-chord-define sgml-mode-map "//" 'sgml-close-tag)
                            (key-chord-define jinja2-mode-map "jo" 'jinja2-insert-tag)
                            (key-chord-define jinja2-mode-map "jc" 'my-jinja2-close-tag)
                            (key-chord-define jinja2-mode-map "jv" 'jinja2-var-tag)))


; Key bindings
(global-unset-key (kbd "C-S-p"))
(global-unset-key (kbd "C-+"))

(global-set-key                   (kbd "M-h")   nil)
(global-set-key                   (kbd "M-j")   nil)
(global-set-key                   (kbd "M-k")   nil)
(global-set-key                   (kbd "M-l")   nil)
(global-set-key                   (kbd "M-w")   nil)
(global-set-key                   (kbd "M-b")   nil)
(global-set-key                   (kbd "M-e")   nil)
(global-set-key                   (kbd "M-f")   nil)
(global-set-key                   (kbd "M-r")   nil)
(global-set-key                   (kbd "C-j")   nil)
(define-key evil-insert-state-map (kbd "C-j")   nil)

(global-set-key (kbd "<f5>")         'revert-buffer-no-confirm)
(global-set-key (kbd "C-=")          'er/expand-region)
(global-set-key (kbd "C--")          'er/contract-region)
(global-set-key (kbd "<C-return>")   'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)

(define-key evil-normal-state-map (kbd "w")     'forward-word)
(define-key evil-normal-state-map (kbd "b")     'backward-word)
(define-key evil-normal-state-map (kbd "C-h")   'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j")   'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k")   'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l")   'evil-window-right)
(define-key evil-normal-state-map (kbd "C-S-l") 'evil-window-move-far-right)
(define-key evil-normal-state-map (kbd "C-S-h") 'evil-window-move-far-left)
(define-key evil-normal-state-map (kbd "C-~")   'evil-first-non-blank)

; Try to simulate some motions by Terminal's Alt escape key
(define-key evil-insert-state-map (kbd "M-h")   'escape-backward-char)
(define-key evil-insert-state-map (kbd "M-j")   'escape-next-line)
(define-key evil-insert-state-map (kbd "M-k")   'escape-previous-line)
(define-key evil-insert-state-map (kbd "M-l")   'escape-forward-char)
(define-key evil-insert-state-map (kbd "M-w")   'escape-forward-word)
(define-key evil-insert-state-map (kbd "M-b")   'escape-backward-word)
(define-key evil-insert-state-map (kbd "M-e")   'escape-forward-WORD-end)

(define-key evil-normal-state-map (kbd "M-h")   'evil-backward-char)
(define-key evil-normal-state-map (kbd "M-j")   'evil-next-line)
(define-key evil-normal-state-map (kbd "M-k")   'evil-previous-line)
(define-key evil-normal-state-map (kbd "M-l")   'evil-forward-char)
(define-key evil-normal-state-map (kbd "M-w")   'forward-word)
(define-key evil-normal-state-map (kbd "M-b")   'backward-word)
(define-key evil-normal-state-map (kbd "M-e")   'evil-forward-WORD-end)

; Key chord
(key-chord-define-global ",w" 'delete-other-windows)

(define-key evil-visual-state-map (kbd "y") 'my-evil-yank)

;; Functions

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

(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))

; Try to simulate the "vmap y ygv<Esc>" conf
(evil-define-operator my-evil-yank (beg end type register yank-handler)
                      (interactive "<R><x><y>")
                      (evil-yank beg end type register yank-handler)
                      (run-at-time "000 msec" nil 'evil-visual-restore)
                      (run-at-time "001 msec" nil 'keyboard-quit))

(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(defun escape-backward-char ()
  (interactive)
  (evil-normal-state)
  (evil-backward-char))

(defun escape-next-line ()
  (interactive)
  (evil-normal-state)
  (evil-next-line))

(defun escape-previous-line ()
  (interactive)
  (evil-normal-state)
  (evil-previous-line))

(defun escape-forward-char ()
  (interactive)
  (evil-normal-state)
  (evil-forward-char))

(defun escape-forward-word ()
  (interactive)
  (evil-normal-state)
  (forward-word))

(defun escape-backward-word ()
  (interactive)
  (evil-normal-state)
  (backward-word))

(defun escape-forward-WORD-end ()
  (interactive)
  (evil-normal-state)
  (evil-forward-WORD-end))

(provide 'init-local-config)
