(require-package 'emacs-eclim)

(require 'eclim)
(require 'company-emacs-eclim)

(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

(global-eclim-mode)
(company-emacs-eclim-setup)
(global-company-mode t)

(provide 'init-eclim)
