(require-package 'company)
(require 'company)

(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 1)
(setq company-tooltip-limit 20)
(setq company-global-modes
      '(not
         eshell-mode))

(add-hook 'after-init-hook 'global-company-mode)

(defadvice company-complete-common (around advice-for-company-complete-common activate)
           (when (null (yas-expand))
             ad-do-it))

(eval-after-load 'company
                 '(progn
                    (define-key company-active-map (kbd "\C-n") 'company-select-next)
                    (define-key company-active-map (kbd "\C-p") 'company-select-previous)))

(provide 'init-company-mode)
