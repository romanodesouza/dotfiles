(require-package 'company)
(require 'company)

(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 1)
(setq company-tooltip-limit 20)
(setq company-global-modes
      '(not
        eshell-mode))

(add-hook 'after-init-hook 'global-company-mode)

(provide 'init-company-mode)
