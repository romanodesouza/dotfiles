(require-package 'evil)
(require-package 'evil-leader)
(require-package 'evil-nerd-commenter)

(setq evil-leader/in-all-states t)
(setq evil-leader/no-prefix-mode-rx '(".*-mode"))
; Setup evil leader
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "f" 'fuzzy-finder
  "b" 'switch-to-buffer
  "k" 'kill-buffer
  "s" 'save-buffer
  "q" 'quit-window
  "n" 'new-buffer
  "i" 'imenu
)
; Enable evil-nerd-commenter
(evilnc-default-hotkeys)
; Enable evil mode
(evil-mode t)


(provide 'init-evil-mode)
