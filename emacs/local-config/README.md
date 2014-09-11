## Local Config Support

Just put a file providing a "init-local-config" module here, like the example below:

```lisp
; Load color theme
(require-package 'color-theme-solarized)
(load-theme 'solarized-light t)

(provide 'init-local-config)
```
