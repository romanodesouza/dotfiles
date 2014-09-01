; Add the config dir to load path
(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))
; Add the elisp dir to load path
(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))

;;
;; Custom config
;
; Disable backup
(setq backup-inhibited t)
; Disable auto saving
(setq auto-save-default nil)
; Default indentation
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)
(electric-indent-mode t)
; Don't show me the startup screen
(setq inhibit-startup-screen t)
; Disable menu bar
(menu-bar-mode -1)
; Disable tool bar
(tool-bar-mode -1)
; Disable scroll bar
(scroll-bar-mode -1)
; Encoding
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
; Aliases
(defalias 'yes-or-no-p 'y-or-n-p)
; imenu
(setq-default imenu-auto-rescan t)
; Parens mode
(show-paren-mode 1)
(setq show-paren-delay 0)
; Font
(defun fontify-frame (frame)
  (set-frame-parameter frame 'font "Droid Sans Mono-11"))
; Fontify current frame
(fontify-frame nil)
; Fontify any future frames
(push 'fontify-frame after-make-frame-functions)
; Highlight current line
(global-hl-line-mode t)

;;
;; Custom key bindings
;
; Disable the Ctrl+Z to void put Emacs on background job
; Notice that the evil-mode might override this setting to
; switch between evil/emacs mode
(global-unset-key (kbd "C-z"))

;;
;; Packages
;
(require 'init-elpa)
(require 'init-linum-relative)
(require 'init-projectile)
(require 'init-evil-mode)
(require 'init-smex)
(require 'init-ido)
(require 'init-company-mode)
(require 'init-expand-region)
(require 'init-flycheck)
; Programming languages modes
(require 'init-php-mode)
(require 'init-go-mode)
(require 'init-javascript-mode)
(add-hook 'python-mode-hook
          (lambda()
            (require 'init-python-mode)))
(add-hook 'java-mode-hook
          (lambda()
            (require 'init-java-mode)))
(require 'init-eshell)

; Color scheme
;(require-package 'cyberpunk-theme)
(require-package 'ujelly-theme)
;(load-theme 'cyberpunk t)
;(load-theme 'wombat t)
(load-theme 'ujelly t)
