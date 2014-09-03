(require-package 'go-mode)
(require-package 'company-go)
(require-package 'go-eldoc)
(require-package 'go-snippets)
(require 'go-mode)

(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))
(setq gofmt-command "goimports")
(add-hook 'before-save-hook #'gofmt-before-save)
; Clear the "Gofmt Errors" window after the code is fixed
(add-hook 'after-save-hook (lambda ()
                             (unless (get-buffer "*Gofmt Errors*")
                               (delete-other-windows))))

(provide 'init-go-mode)
