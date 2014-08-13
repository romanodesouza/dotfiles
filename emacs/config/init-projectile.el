(require-package 'projectile)

(projectile-global-mode)
(setq projectile-enable-caching nil)

(defun fuzzy-finder()
  "Open files with projectile-find-file or projectile-find-file-in-directory"
  (interactive)
  (if (projectile-project-p)
    (projectile-find-file)
    (ido-find-file)))

(provide 'init-projectile)
