(require-package 'key-chord)

(key-chord-define-global ",f" 'fuzzy-finder)
(key-chord-define-global ",s" 'save-buffer)
(key-chord-define-global ",g" 'switch-to-previous-buffer)
(key-chord-define-global ",b" 'switch-to-buffer)
(key-chord-define-global ",k" 'kill-buffer)
(key-chord-define-global ",q" 'quit-window)
(key-chord-define-global ",i" 'imenu)
(key-chord-define-global ",a" 'back-to-indentation)
(key-chord-define-global ",e" 'end-of-line)
(key-chord-define-global ";;" 'end-of-line)

; Enable key-chord mode
(key-chord-mode t)

(provide 'init-key-chord)
