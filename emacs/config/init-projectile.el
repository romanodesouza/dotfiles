(require-package 'projectile)

(projectile-global-mode)
(setq projectile-enable-caching nil)

(defun fuzzy-finder()
  "Open files with projectile-find-file or projectile-find-file-in-directory"
  (interactive)
  (if (projectile-project-p)
    (projectile-find-file)
    (ido-find-file)))

; Overrides default C-x C-f
(global-set-key (kbd "C-x C-f") 'fuzzy-finder)

(provide 'init-projectile)
