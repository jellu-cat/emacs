(provide 'editing)

;; rings

(setq global-mark-ring-max 5000
      mark-ring-max 5000
      )

;; add a newline to the end of file
(setq mode-require-final-newline t)

;; tabs/spaces
(setq-default tab-width 4
	      evil-shift-width tab-width
	      indent-tabs-mode nil
          line-spacing 1
	      )

;; (global-set-key (kbd "RET") 'newline-and-indent)

;; utf-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(electric-pair-mode 1)

(add-hook 'diff-mode-hook (lambda ()
			    (setq-local whitespace-style
					'(face
					  tabs
					  tab-mark
					  spaces
					  space-mark
					  trailing
					  indentation::space
					  indentation::tab
					  newline
					  newline-mark))
			    (whitespace-mode 1)))
