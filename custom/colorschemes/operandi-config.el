;;; operandi.config --- Summary:
;; configurations for the modus-operandi

;;; Commentary:

;;; Code:

(require 'modus-themes)

(setq modus-operandi-palette-overrides
      '((fg-main "#18181A")
        (bg-main "#F5F3F0")
        (comment "#9699a3")
        ))

(load-theme 'modus-operandi :no-confirm)

(provide 'operandi-config)
;;; operandi-config.el ends here.
