(require-package 'go-mode)
(require-package 'company-go)
(require-package 'go-eldoc)

(require 'go-mode)
(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))
(setq gofmt-command "goimports")
(add-hook 'before-save-hook #'gofmt-before-save)

(provide 'init-go-mode)
