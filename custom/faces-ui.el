;;; package --- Summary
;;; Commentary:

;;; Code:

                                        ; Fonts ------------------
(set-face-attribute 'default nil
		    :font "FiraCode Nerd Font 11"
		    :weight 'medium )

(set-face-attribute 'fixed-pitch nil
		    :font "FiraCode Nerd Font 11"
		    :weight 'medium )

(set-face-attribute 'variable-pitch nil
		    :font "Iosevka Nerd Font"
		    :weight 'medium )

;; for emacs client
(add-to-list 'default-frame-alist
	     '(font . "FiraCode Nerd Font 11"))

(setq doom-modeline-height 1) ; optional
(custom-set-faces
 '(mode-line
   ((t (:family "FiraCode Nerd Font 11" :height 0.9))))
 '(mode-line-active
   ((t (:family "FiraCode Nerd Font 11" :height 0.9))))
 '(mode-line-inactive
   ((t (:family "FiraCode Nerd Font 11" :height 0.9)))))

                                        ; Ligatures ---------------
(use-package ligature
  :load-path "path-to-ligature-repo"
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  (ligature-set-ligatures 't '("|||>" "<|||" "<==>" "<!--"
                               "####" "~~>" "***" "||=" "||>"
                               ":::" "::=" "=:=" "===" "==>"
                               "=!=" "=>>" "=<<" "=/=" "!=="
                               "!!." ">=>" ">>=" ">>>" ">>-"
                               ">->" "->>" "-->" "---" "-<<"
                               "<~~" "<~>" "<*>" "<||" "<|>"
                               "<$>" "<==" "<=>" "<=<" "<->"
                               "<--" "<-<" "<<=" "<<-" "<<<"
                               "<+>" "</>" "###" "#_(" "..<"
                               "..." "+++" "/==" "///" "_|_"
                               "www" "&&" "^=" "~~" "~@" "~="
                               "~>" "~-" "**" "*>" "*/" "||"
                               "|}" "|]" "|=" "|>" "|-" "{|"
                               "[|" "]#" "::" ":=" ":>" ":<"
                               "$>" "==" "=>" "!=" "!!" ">:"
                               ">=" ">>" ">-" "-~" "-|" "->"
                               "--" "-<" "<~" "<*" "<|" "<:"
                               "<$" "<=" "<>" "<-" "<<" "<+"
                               "</" "#{" "#[" "#:" "#=" "#!"
                               "##" "#(" "#?" "#_" "%%" ".="
                               ".-" ".." ".?" "+>" "++" "?:"
                               "?=" "?." "??" ";;" "/*" "/="
                               "/>" "//" "__" "~~" "(*" "*)"
                               "\\\\" "://"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

                                        ; UI ---------------------
(setq backup-directory-alist `(("." . "~/.saves")))
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
(switch-to-buffer "*dashboard*")

(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(setq use-dialog-box nil)

(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(setq visible-bell t)

(defun my-display-numbers-hook ()
  (display-line-numbers-mode 1)
  (setq display-line-numbers-type 'relative))
(add-hook 'prog-mode-hook 'my-display-numbers-hook)

(global-visual-line-mode t)

;; changing frame title
(setq frame-title-format
      '("" invocation-name " - " (:eval (if (buffer-file-name)
					    (abbreviate-file-name (buffer-file-name))
					  "%b"))))


(provide 'faces-ui)
;;; faces-ui.el ends here
