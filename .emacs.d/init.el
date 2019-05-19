;;; init.el --- My Emacs config
;; Code:
(setq
 ;; Garbage collection
 gc-cons-threshold 50000000
 ;; TLS prime bits
 gnutls-min-prime-bits 4096
 ;; Disable backup
 make-backup-files nil
 ;; Disable lockfiles
 create-lockfiles nil
 ;; Disable auto saving
 auto-save-default nil
 ;; Always follow vc symlinks
 vc-follow-symlinks t
 ;; Don't show me the startup screen
 inhibit-startup-screen t
 ;; Empty initial message
 initial-scratch-message ""
 ;; Show column number in mode line
 column-number-mode t
 ;; Don't ring at error
 ring-bell-function 'ignore
 visible-bell 'top-bottom
 ;; paren delay
 show-paren-delay 0
 ;; Uniquify style
 uniquify-buffer-name-style 'forward
 ;; Compiliation-mode settings
 compilation-scroll-output 'first-error
 compilation-always-kill t
 compilation-error-regexp-alist nil
 compilation-error-regexp-alist-alist nil
 special-display-buffer-names
 `(("*compilation*" . ((name . "*compilation*")
                       ,@default-frame-alist
                       (left . (- 1))
                       (top . 0))))
 ;; Open buffers always on bottom
 split-height-threshold nil
 split-width-threshold most-positive-fixnum
 ;; Safe local variables
 enable-local-variables ':all
 ;; Warning suppress list
 warning-suppress-types nil
 ;; Custom file
 custom-file "~/.emacs.d/custom.el")

(setq-default
 ;; Default indentation
 tab-width 4
 indent-tabs-mode nil
 tab-always-indent 'complete
 ;; Show full path of file in title bar
 frame-title-format "%b (%f)"
 ;; imenu
 imenu-auto-rescan t
 ;; Line spacing
 line-spacing 3)

;; Enable deletion of selected text
(delete-selection-mode t)
;; Reload file disk changed automatically
(global-auto-revert-mode t)
;; Disable menu bar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;; Disable tool bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; Disable scroll bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; Shorter yes or no
(defalias 'yes-or-no-p 'y-or-n-p)
;; Parens mode
(show-paren-mode t)
;; Strip trailing whitespaces before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; Font
(let ((font "Liberation Mono 11"))
  (set-face-attribute 'default nil :font font)
  (set-frame-font font nil t))

;; my/init
(add-hook 'after-init-hook 'my/init)

;; Packages
(require 'package)
(setq package-archives '(("org" . "https://orgmode.org/elpa/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)
(setq package-pinned-packages
  '(
	;; gnu
    (mmm-mode . "gnu")
  	;; melpa
  	(leuven-theme . "melpa")
    (cfml-mode . "melpa")
    (multi-compile . "melpa")
    ;; melpa-stable
    (saveplace . "melpa-stable")
    (smooth-scrolling . "melpa-stable")
    (which-key . "melpa-stable")
    (smex . "melpa-stable")
    (ido . "melpa-stable")
    (flx-ido . "melpa-stable")
    (ido-vertical-mode . "melpa-stable")
    (ido-completing-read+ . "melpa-stable")
    (idomenu . "melpa-stable")
    (imenus . "melpa-stable")
    (evil . "melpa-stable")
    (evil-leader . "melpa-stable")
    (evil-visualstar . "melpa-stable")
    (evil-matchit . "melpa-stable")
    (expand-region . "melpa-stable")
    (key-chord . "melpa-stable")
    (key-seq . "melpa-stable")
    (company . "melpa-stable")
    (yasnippet . "melpa-stable")
    (smartparens . "melpa-stable")
    (ranger . "melpa-stable")
    (git-timemachine . "melpa-stable")
    (multiple-cursors . "melpa-stable")
    (go-mode . "melpa-stable")
    (company-go . "melpa-stable")
    (go-rename . "melpa-stable")
    (go-eldoc . "melpa-stable")
    (go-tag . "melpa-stable")
    (go-guru . "melpa-stable")
    (js2-mode . "melpa-stable")
    (eslint-fix . "melpa-stable")
    (coffee-mode . "melpa-stable")
    (rjsx-mode . "melpa-stable")
    (emmet-mode . "melpa-stable")
    (yaml-mode . "melpa-stable")
    (dockerfile-mode . "melpa-stable")
    (editorconfig . "melpa-stable")))

(require 'use-package)

;; fzf fork
(use-package fzf
  :load-path "vendor/fzf.el"
  :commands (fzf fzf-git-grep fzf-rg)
  :init
  (setq fzf/args "-x -e --print-query")
  (setq fzf/git-grep-args "-i --line-number %s -- './*' '!vendor/' '!node_modules/'")
  (setq fzf/rg-args "--trim --hidden -n -S -g '!vendor/' -g '!node_modules/' -g '!.git/' %s"))

;;(use-package darktooth-theme
  ;;:config (load-theme 'darktooth t))

;;(use-package apropospriate-theme
;;  :config (load-theme 'apropospriate-light t))

(use-package leuven-theme
  :config (load-theme 'leuven t))

(use-package saveplace
  :init
  (setq-default save-place t)
  (setq save-place-forget-unreadable-files t
        save-place-skip-check-regexp "\\`/\\(?:cdrom\\|floppy\\|mnt\\|/[0-9]\\|\\(?:[^@/:]*@\\)?[^@/:]*[^@/:.]:\\)"))

(use-package smooth-scrolling
  :init (add-hook 'after-init-hook 'smooth-scrolling-mode)
  :config (setq smooth-scroll-margin 10))

(use-package which-key
  :init
  (setq which-key-idle-delay 0.5)
  (add-hook 'after-init-hook 'which-key-mode))

(use-package smex
  :init (add-hook 'after-init-hook 'smex-initialize)
  :bind ("M-x" . smex))

(use-package ido
  :commands ido-switch-buffer
  :init (setq ido-enable-flex-matching t
              ido-ignore-extensions t
              ido-use-virtual-buffers nil
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

  (use-package ido-completing-read+
    :config (ido-ubiquitous-mode t))

  (use-package idomenu
    :commands idomenu)

  (use-package imenus
    :commands imenus))

(use-package evil
  :init (setq evil-magic 'very-magic
              evil-want-C-u-scroll t)
  :config
  ;; enable evil compatibility on compilation-mode
  (add-hook 'compilation-mode-hook
            (lambda()
              (local-unset-key (kbd "g"))
              (local-unset-key (kbd "h"))
              (local-unset-key (kbd "-"))
              (local-unset-key (kbd "?"))
              (local-unset-key (kbd "0"))))

  ;; goes to normal mode after saving bufers
  (advice-add 'my/save-buffers :after #'evil-normal-state)
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
      "p" 'my/select-project
      "r" 'evil-search-backward
      "s" 'evil-search-forward
      "k" 'kill-buffer
      "en" 'my/next-error
      "gh" 'vc-region-history))

  (use-package evil-visualstar
    :config (global-evil-visualstar-mode t))

  (use-package evil-matchit
    :config (global-evil-matchit-mode t)))

(use-package expand-region
  :commands (er/expand-region er/contract-region)
  :init
  (define-key evil-visual-state-map (kbd "v") 'er/expand-region)
  (define-key evil-visual-state-map (kbd "V") 'er/contract-region))

(use-package key-chord
  :init (add-hook 'after-init-hook (lambda () (key-chord-mode t)))
  :config
  (use-package key-seq
    :config
    (key-seq-define-global ",b" 'ido-switch-buffer)
    (key-seq-define-global ",s" 'my/save-buffers)
    (key-seq-define-global ",v" 'split-window-horizontally)
    (key-seq-define-global ",q" 'my/kill-or-close)
    (key-seq-define-global ",w" 'delete-other-windows)
    (key-seq-define-global ",c" 'comment-dwim)
    (key-seq-define-global ",e" 'end-of-line)
    (key-seq-define-global "fd" 'evil-normal-state)
    (key-seq-define-global ",a" 'fzf-rg)
    (key-seq-define-global ",d" 'imenus)

    (add-hook 'minibuffer-setup-hook #'my/disable-key-chord-mode)))

(use-package company
  :commands (global-company-mode)
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1
        company-tooltip-limit 20
        company-tooltip-align-annotations t
        company-echo-delay 0
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case t
        company-global-modes '(not gud-mode)
        company-begin-commands '(self-insert-command)
        company-transformers '(company-sort-by-backend-importance)
        company-backends '(company-elisp company-files company-dabbrev))
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(use-package yasnippet
  :commands (yas-global-mode yas-minor-mode)
  :init (add-hook 'prog-mode-hook 'yas-global-mode)
  :config
  (setq yas-snippet-dirs (remq 'yas-installed-snippets-dir yas-snippet-dirs))
  (add-to-list 'warning-suppress-types '(yasnippet backquote-change)))

(use-package smartparens
  :commands (smartparens-mode)
  :init
  (add-hook 'prog-mode-hook 'smartparens-mode)
  (evil-leader/set-key "l" 'sp-slurp-hybrid-sexp)
  :config
  (sp-local-pair 'prog-mode "{" nil :post-handlers '((my/create-newline-and-enter-sexp "RET")))
  (sp-local-pair 'prog-mode "'" nil :actions nil)
  (sp-local-pair 'prog-mode "\"" nil :actions nil))

(use-package multi-compile
  :commands (multi-compile-run)
  :init
  (evil-leader/set-key "c" 'multi-compile-run)
  (setq multi-compile-alist '((go-mode . (("go install" . "go generate && go install -race")
                                          ("go lint" . "go generate && golint -set_exit_status && go vet && megacheck && errcheck")
                                          ("go test" . "go generate && go test -v -race -coverprofile=/tmp/coverage.out")))))
  :config
  (advice-add 'compilation-start :before (lambda (command &rest args) (setq compile-command command))))

(use-package ranger
  :commands ranger
  :init (evil-leader/set-key
          "x" 'ranger))

(use-package git-timemachine
  :init (evil-leader/set-key "gt" 'git-timemachine)
  :config
  (evil-define-minor-mode-key 'normal 'git-timemachine-mode
    "p" 'git-timemachine-show-previous-revision
    "n" 'git-timemachine-show-next-revision
    "q" 'git-timemachine-quit))

(use-package multiple-cursors
  :commands (mc/mark-next-like-this mc/mark-previous-like-this mc/skip-to-next-like-this)
  :init
	(define-key evil-visual-state-map (kbd "C-n") 'mc/mark-next-like-this)
    (define-key evil-visual-state-map (kbd "C-p") 'mc/mark-previous-like-this)
    (define-key evil-visual-state-map (kbd "C-s") 'mc/skip-to-next-like-this))

;; Go
(use-package go-mode
  :mode "\\.go$"
  :init
  (setq company-go-show-annotation t
        company-go-insert-arguments t
        gofmt-command "goimports"
        go--coverage-current-file-name "/tmp/coverage.out")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq go-mode-hook (lambda ()
                       (evil-define-key 'normal go-mode-map (kbd "C-]") 'godef-jump)
                       (evil-define-key 'normal go-mode-map (kbd "K") 'godef-describe)
                       (go-eldoc-setup)
                       (let ((name 'go)
                             (pattern (concat "\\([^\n\t\s:]+\\.go\\):\\([0-9]+\\)")))
                         (add-to-list 'compilation-error-regexp-alist name)
                         (add-to-list 'compilation-error-regexp-alist-alist (list name pattern 1 2) t))
                       (set (make-local-variable 'company-backends) '((company-go :with company-yasnippet)))))
  :config
  (use-package company-go
    :init (setq company-go-insert-arguments nil))
  (use-package go-rename
    :commands (go-rename)
    :init (key-seq-define go-mode-map ",r" 'go-rename))
  (use-package go-eldoc)
  (use-package go-tag)
  (use-package go-guru))

;; Javascript
(use-package js2-mode
  :mode "\\.jsx?$"
  :config
  (setq js-indent-level 2
        js2-strict-missing-semi-warning nil
        js2-strict-trailing-comma-warning nil)
  (setq-default js2-basic-offset 2)
  (use-package eslint-fix)
  (add-hook 'js2-mode-hook (lambda ()
                             (js2-imenu-extras-mode)
                             (add-hook 'after-save-hook 'eslint-fix nil t)
                             (add-hook 'company-completion-finished-hook #'(lambda (candidate)
                                                                             (when (derived-mode-p 'js2-mode)
                                                                               (when (string-suffix-p ".js" candidate)
                                                                                 (delete-backward-char 3)))))
                             (set (make-local-variable 'company-backends) '((company-files company-yasnippet))))))

;; Coffee
(use-package coffee-mode)

;; Coldfusion
(use-package cfml-mode
  :init
  (add-to-list 'magic-mode-alist '("<cfcomponent" . cftag-mode))
  (add-to-list 'magic-mode-alist '("<!---" . cftag-mode))
  (add-to-list 'auto-mode-alist '("\\.cfm\\'" . cftag-mode))
  (add-to-list 'auto-mode-alist '("\\.cfc\\'" . cfml-cfscript-mode))
  :config
  (use-package mmm-mode
    :init
    (setq mmm-global-mode 'maybe)
    (mmm-add-mode-ext-class nil "\\.cfm\\'" 'cfml-cftag)
    (mmm-add-mode-ext-class nil "\\.cfc\\'" 'cfml-cftag)
    (mmm-add-mode-ext-class nil "\\.cfm\\'" 'cfml-js)))

;; React
(use-package rjsx-mode
  :commands (rjsx-mode)
  :init (add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*import React" . rjsx-mode))
  :config
  (add-hook 'rjsx-mode-hook (lambda ()
                              (evil-define-key 'insert rjsx-mode-map (kbd "C-d") 'rjsx-delete-creates-full-tag)
                              (yas-activate-extra-mode 'js2-mode)
                              (use-package emmet-mode
                                :init
                                (setq-local emmet-expand-jsx-className? t)
                                (emmet-mode)
                                (local-set-key (kbd "TAB") 'emmet-expand-yas)))))

;; Yaml
(use-package yaml-mode
  :mode "\\.ya?ml$")

;; Dockerfile
(use-package dockerfile-mode
  :mode "Dockerfile")

;; Editor config
(use-package editorconfig)

;; Functions
(defun my/init ()
  ;; Reset threshold to its default after Emacs has startup, because a large
  ;; GC threshold equates to longer delays whenever GC happens
  (add-hook 'emacs-startup-hook 'my/set-gc-threshold)
  (add-hook 'emacs-lisp-mode-hook 'remove-elc-on-save)
  ;; Auto recompile if compilation window is visible
  (advice-add 'my/save-buffers :after (lambda () (when (get-buffer "*compilation*") (recompile))))
  ;;(add-hook 'prog-mode-hook 'linum-mode)
  (load custom-file))

(defun my/save-buffers ()
  (interactive)
  (save-some-buffers 'no-confirm)
  (message "buffers has been saved"))

(defun my/kill-or-close ()
  (interactive)
  (if (string-prefix-p "*" (buffer-name))
      (delete-window)
    (kill-this-buffer)))

(defun my/disable-key-chord-mode ()
  (set (make-local-variable 'input-method-function) nil))

(defun projectile-project-root ()
  (or (locate-dominating-file default-directory ".git")
      default-directory))

(defun my/next-error ()
  (interactive)
  (condition-case nil (next-error)
    (error (next-error 1 t))))

(defun my/create-newline-and-enter-sexp (&rest _ignored)
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))

(defun my/set-gc-threshold ()
  "Reset `gc-cons-threshold' to its default value."
  (setq gc-cons-threshold 800000))

(defun my/select-project ()
  "Change default-directory to the selected project"
  (interactive)
  (setq default-directory (ido-completing-read "Project: " (split-string (shell-command-to-string (concat "find " (getenv "HOME") "/projects -maxdepth 2 -type d -o -type l"))))))

(defun remove-elc-on-save ()
  "If you're saving an elisp file, likely the .elc is no longer valid."
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))
            nil
            t))
