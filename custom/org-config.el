;;; package: Org

;;; Code:
                                      ; --- Aesthetics ---

(setq org-hide-emphasis-markers t)

(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                          (0 (prog1 ()
                               (compose-region (match-beginning 1)
                                               (match-end 1) "•"))))))

(add-hook 'org-mode-hook (lambda ()
                           (visual-line-mode 1)
                           (org-superstar-mode 1)))

                                        ; org-mode faces ---------
(let (foreground-color) (face-foreground 'default nil 'default))

(custom-theme-set-faces
 'user
 '(org-level-1 ((t (:inherit outline-1 :height 1.75))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.5))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.25))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.25))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.1))))
 '(org-document-title
   ((t (:inherit default :height 2.0))))
 '(org-block
   ((t (:inherit fixed-pitch))))
 '(org-code
   ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-info
   ((t (:foreground "dark orange"))))
 '(org-document-info-keyword
   ((t (:inherit (shadow fixed-pitch)))))
 '(org-indent
   ((t (:inherit (org-hide fixed-pitch)))))
 '(org-link
   ((t (:foreground "royal blue" :underline t))))
 '(org-meta-line
   ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value
   ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword
   ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-table
   ((t (:inherit fixed-pitch :foreground "#83a598"))))
 '(org-tag
   ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim
   ((t (:inherit (shadow fixed-pitch))))))

                                        ; --- Programming ---

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)))

;; (org-babel-jupyter-override-src-block "python")

                                        ; --- Tweaks ---
(setq org-startup-indented t
          org-pretty-entities t
          org-hide-emphasis-markers t
          org-startup-with-inline-images t
          org-image-actual-width '(300))

;; latex previews
(plist-put org-format-latex-options :scale 2)

                                        ; --- Modern ---
;; Add frame borders and window dividers
(modify-all-frames-parameters
 '((right-divider-width . 1)
   (internal-border-width . 1)))
(dolist (face '(window-divider
                window-divider-first-pixel
                window-divider-last-pixel))
  (face-spec-reset-face face)
  (set-face-foreground face (face-attribute 'default :background)))
(set-face-background 'fringe (face-attribute 'default :background))

(setq
 ;; Edit settings
 org-auto-align-tags nil
 org-tags-column 0
 org-catch-invisible-edits 'show-and-error
 org-special-ctrl-a/e t
 org-insert-heading-respect-content t

 ;; Org styling, hide markup etc.
 org-hide-emphasis-markers t
 org-pretty-entities t
 org-ellipsis "…"

 ;; Agenda styling
 org-agenda-tags-column 0
 org-agenda-block-separator ?─
 org-agenda-time-grid
 '((daily today require-timed)
   (800 1000 1200 1400 1600 1800 2000)
   " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
 org-agenda-current-time-string
 "◀── now ─────────────────────────────────────────────────")

(global-org-modern-mode)

(provide 'org-config)
;;; org-config.el ends here
