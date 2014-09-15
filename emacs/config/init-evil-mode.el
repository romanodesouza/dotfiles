(require-package 'evil)
(require-package 'evil-nerd-commenter)

; Config
(setq evil-search-module 'evil-search)
; Enable evil mode
(evil-mode t)
; Key bindings
(define-key evil-insert-state-map (kbd "C-l") 'forward-char)
(define-key evil-insert-state-map (kbd "C-h") 'backward-char)
(define-key evil-insert-state-map (kbd "C-j") 'forward-line)
(define-key evil-insert-state-map (kbd "C-k") 'ibuffer-backward-line)
(define-key evil-insert-state-map (kbd "C-a") 'back-to-indentation)
(define-key evil-insert-state-map (kbd "C-e") 'end-of-line)
(define-key evil-insert-state-map (kbd "C-d") 'delete-char)
; Enable evil-nerd-commenter
(evilnc-default-hotkeys)

(provide 'init-evil-mode)
