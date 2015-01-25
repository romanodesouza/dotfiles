; Look'n feel
(require-package 'seti-theme)
(load-theme 'seti t)
(set-default-font "DejaVu Sans Mono-14")

; Go
(add-hook 'go-mode-hook 'my-go-mode-settings)

(defun my-go-mode-settings ()
  (load-file "~/.go/src/code.google.com/p/go.tools/cmd/oracle/oracle.el")
  (go-oracle-mode)
  (run-at-time '1s' nil 'disable-go-company-snippets))

(defun disable-go-company-snippets ()
  (set (make-local-variable 'company-backends) '((company-go))))

; PHP
(require-package 'php-mode)

; Jinja2
(require-package 'jinja2-mode)
(add-to-list 'auto-mode-alist '("\\.html" . jinja2-mode))
(add-to-list 'auto-mode-alist '("\\.volt" . jinja2-mode))
(add-hook 'sgml-mode-hook 'setup-sgml-custom-keybinds)

(defun setup-sgml-custom-keybinds ()
  (interactive)
  (evil-define-key 'normal sgml-mode-map (kbd "<SPC> t d") 'sgml-delete-tag)
  (evil-define-key 'normal sgml-mode-map (kbd "<SPC> t f") 'sgml-skip-tag-forward)
  (evil-define-key 'normal sgml-mode-map (kbd "<SPC> t b") 'sgml-skip-tag-backward)
  (evil-define-key 'normal sgml-mode-map (kbd "<SPC> t c") 'sgml-close-tag)

  (evil-define-key 'normal jinja2-mode-map (kbd "<SPC> j o") 'jinja2-insert-tag)
  (evil-define-key 'normal jinja2-mode-map (kbd "<SPC> j c") 'my-jinja2-close-tag))

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

; Key bindings
(global-unset-key (kbd "C-+"))

(global-set-key (kbd "M-h") nil)
(global-set-key (kbd "M-j") nil)
(global-set-key (kbd "M-k") nil)
(global-set-key (kbd "M-l") nil)
(global-set-key (kbd "M-w") nil)
(global-set-key (kbd "M-b") nil)
(global-set-key (kbd "M-e") nil)
(global-set-key (kbd "M-f") nil)
(global-set-key (kbd "M-r") nil)
(global-set-key (kbd "C-j") nil)
(define-key evil-insert-state-map (kbd "C-j") nil)

(global-set-key (kbd "C-=")  'er/expand-region)
(global-set-key (kbd "C--")  'er/contract-region)
(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))

(define-key evil-normal-state-map (kbd "w")     'forward-word)
(define-key evil-normal-state-map (kbd "b")     'backward-word)
(define-key evil-normal-state-map (kbd "C-h")   'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j")   'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k")   'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l")   'evil-window-right)
(define-key evil-normal-state-map (kbd "C-S-l") 'evil-window-move-far-right)
(define-key evil-normal-state-map (kbd "C-S-h") 'evil-window-move-far-left)
(define-key evil-normal-state-map (kbd "C-~")   'evil-first-non-blank)

; Use Emacs search without regex
(define-key evil-normal-state-map (kbd "/") 'isearch-forward)
(define-key evil-normal-state-map (kbd "?") 'isearch-backward)
(define-key evil-normal-state-map (kbd "n") 'isearch-repeat-forward)
(define-key evil-normal-state-map (kbd "p") 'isearch-repeat-backward)
(define-key evil-normal-state-map (kbd "<RET>") 'isearch-exit)
(key-chord-define-global ",h" 'isearch-exit)

; Try to simulate the "vmap y ygv<Esc>" conf
(define-key evil-visual-state-map (kbd "y") 'my-evil-yank)
(evil-define-operator my-evil-yank (beg end type register yank-handler)
                      (interactive "<R><x><y>")
                      (evil-yank beg end type register yank-handler)
                      (run-at-time "000 msec" nil 'evil-visual-restore)
                      (run-at-time "001 msec" nil 'keyboard-quit))

(key-chord-define-global ",w" 'delete-other-windows)

(provide 'init-local-config)
