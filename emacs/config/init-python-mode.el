(require-package 'anaconda-mode)
(require-package 'pyenv-mode)
(require-package 'company-anaconda)
(require-package 'company-inf-python)

(anaconda-mode)
(pyenv-mode)
(add-to-list 'company-backends 'company-anaconda)
(add-to-list 'company-backends 'company-inf-python)

(provide 'init-python-mode)
