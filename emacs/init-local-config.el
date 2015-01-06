; Look'n feel
(require-package 'seti-theme)
(load-theme 'seti t)
(set-default-font "DejaVu Sans Mono-14")

; Key bindings
(global-unset-key (kbd "C-S-p"))
(global-unset-key (kbd "C-+"))
(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)

(define-key evil-normal-state-map (kbd ";")     'evil-ex)
(define-key evil-normal-state-map (kbd "w")     'forward-word)
(define-key evil-normal-state-map (kbd "b")     'backward-word)
(define-key evil-normal-state-map (kbd "U")     'undo-tree-redo)
(define-key evil-normal-state-map (kbd "/")     'helm-swoop)
(define-key evil-normal-state-map (kbd "C-r")   'helm-semantic-or-imenu)
(define-key evil-insert-state-map (kbd "C-r")   'helm-semantic-or-imenu)
(define-key evil-normal-state-map (kbd "C-l")   'evil-repeat-find-char)
(define-key evil-normal-state-map (kbd "C-h")   'evil-repeat-find-char-reverse)
(define-key evil-insert-state-map (kbd "C-SPC") 'evil-delete-backward-word)
(define-key evil-insert-state-map (kbd "C-d")   'kill-word)
(define-key evil-normal-state-map (kbd "C-j")   'evil-visual-line-down)
(define-key evil-normal-state-map (kbd "C-k")   'evil-visual-line-up)
(define-key evil-normal-state-map (kbd "C-d")   'gcm-scroll-down)
(define-key evil-normal-state-map (kbd "C-u")   'gcm-scroll-up)
(define-key evil-normal-state-map (kbd "C-S-l") 'evil-window-move-far-right)
(define-key evil-normal-state-map (kbd "C-S-h") 'evil-window-move-far-left)
(define-key evil-insert-state-map (kbd "C-{")   'evil-normal-state)
(define-key evil-normal-state-map (kbd "C-~")   'evil-first-non-blank)

(key-chord-define evil-insert-state-map "oo" 'evil-open-below)
(key-chord-define evil-insert-state-map "OO" 'evil-open-above)
(key-chord-define-global ",a" 'ag-project-regexp)

; Jinja2 mode
(require-package 'jinja2-mode)
(add-to-list 'auto-mode-alist '("\\.html" . jinja2-mode))
(add-hook 'sgml-mode-hook (lambda ()
                            (key-chord-define sgml-mode-map "hd" 'sgml-delete-tag)
                            (key-chord-define sgml-mode-map "hf" 'sgml-skip-tag-forward)
                            (key-chord-define sgml-mode-map "hb" 'sgml-skip-tag-backward)
                            ; TODO: Change "//" by "</"
                            (key-chord-define sgml-mode-map "//" 'sgml-close-tag)
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

; Scroll down 1 line
(defun gcm-scroll-down ()
  (interactive)
  (scroll-up 1))

; Scroll up 1 line
(defun gcm-scroll-up ()
  (interactive)
  (scroll-down 1))

(defun evil-visual-line-down ()
  (interactive)
  (evil-visual-line)
  (evil-next-line))

(defun evil-visual-line-up ()
  (interactive)
  (evil-visual-line)
  (evil-previous-line))

(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))

(provide 'init-local-config)
