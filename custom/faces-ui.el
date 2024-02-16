;;; package --- Summary
;;; Commentary:

;;; Code:

                                        ; Fonts ------------------
(set-face-attribute 'default nil
		    :font "Fira Code 11"
		    :weight 'medium )

(set-face-attribute 'fixed-pitch nil
		    :font "Fira Code 11"
		    :weight 'medium )

(set-face-attribute 'variable-pitch nil
		    :font "Iosevka Nerd Font 12"
		    :weight 'normal )

(use-package mixed-pitch
  :ensure t
  :config
  (add-hook 'text-mode-hook #'mixed-pitch-mode)
  (set-face-attribute 'variable-pitch nil
                      :font "Iosevka Nerd Font 12"
                      :weight 'normal )
  )

(add-hook 'text-mode-hook (lambda () (company-mode -1)))

;; for emacs client
(add-to-list 'default-frame-alist
	     '(font . "Fira Code 11"))

(setq doom-modeline-height 1) ; optional
(custom-set-faces
 '(mode-line
   ((t (:family "Fira Code 11" :height 0.9))))
 '(mode-line-active
   ((t (:family "Fira code 11" :height 0.9)))) ; For 29+
 '(mode-line-inactive
   ((t (:family "Fira code 11" :height 0.9)))))

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
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(scroll-bar-mode -1)
;;(menu-bar-mode -1)

(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(setq visible-bell t)

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(global-visual-line-mode t)
(add-hook 'term-mode-hook
          (lambda () (display-line-numbers-mode -1)))

;; changing frame title
(setq frame-title-format
      '("" invocation-name " - " (:eval (if (buffer-file-name)
					    (abbreviate-file-name (buffer-file-name))
					  "%b"))))


(provide 'faces-ui)
;;; faces-ui.el ends here
