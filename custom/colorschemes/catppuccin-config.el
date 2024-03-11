;;; catppuccin.config --- Summary:
;; configurations for the catpuccin-theme

;;; Commentary:

;;; Code:

(add-to-list 'custom-theme-load-path "~/.config/emacs/themes")
(load-theme 'catppuccin t)

(catppuccin-set-color 'base "#f5f3f0" 'latte)
(catppuccin-set-color 'text "#18181A" 'latte)

(catppuccin-set-color 'surface2 "#38393d" 'latte)
(catppuccin-set-color 'surface1 "#9699a3" 'latte)
(catppuccin-set-color 'overlay0 "#acb0be" 'latte)

(catppuccin-set-color 'lavender "#5b6cca" 'latte)
(with-output-to-string (display-graphic-p))
(message "uwu")

(add-hook 'after-make-frame-functions
          (lambda ()
            (while (display-graphic-p)
              (message "uwu")
              ;;(setq catppuccin-flavor 'latte)
              ;;(catppuccin-reload)
              (message "owo")
              )
            )
)

(provide 'catppuccin-config)
;;; catppuccin-config.el ends here.
