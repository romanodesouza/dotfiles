;;; init.el --- My Emacs config
;;; Author: Romano Augusto
;;; License: MIT
;;
;; Garbage collection
(setq gc-cons-threshold 50000000)
;; TLS prime bits
(setq gnutls-min-prime-bits 4096)
;; Enable deletion of selected text
(delete-selection-mode t)
;; CUA mode
(cua-mode t)
;; Disable backup
(setq-default make-backup-files nil)
;; Disable auto saving
(setq auto-save-default nil)
;; Default indentation
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default tab-always-indent 'complete)
;; Show full path of file in title bar
(setq-default frame-title-format "%b (%f)")
;; Open buffers always on bottom
(setq split-height-threshold nil)
(setq split-width-threshold most-positive-fixnum)
;; Don't show me the startup screen
(setq inhibit-startup-screen t)
;; Empty initial message
(setq initial-scratch-message "")
;; Show column number in mode line
(setq column-number-mode t)
;; Don't ring at error
(setq ring-bell-function 'ignore)
(setq visible-bell 'top-bottom)
;; Disable menu bar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;; Disable tool bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; Disable scroll bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; Aliases
(defalias 'yes-or-no-p 'y-or-n-p)
;; imenu
(setq-default imenu-auto-rescan t)
;; Parens mode
(show-paren-mode t)
(setq show-paren-delay 0)
;; Uniquify style
(setq uniquify-buffer-name-style 'forward)
;; Strip trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; Line spacing
(setq-default line-spacing 3)
;; Font
(defvar my/font "Liberation Mono 14")
(set-face-attribute 'default nil :font my/font)
(set-frame-font my/font nil t)
;; Set key bindings
(add-hook 'after-init-hook 'my/key-bindings)
;; FZF
(add-hook 'after-init-hook 'my/fzf-init)

;; Packages
(require 'package)
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)
(require 'use-package)

(use-package solarized-theme
  :init (load-theme 'solarized-light t))

(use-package powerline
  :init (powerline-default-theme))

(use-package smooth-scrolling
  :init (add-hook 'after-init-hook 'smooth-scrolling-mode)
  :config (setq smooth-scroll-margin 12))

(use-package saveplace
   :init
   (setq-default save-place t)
   (setq save-place-forget-unreadable-files t
         save-place-skip-check-regexp "\\`/\\(?:cdrom\\|floppy\\|mnt\\|/[0-9]\\|\\(?:[^@/:]*@\\)?[^@/:]*[^@/:.]:\\)"))

(use-package smex
  :init (smex-initialize)
  :bind ("M-x" . smex))

(use-package which-key
  :init
  (setq which-key-idle-delay 0.5)
  (add-hook 'after-init-hook 'which-key-mode))

(use-package aggressive-indent
  :init (add-hook 'prog-mode-hook 'global-aggressive-indent-mode))

(use-package key-chord
  :init
  (setq key-chord-two-keys-delay .085
        key-chord-one-key-delay .090)
  (add-hook 'after-init-hook (lambda () (key-chord-mode t)))
  :config
  (key-chord-define-global " o" 'my/fzf)
  (key-chord-define-global " r" 'avy-goto-char-timer)
  (key-chord-define-global " s" 'avy-goto-char-timer)
  (key-chord-define-global ",b" 'ido-switch-buffer)
  (key-chord-define-global ",s" 'save-buffer)
  (key-chord-define-global ",v" 'split-window-horizontally)
  (key-chord-define-global ",q" 'my/delete-window-maybe-kill-buffer)
  (key-chord-define-global ",w" 'delete-other-windows)
  (key-chord-define-global ",c" 'comment-dwim)
  (key-chord-define-global ",d" 'idomenu)
  (key-chord-define-global ",a" 'my/fzf-git-grep))

(use-package ido
  :commands ido-switch-buffer
  :init (setq ido-enable-flex-matching t
              ido-ignore-extensions t
              ido-use-virtual-buffers t
              ido-ignore-buffers '("\\` " "^\*")
              ido-everywhere t)
  :config
  (ido-mode t)
  (ido-everywhere t)

  (use-package flx-ido
    :init (setq ido-enable-flex-matching t
                ido-use-faces nil)
    :config (flx-ido-mode t))

  (use-package ido-vertical-mode
    :init (setq ido-vertical-define-keys 'C-n-C-p-up-and-down)
    :config  (ido-vertical-mode t))

  (use-package ido-ubiquitous
    :config (ido-ubiquitous-mode t))

  (use-package idomenu
    :commands idomenu))

(use-package avy
  :commands avy-goto-char-timer
  :init (setq avy-background t))

(use-package expand-region
  :bind
  ("C-=" . er/expand-region)
  ("C--" . er/contract-region))

(use-package multiple-cursors
  :bind ("M-n" . mc/mark-more-like-this-extended)
  :config (define-key mc/mark-more-like-this-extended-keymap (kbd "M-n") 'mc/mmlte--down))

(use-package company
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1
        company-tooltip-limit 20
        company-dabbrev-ignore-case t
        company-dabbrev-downcase nil
        company-backends '(company-elisp company-dabbrev company-dabbrev-code company-file))
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(use-package flycheck
  :init (add-hook 'after-init-hook 'global-flycheck-mode)
  :config
  (global-set-key (kbd "C-c C-n") 'my/next-error)
  (global-set-key (kbd "C-c C-l") 'flycheck-list-errors)
  ;;(add-hook 'flycheck-after-syntax-check-hook 'my/flycheck-list-errors-only-when-errors)
  (setq flycheck-check-syntax-automatically '(save))
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(use-package highlight-indent-guides
  :init
  (setq highlight-indent-guides-method 'character)
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode))

(use-package go-mode
  :init
  (setq company-go-insert-arguments t
        gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq go-mode-hook (lambda ()
                       (setq imenu-generic-expression
                             '((nil "func *\\(.*\\) {" 1)))
                       (go-eldoc-setup)
                       (add-to-list 'company-backends 'company-go)))
  :config
  (use-package company-go)
  (use-package go-eldoc))

;; Functions
(defun my/key-bindings ()
  ;; C-h erases previous character
  (global-set-key (kbd "C-h") 'delete-backward-char)
  (define-key isearch-mode-map (kbd "C-h") 'isearch-del-char)
  (global-set-key (kbd "RET") 'my/open-line-below)
  (global-set-key (kbd "C-o") 'my/open-line-above))

(defun my/open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun my/open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(defun projectile-project-root ()
  (or (locate-dominating-file default-directory ".git")
      (default-directory)))

(defun my/flycheck-list-errors-only-when-errors ()
  (if flycheck-current-errors
      (flycheck-list-errors)
    (-when-let (buffer (get-bufferflycheck-error-list-buffer))
      (dolist (window (get-buffer-window-list buffer))
        (quit-window nil window)))))

(defun my/next-error ()
  (interactive)
  (condition-case nil (next-error)
    (error (next-error 1 t))))

(defun my/delete-window-maybe-kill-buffer ()
  (interactive)
  (when (eq 1 (length (get-buffer-window-list)))
    (kill-this-buffer))
  (delete-window))

(defun my/fzf-init ()

  (defun my/fzf-after-term-handle-exit (process-name msg)
    (let* ((text (buffer-substring-no-properties (point-min) (point-max)))
           (lines (split-string text "\n" t "\s.*\s"))
           (line (car (last (butlast lines 1))))
           (splitted (split-string line ":"))
           (target (pop splitted))
           (linenumber (pop splitted))
           (file (expand-file-name target)))
      (jump-to-register :fzf-windows)
      (when (file-exists-p file)
        (find-file file)
        (when linenumber
          (goto-line (string-to-number linenumber)))))
    (advice-remove 'term-handle-exit #'my/fzf-after-term-handle-exit))

  (defun my/fzf-run (cmd)
    (window-configuration-to-register :fzf-windows)
    (advice-add 'term-handle-exit :after #'my/fzf-after-term-handle-exit)
    (split-window-vertically)
    (other-window 1)
    (let ((buffer (make-term "*fzf*" "sh" nil "-c" (concat (when cmd (concat cmd " | ")) "fzf -x --margin 1,0"))))
      (set-buffer buffer)
      (setq-local default-directory (projectile-project-root))
      (term-mode)
      (term-char-mode)
      (switch-to-buffer buffer)))

  (defun my/fzf ()
    (interactive)
    (my/fzf-run nil))

  (defun my/fzf-git-grep ()
    (interactive)
    (my/fzf-run (concat "git grep --line-number "
                        (if (region-active-p)
                            (buffer-substring-no-properties (region-beginning) (region-end))
                          (call-interactively (lambda (input)
                                                (interactive "sgit grep: ")
                                                input))
                          )
                        " -- './*' '!vendor/' '!node_modules/'"
                        )
                )
    )
  )

;;; init.el ends here
