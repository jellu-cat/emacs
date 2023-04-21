;;; operandi-tinted-config --- Summary:
;; configurations for the modus-operandi-tinted

;;; Commentary:

;;; Code:

(require 'modus-themes)

(setq modus-operandi-tinted-palette-overrides
      '((fg-main "#18181A")
        (bg-main "#F5F3F0")
        (comment "#9699a3")
        ))

(load-theme 'modus-operandi-tinted :no-confirm)

(provide 'operandi-tinted-config)
;;; operandi-tinted-config.el ends here.
