(require-package 'flycheck)

(require 'flycheck)

;; Override default flycheck triggers
(setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
      flycheck-idle-change-delay 0.4)

(defun sanityinc/flycheck-errors-visible-p ()
  "Returns t if a window in the current frame is displaying \"*Flycheck errors*\"."
  (let (found-flycheck-errors-buf)
    (walk-window-tree (lambda (w)
                        (when (string-equal "*Flycheck errors*"
                          (buffer-name (window-buffer w)))
        (setq found-flycheck-errors-buf t))))
    (selected-frame)
    found-flycheck-errors-buf))

(defun sanityinc/flycheck-maybe-display-errors (errors)
  (unless (sanityinc/flycheck-errors-visible-p)
    (flycheck-display-error-messages errors)))

(setq flycheck-display-errors-function 'sanityinc/flycheck-maybe-display-errors)

(global-flycheck-mode t)

(provide 'init-flycheck)
