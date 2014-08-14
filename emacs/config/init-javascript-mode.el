(require-package 'js3-mode)
(require-package 'tern)
(require-package 'company-tern)
(require 'jsfmt)

(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))
(add-hook 'js3-mode-hook (lambda ()
                           (tern-mode t)
                           (add-hook 'before-save-hook 'jsfmt-before-save)
                           (add-to-list 'company-backends 'company-tern)

                           (setq-default js3-mode-indent-ignore-first-tab t)
                           (setq-default js3-show-parse-errors nil)
                           (setq-default js3-strict-inconsistent-return-warning nil)
                           (setq-default js3-strict-var-hides-function-arg-warning nil)
                           (setq-default js3-strict-missing-semi-warning nil)
                           (setq-default js3-strict-trailing-comma-warning nil)
                           (setq-default js3-strict-cond-assign-warning nil)
                           (setq-default js3-strict-var-redeclaration-warning nil)
                           (setq-default js3-global-externs
                                         '("module" "require" "__dirname" "process" "console" "define"
                                           "JSON" "$" "_" "Backbone" "buster" "sinon" "moment" "_gaq"
                                           "Zenbox" "Mousetrap" "Comoyo"))
                           (setq-default js3-auto-indent-p t)         ; it's nice for commas to right themselves.
                           (setq-default js3-enter-indents-newline t) ; don't need to push tab before typing
                           (setq-default js3-indent-on-enter-key t)))

(provide 'init-javascript-mode)
