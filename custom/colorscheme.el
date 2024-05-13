(add-to-list 'load-path "~/.config/emacs/custom/colorschemes/")

(defun my/load-color-theme (frame)
(run-with-idle-timer
   0 nil
   (lambda (frame)
     (select-frame frame)
     (if (display-graphic-p)
         (progn
           (mapc #'disable-theme custom-enabled-themes)
           (load-theme 'ef-trio-light :no-confirm)
           )
       (progn
         (mapc #'disable-theme custom-enabled-themes)
         (load-theme 'ef-trio-light :no-confirm)
         )
       ))
   frame))

(add-hook 'window-setup-hook #'my/load-color-theme)
(add-hook 'after-make-frame-functions #'my/load-color-theme)

(provide 'colorscheme)
;;; colorscheme.el ends here
