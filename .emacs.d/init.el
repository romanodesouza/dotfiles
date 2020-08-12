;;; init.el
;; Code:
(setq
 ;; Increase GC threshold
 gc-cons-threshold 100000000
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
 display-buffer-alist
 '(("\\*compilation\\*"
	(display-buffer-reuse-window display-buffer-in-side-window)
    (side . bottom)
    (reusable-frames . visible)
    (window-height . 0.25)))
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
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)
(require 'use-package)

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
      "o" 'my/counsel-fzf
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

(use-package key-chord
  :init (add-hook 'after-init-hook (lambda () (key-chord-mode t)))
  :config
  (use-package key-seq
    :config
    (key-seq-define-global ",b" 'counsel-switch-buffer)
    (key-seq-define-global ",s" 'my/save-buffers)
    (key-seq-define-global ",v" 'split-window-horizontally)
    (key-seq-define-global ",q" 'my/kill-or-close)
    (key-seq-define-global ",w" 'delete-other-windows)
    (key-seq-define-global ",c" 'comment-dwim)
    (key-seq-define-global "fd" 'evil-normal-state)
    (key-seq-define-global ",a" 'my/counsel-rg)
    (key-seq-define-global ",d" 'counsel-imenu)

    (add-hook 'minibuffer-setup-hook #'my/disable-key-chord-mode)))

;; counsel completion framework
(use-package counsel
  :bind ("M-x" . counsel-M-x))

;; LSP
(use-package eglot
  :config
  (define-key evil-motion-state-map (kbd "C-]") 'xref-find-definitions)
  (define-key evil-motion-state-map (kbd "K") 'eglot-help-at-point))

;; Go
(use-package go-mode
  :init
  (setq gofmt-command "goimports"
        go--coverage-current-file-name "/tmp/coverage.out")
  :config
  (save-place-mode t)
  (add-hook 'go-mode-hook #'eglot-ensure)
  (add-hook 'before-save-hook 'gofmt-before-save))

(use-package which-key
  :init
  (setq which-key-idle-delay 0.5)
  (add-hook 'after-init-hook 'which-key-mode))

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

(use-package smartparens
  :commands (smartparens-mode)
  :init
  (add-hook 'prog-mode-hook 'smartparens-mode)
  :config
  (sp-local-pair 'prog-mode "{" nil :post-handlers '((my/create-newline-and-enter-sexp "RET")))
  (sp-local-pair 'prog-mode "'" nil :actions nil)
  (sp-local-pair 'prog-mode "\"" nil :actions nil))

(use-package multi-compile
  :commands (multi-compile-run)
  :init
  (evil-leader/set-key "c" 'multi-compile-run)
  (setq multi-compile-alist '((go-mode . (("go install" . "go generate && go install -race")
                                          ("go lint" . "go generate && golangci-lint run")
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
    (define-key evil-visual-state-map (kbd "C-x") 'mc/skip-to-next-like-this))

;; Editor config
(use-package editorconfig)

;; Yaml
(use-package yaml-mode
  :mode "\\.ya?ml$")

;; Dockerfile
(use-package dockerfile-mode
  :mode "Dockerfile")

;; Functions
(defun my/init ()
  (add-hook 'emacs-lisp-mode-hook 'remove-elc-on-save)
  ;; Auto recompile if compilation window is visible
  (advice-add 'my/save-buffers :after (lambda () (when (get-buffer "*compilation*") (recompile))))
  ;; Cursor blinking
  (blink-cursor-mode 0)
  ;; (add-hook 'prog-mode-hook 'linum-mode)
  (load custom-file))

(defun my/counsel-fzf ()
  (interactive)
  (counsel-fzf nil (counsel-locate-git-root)))

(defun my/counsel-rg ()
  (interactive)
  (counsel-rg (if (region-active-p)
                  (buffer-substring-no-properties (region-beginning) (region-end)))
              (counsel-locate-git-root)))

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

(defun my/next-error ()
  (interactive)
  (condition-case nil (next-error)
    (error (next-error 1 t))))

(defun my/create-newline-and-enter-sexp (&rest _ignored)
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))

(defun my/select-project ()
  "Change default-directory to the selected project"
  (interactive)
  (setq default-directory (ivy-completing-read "Project: " (split-string (shell-command-to-string (concat "find " (getenv "HOME") "/projects -maxdepth 2 -type d -o -type l"))))))

(defun remove-elc-on-save ()
  "If you're saving an elisp file, likely the .elc is no longer valid."
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))
            nil
            t))
