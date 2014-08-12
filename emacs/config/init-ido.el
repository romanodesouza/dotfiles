(require-package 'ido-vertical-mode)
(require-package 'ido-ubiquitous)
(require-package 'flx-ido)

(ido-mode t)
(ido-vertical-mode t)
(ido-everywhere t)
(ido-ubiquitous-mode t)
(flx-ido-mode t)

(setq ido-enable-flex-matching t)

(provide 'init-ido)
