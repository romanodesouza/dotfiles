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
;; Disable backup
(setq make-backup-files nil)
;; Disable lockfiles
(setq create-lockfiles nil)
;; Disable auto saving
(setq auto-save-default nil)
;; Always follow vc symlinks
(setq vc-follow-symlinks t)
;; Reload file disk changed automatically
(global-auto-revert-mode t)
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
(defvar my/font "Liberation Mono 12")
(set-face-attribute 'default nil :font my/font)
(set-frame-font my/font nil t)
;; Set key bindings
(add-hook 'after-init-hook 'my/key-bindings)

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

;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

;; fzf fork
(el-get-bundle fzf
  :url "git@github.com:romanoaugusto88/fzf.el.git"
  :features fzf
  (setq fzf/args "-x --margin 1,0")
  (add-hook 'term-mode-hook 'my-term-mode-hook)
  (defun my-term-mode-hook ()
    ;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=20611
    (setq bidi-paragraph-direction 'left-to-right)))

;;(use-package darcula-theme)
(use-package dracula-theme
  :config (load-theme 'dracula t))

(use-package powerline
  :init (powerline-default-theme))

(use-package smooth-scrolling
  :init (add-hook 'after-init-hook 'smooth-scrolling-mode)
  :config (setq smooth-scroll-margin 10))

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

(use-package evil
  :init (setq evil-magic 'very-magic
              evil-want-C-u-scroll t)
  :config
  (evil-mode t)
  (evil-set-initial-state 'term-mode 'emacs)
  (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
  (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-motion-state-map (kbd "C-]") nil)
  (define-key evil-motion-state-map (kbd "K") nil)
  (define-key evil-insert-state-map (kbd "C-d") 'delete-char)
  (define-key evil-insert-state-map (kbd "C-e") 'end-of-line)
  (define-key evil-motion-state-map (kbd "C-e") 'end-of-line)
  (define-key evil-motion-state-map (kbd "j") (kbd "gj"))
  (define-key evil-motion-state-map (kbd "k") (kbd "gk"))

  (use-package evil-leader
    :config
    (global-evil-leader-mode)
    (fset 'evil-visual-update-x-selection 'ignore)
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key
     "o" 'fzf
     "r" 'isearch-backward
     "s" 'isearch-forward
     "en" 'my/next-error))

  (use-package evil-visualstar
    :config (global-evil-visualstar-mode t))
  (use-package evil-matchit
    :config (global-evil-matchit-mode t)))

(use-package key-chord
  :init (add-hook 'after-init-hook (lambda () (key-chord-mode t)))
  :config
  (key-chord-define-global ",b" 'ido-switch-buffer)
  (key-chord-define-global ",s" 'my/save-buffers-and-goes-to-normal-mode)
  (key-chord-define-global ",v" 'split-window-horizontally)
  (key-chord-define-global ",q" 'my/delete-window-maybe-kill-buffer)
  (key-chord-define-global ",w" 'delete-other-windows)
  (key-chord-define-global ",c" 'comment-dwim)
  (key-chord-define-global ",d" 'idomenu)
  (key-chord-define-global ",a" 'fzf-git-grep)
  (key-chord-define-global ",e" 'end-of-line)
  (key-chord-define-global "fd" 'evil-normal-state)

  (add-hook 'minibuffer-setup-hook #'disable-key-chord-mode))

(use-package ido
  :commands ido-switch-buffer
  :init (setq ido-enable-flex-matching t
              ido-ignore-extensions t
              ido-use-virtual-buffers nil
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
  :commands avy-isearch
  :init
  (setq avy-background t)
  (define-key isearch-mode-map (kbd "C-o") 'avy-isearch))

(use-package expand-region
  :commands (er/expand-region)
  :init (define-key evil-visual-state-map (kbd "v") 'er/expand-region))

(use-package multiple-cursors
  :bind ("M-n" . mc/mark-more-like-this-extended)
  :config (define-key mc/mark-more-like-this-extended-keymap (kbd "M-n") 'mc/mmlte--down))

(use-package company
  :commands (global-company-mode)
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1
        company-tooltip-limit 20
        company-echo-delay 0
        company-begin-commands '(self-insert-command)
        company-backends '(company-elisp company-file))
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(use-package yasnippet
  :commands (yas-global-mode yas-minor-mode)
  :init (add-hook 'prog-mode-hook 'yas-global-mode))

(use-package magit
  :commands (magit-status)
  :init (evil-leader/set-key
          "gs" 'magit-status
          "gl" 'magit-log-head))

(use-package highlight-indent-guides
  :init
  (setq highlight-indent-guides-method 'character)
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode))

(use-package project-explorer
  :commands (project-explorer-open project-explorer-toggle)
  :init
  (setq pe/project-root-function 'projectile-project-root
        pe/width 30
        pe/follow-current t)
  (evil-leader/set-key
    "x" 'project-explorer-toggle)
  :config
  (evil-define-key 'normal project-explorer-mode-map (kbd "o") 'pe/return)
  (evil-define-key 'normal project-explorer-mode-map (kbd "c") 'pe/create-file)
  (evil-define-key 'normal project-explorer-mode-map (kbd "d") 'pe/delete-file))

(use-package pomodoro
  :init (add-hook 'after-init-hook 'pomodoro-add-to-mode-line)
  :config (evil-leader/set-key
            "ps" 'pomodoro-start
            "pp" 'pomodoro-pause
            "pr" 'pomodoro-resume))

(use-package git-timemachine
  :commands (git-timemachine)
  :init
  (add-hook 'git-timemachine-mode-hook #'evil-normalize-keymaps)
  (evil-leader/set-key
    "gt" 'git-timemachine)
  :config
  (evil-define-key 'normal git-timemachine-mode-map (kbd "p") 'git-timemachine-show-previous-revision)
  (evil-define-key 'normal git-timemachine-mode-map (kbd "n") 'git-timemachine-show-next-revision)
  (evil-define-key 'normal git-timemachine-mode-map (kbd "q") 'git-timemachine-quit))

(use-package editorconfig
  :config (editorconfig-mode t))

;; Programming modes
;; Go
(use-package go-mode
  :mode "\\.go$"
  :init
  (setq company-go-insert-arguments t
        gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq go-mode-hook (lambda ()
                       (evil-define-key 'normal go-mode-map (kbd "C-]") 'godef-jump)
                       (evil-define-key 'normal go-mode-map (kbd "K") 'godef-describe)
                       (setq imenu-generic-expression '((nil "func *\\(.*\\) {" 1)))
                       (go-eldoc-setup)
                       (set (make-local-variable 'company-backends) '((company-files company-go company-yasnippet)))))
  :config
  (use-package company-go)
  (use-package go-eldoc))

;; Javascript
(use-package js2-mode
  :mode "\\.jsx?$"
  :config
  (setq js-indent-level 2)
  (setq-default js2-basic-offset 2)
  (use-package eslint-fix)
  (add-hook 'js2-mode-hook (lambda ()
                             (js2-imenu-extras-mode)
                             (add-hook 'after-save-hook 'eslint-fix nil t)
                             (set (make-local-variable 'company-backends) '((company-files company-yasnippet))))))

;; React
(use-package rjsx-mode
  :commands (rjsx-mode)
  :init (add-to-list 'magic-mode-alist '("^import React" . rjsx-mode))
  :config
  (add-hook 'rjsx-mode-hook (lambda ()
                              (yas-activate-extra-mode 'js2-mode)
                              (use-package emmet-mode
                                :init
                                (setq-local emmet-expand-jsx-className? t)
                                (emmet-mode)
                                (local-set-key (kbd "TAB") 'emmet-expand-yas)))))

;; Programming related modes
(use-package yaml-mode
  :mode "\\.ya?ml$")

(use-package dockerfile-mode
  :mode "Dockerfile")

(use-package nginx-mode
  :commands (nginx-mode)
  :init (add-to-list 'auto-mode-alist '("/nginx" . nginx-mode)))

(use-package crontab-mode
  :commands (crontab-mode)
  :init (add-to-list 'auto-mode-alist '("/cron" . crontab-mode)))

;; Functions
(defun my/key-bindings ()
  ;; C-h erases previous character
  (global-set-key (kbd "C-h") 'delete-backward-char)
  (define-key isearch-mode-map (kbd "C-h") 'isearch-del-char)
  (global-set-key (kbd "<C-return>") 'my/open-line-below)
  (global-set-key (kbd "<S-return>") 'my/open-line-above)
  (global-set-key (kbd "s-k") 'evil-scroll-line-up)
  (global-set-key (kbd "s-j") 'evil-scroll-line-down))

(defun my/save-buffers-and-goes-to-normal-mode ()
  (interactive)
  (save-some-buffers 'no-confirm)
  (message "buffers has been saved")
  (evil-normal-state))

(defun disable-key-chord-mode ()
  (set (make-local-variable 'input-method-function) nil))

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
      default-directory))

(defun my/next-error ()
  (interactive)
  (condition-case nil (next-error)
    (error (next-error 1 t))))

(defun my/delete-window-maybe-kill-buffer ()
  (interactive)
  (when (eq 1 (length (get-buffer-window-list)))
    (kill-this-buffer))
  (delete-window))


;;; init.el ends here
