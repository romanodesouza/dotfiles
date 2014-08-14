(require-package 'smart-tabs-mode)

(smart-tabs-insinuate 'c 'javascript)
(smart-tabs-advice js3-indent-line js3-basic-offset)

(provide 'init-smart-tabs)
