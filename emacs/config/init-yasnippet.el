(require-package 'yasnippet)

(yas-global-mode t)
(add-to-list 'company-backends 'company-yasnippet t)

(setq yas-fallback-behavior 'return-nil)
(setq yas-also-auto-indent-first-line t)
(setq yas-prompt-functions '(yas/ido-prompt yas/completing-prompt))

(provide 'init-yasnippet)
