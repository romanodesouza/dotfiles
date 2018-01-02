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
 ;; Open buffers always on bottom
 split-height-threshold nil
 split-width-threshold most-positive-fixnum
 ;; Safe local variables
 enable-local-variables ':all)

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
                                        ; Font
(let ((font "Liberation Mono 12"))
  (set-face-attribute 'default nil :font font)
  (set-frame-font font nil t))

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
  (setq fzf/args "-x --color bw --margin 0,1,1,0"))

(use-package color-theme-solarized
  :config (load-theme 'solarized t))

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

(use-package ivy
  :commands (ivy-resume ivy-switch-buffer))

(use-package counsel
  :commands (counsel-ag counsel-imenu)
  :bind ("M-x" . counsel-M-x))

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
      "r" 'evil-search-backward
      "s" 'evil-search-forward
      "en" 'my/next-error))

  (use-package evil-visualstar
    :config (global-evil-visualstar-mode t))

  (use-package evil-matchit
    :config (global-evil-matchit-mode t)))

;;(use-package smex
;;  :init (add-hook 'after-init-hook 'smex-initialize)
;;  :bind ("M-x" . smex))

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
    (key-seq-define-global ",b" 'ivy-switch-buffer)
    (key-seq-define-global ",s" 'my/save-buffers)
    (key-seq-define-global ",v" 'split-window-horizontally)
    (key-seq-define-global ",q" 'my/delete-window-maybe-kill-buffer)
    (key-seq-define-global ",w" 'delete-other-windows)
    (key-seq-define-global ",c" 'comment-dwim)
    (key-seq-define-global ",d" 'counsel-imenu)
    (key-seq-define-global ",e" 'end-of-line)
    (key-seq-define-global "fd" 'evil-normal-state)
    (key-seq-define-global ",a" 'fzf-git-grep)

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
  :config (setq yas-snippet-dirs (remq 'yas-installed-snippets-dir yas-snippet-dirs)))

;; programming modes
(use-package go-mode
  :mode "\\.go$"
  :init
  (setq company-go-show-annotation t
        company-go-insert-arguments t
        gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq go-mode-hook (lambda ()
                       (evil-define-key 'normal go-mode-map (kbd "C-]") 'godef-jump)
                       (evil-define-key 'normal go-mode-map (kbd "K") 'godef-describe)
                       (go-eldoc-setup)
                       (setq compilation-error-regexp-alist (delete 'go-test compilation-error-regexp-alist))
                       (setq compilation-error-regexp-alist-alist (delete 'go-test compilation-error-regexp-alist-alist))
                       (let ((name 'go)
                             (pattern (concat "^\t+\\(" (getenv "GOPATH") "/src/[^:]+\\):\\([0-9]+\\)")))
                         (add-to-list 'compilation-error-regexp-alist name)
                         (add-to-list 'compilation-error-regexp-alist-alist (list name pattern 1 2) t))
                       (set (make-local-variable 'company-backends) '((company-go :with company-yasnippet company-dabbrev)))))
  ;; recompile after saving
  (advice-add 'my/save-buffers :after (lambda () (when (derived-mode-p 'go-mode) (recompile))))
  :config
  (use-package company-go
    :init (setq company-go-insert-arguments nil))

  (use-package go-eldoc))

;; functions
(defun my/save-buffers ()
  (interactive)
  (save-some-buffers 'no-confirm)
  (message "buffers has been saved"))

(defun my/delete-window-maybe-kill-buffer ()
  (interactive)
  (when (eq 1 (length (get-buffer-window-list)))
    (kill-this-buffer))
  (delete-window))

(defun my/disable-key-chord-mode ()
  (set (make-local-variable 'input-method-function) nil))

(defun projectile-project-root ()
  (or (locate-dominating-file default-directory ".git")
      default-directory))

(defun my/next-error ()
  (interactive)
  (condition-case nil (next-error)
    (error (next-error 1 t))))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (go-eldoc company-go yasnippet which-key use-package smooth-scrolling key-seq go-mode fzf expand-region evil-visualstar evil-matchit evil-leader counsel company color-theme-solarized))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
