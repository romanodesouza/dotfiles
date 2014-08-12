(setq package-archives '(
  ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
  ("melpa" . "http://melpa.milkbox.net/packages/")
))
(setq package-enable-at-startup nil)
(package-initialize)

(defun require-package (package)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

(provide 'init-elpa)
