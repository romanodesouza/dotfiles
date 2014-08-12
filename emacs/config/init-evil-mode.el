(require-package 'evil)
(require-package 'evil-leader)
; Enable evil mode
(evil-mode t)

; Setup evil leader
(global-evil-leader-mode)
(setq evil-leader/in-all-states t)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "f" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer
  "s" 'save-buffer
  "q" 'quit-window
  "n" 'new-buffer
  "i" 'imenu
)


(provide 'init-evil-mode)
