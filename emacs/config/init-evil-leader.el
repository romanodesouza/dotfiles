(require-package 'evil-leader)

(global-evil-leader-mode)
(setq evil-leader/in-all-states t)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "f" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer
  "s" 'save-buffer
  "q" 'quit-window)

(provide 'init-evil-leader)
