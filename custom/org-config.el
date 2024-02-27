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

                                        ; --- Presentations ---

(setq-default visual-fill-column-center-text t)
(setq visual-fill-column-width 110)
(setq header-line-format " ")
(setq header-line-format nil)

(defun my/org-present-start ()
  (setq-local face-remapping-alist '((default (:height 1.5) variable-pitch)
                                     (header-line (:height 4.0) variable-pitch)
                                     (org-document-title (:height 1.75) org-document-title)
                                     (org-code (:height 1.55) org-code)
                                     (org-verbatim (:height 1.55) org-verbatim)
                                     (org-block (:height 1.25) org-block)
                                     (org-block-begin-line (:height 0.7) org-block)))
  (visual-fill-column-mode 1))

(defun my/org-present-end ()
  (visual-fill-column-mode 0)
  (setq-local face-remapping-alist '((default variable-pitch default))))

;; Register hooks with org-present
(add-hook 'org-present-mode-hook 'my/org-present-start)
(add-hook 'org-present-mode-quit-hook 'my/org-present-end)

                                        ; --- Latex ---
(setq org-latex-pdf-process
      '("latexmk -pdflatex='pdflatex -interaction nonstopmode' -pdf -bibtex -f %f"))

(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))

(add-to-list 'org-latex-classes
             '("article"
              "\\documentclass[letterpaper,12pt]{article}
               \\usepackage[utf8]{inputenc}
               \\usepackage[shortlabels]{enumitem}
               \\usepackage[spanish,mexico]{babel} 
               \\usepackage{amsmath,amssymb,amsfonts,latexsym,cancel}
               \\usepackage{hyperref}
               \\usepackage{wrapfig}
               \\usepackage[pdftex]{graphicx}
               \\usepackage{fancyhdr}
               \\usepackage{float}
               \\usepackage{longtable,multirow,booktabs}
               \\usepackage{multicol}
               \\usepackage{caption}
               \\usepackage[]{sidecap}
               \\usepackage{adjustbox}
               \\usepackage{parskip}
               \\usepackage{enumitem}
               \\usepackage{tikz}
               \\usepackage{lipsum}
               \\usepackage[]{xcolor}
               \\usepackage{cite}
               \\usepackage[square,numbers]{natbib}
               \\usepackage{import}
               \\textheight       = 21cm
               \\textwidth        = 18cm
               \\topmargin        = -2cm
               \\oddsidemargin    = -0.8cm
               \\pagestyle{fancy}"))
                

;; latex previews
(plist-put org-format-latex-options :scale 2)

(provide 'org-config)
;;; org-config.el ends here
