(require-package 'js3-mode)
(require-package 'tern)
(require-package 'company-tern)
(require-package 'web-beautify)

(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))
(add-hook 'js3-mode-hook (lambda ()
                           (tern-mode t)
                           (add-hook 'before-save-hook (lambda ()
                                                         (when (string-equal major-mode "js3-mode"))
                                                           (web-beautify-js)))
                           (add-to-list 'company-backends 'company-tern)

                           (setq-default js3-global-externs
                                         '("module" "require" "__dirname" "process" "console" "define"
                                           "JSON" "$" "_" "Backbone" "buster" "sinon" "moment" "_gaq"
                                           "Zenbox" "Mousetrap" "Comoyo"))
                           (setq-default js3-indent-tabs-mode t)
                           (setq-default js3-indent-level 4)
                           (setq-default js3-auto-indent-p t)         ; it's nice for commas to right themselves.
                           (setq-default js3-enter-indents-newline t) ; don't need to push tab before typing
                           (setq-default js3-indent-on-enter-key t)))

(provide 'init-javascript-mode)
