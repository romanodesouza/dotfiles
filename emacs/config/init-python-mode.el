(require-package 'anaconda-mode)
(require-package 'pyenv-mode)
(require-package 'company-anaconda)

(anaconda-mode)
(pyenv-mode)
(add-to-list 'company-backends 'company-anaconda)

(provide 'init-python-mode)
