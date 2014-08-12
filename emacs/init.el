; Add the config dir to load path
(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))

;;
;; Custom config
;
; Disable backup
(setq backup-inhibited t)
; Disable auto saving
(setq auto-save-default nil)
; Default indentation
(setq indent-tabs-mode nil)
(setq tab-width 4)
; Don't show me the startup screen
(setq inhibit-startup-screen t)
; Starts with a blank screen
(switch-to-buffer (get-buffer-create "emtpy"))
(delete-other-windows)
; Disable menu bar
(menu-bar-mode -1)
; Disable tool bar
(tool-bar-mode -1)
; Disable scroll bar
(scroll-bar-mode -1)

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
(require 'init-evil-mode)
(require 'init-evil-leader)
(require 'init-projectile)
(require 'init-smex)
(require 'init-ido)
(require 'init-company-mode)
(add-hook 'python-mode-hook
  (lambda()
    (require 'init-python-mode)))

; Color scheme
;(require-package 'cyberpunk-theme)
(require-package 'ujelly-theme)
;(load-theme 'cyberpunk t)
;(load-theme 'wombat t)
(load-theme 'ujelly t)
