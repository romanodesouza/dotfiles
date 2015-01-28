; Look'n feel
(require-package 'seti-theme)
(load-theme 'seti t)
(set-default-font "DejaVu Sans Mono-14")

; Yasnippets
(add-to-list 'yas-snippet-dirs (concat user-emacs-directory "local-config/snippets"))
(yas-reload-all)

; Auto revert buffer mode
(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

; Multiple cursors
(require-package 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-,") 'mc/mark-all-like-this-dwim)
(global-set-key (kbd "C-;") 'mc/mark-more-like-this-extended)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

; Go
(add-hook 'go-mode-hook 'my-go-mode-settings)

(defun my-go-mode-settings ()
  (run-at-time '1s' nil 'disable-go-company-snippets))

(defun disable-go-company-snippets ()
  (set (make-local-variable 'company-backends) '((company-go))))

; Key bindings
(global-set-key (kbd "C-<SPC>") nil)
(define-key evil-insert-state-map (kbd "C-<SPC>") 'evil-normal-state)

(global-set-key (kbd "C-j") nil)
(define-key evil-insert-state-map (kbd "C-j") nil)

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
(evil-define-key 'motion global-map (kbd ",f") 'isearch-forward)
(define-key isearch-mode-map "\C-n" 'isearch-repeat-forward)
(define-key isearch-mode-map "\C-p" 'isearch-repeat-backward)
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
; Helm swoop
(key-chord-define-global ",d" 'helm-swoop)
; imenu
(key-chord-define-global ",r" 'helm-semantic-or-imenu)
; visual line
(key-chord-define-global ",v" 'evil-visual-line)
; vertical split
(evil-define-key 'normal global-map (kbd ",vs") 'evil-window-vsplit)

(provide 'init-local-config)
