; Look'n feel
(set-default-font "DejaVu Sans Mono-14")

; Yasnippets
(add-to-list 'yas-snippet-dirs (concat user-emacs-directory "local-config/snippets"))
(yas-reload-all)

; Flycheck
(setq-default flycheck-disabled-checkers '(go-golint))
(add-hook 'after-init-hook #'global-flycheck-mode)

; Auto revert buffer mode
(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

; Clean up trailing whitespaces on save
(require-package 'whitespace-cleanup-mode)
(global-whitespace-cleanup-mode)

; Disable electric pair mode
(electric-pair-mode 0)

; Multiple cursors
(require-package 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-,") 'mc/mark-all-like-this-dwim)
(global-set-key (kbd "C-;") 'mc/mark-more-like-this-extended)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

; Key bindings
(global-set-key (kbd "C-<SPC>") nil)
(define-key evil-insert-state-map (kbd "C-<SPC>") 'evil-normal-state)
(define-key evil-normal-state-map (kbd "w")     'forward-word)
(define-key evil-normal-state-map (kbd "b")     'backward-word)
(define-key evil-normal-state-map (kbd "C-S-l") 'evil-window-move-far-right)
(define-key evil-normal-state-map (kbd "C-S-h") 'evil-window-move-far-left)
(define-key evil-normal-state-map (kbd "C-~")   'evil-first-non-blank)
; Use Emacs search without regex
(define-key evil-motion-state-map (kbd "C-f") 'isearch-forward)
(define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)
(define-key evil-motion-state-map (kbd "/") 'isearch-forward)
(define-key evil-motion-state-map (kbd "?") 'isearch-backward)
(define-key evil-motion-state-map (kbd "n") 'isearch-repeat-forward)
(define-key evil-motion-state-map (kbd "N") 'isearch-repeat-backward)
(define-key evil-motion-state-map (kbd "<RET>") 'clear-highlighted-search)
(key-chord-define-global ",h" 'clear-highlighted-search)
(defun clear-highlighted-search ()
  (interactive)
  (isearch-exit)
  (evil-ex-nohighlight))

; Transpose words
(key-chord-define-global ",t" 'transpose-words)

(provide 'init-local-config)
