;;; init --- Sumary
;;; Commentary:

;;; Code:
(add-to-list 'load-path "~/.config/emacs/custom/")
(add-to-list 'load-path "~/.config/emacs/evil-god-state")
 
(require 'packages)
(require 'evil-god-state)
(require 'keybindings)
(require 'editing)
(require 'colorscheme)
(require 'languajes-configs)
(require 'org-config)
(require 'faces-ui)
;; (require 'functions)
(server-start)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(magit impatient-mode httpd nix-mode company-nixos-options nixos-options sudo-edit pdf-tools go-projectile lsp-ui meow eldoc-box consult yasnippet-snippets which-key vertico use-package tree-sitter-langs solaire-mode projectile poet-theme page-break-lines origami org-superstar org-modern org-bullets orderless modus-themes mixed-pitch lua-mode literate-calc-mode ligature jupyter highlight-indent-guides god-mode general format-all flycheck evil-org evil-nerd-commenter esup ein doom-modeline dimmer dashboard dap-mode company all-the-icons aggressive-indent))
 '(warning-suppress-log-types '((comp) (auto-save) (lsp-mode)))
 '(warning-suppress-types
   '(((evil-collection))
     ((evil-collection))
     ((evil-collection))
     (auto-save)
     (lsp-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:family "Fira Code 11" :height 0.9))))
 '(mode-line-active ((t (:family "Fira code 11" :height 0.9))))
 '(mode-line-inactive ((t (:family "Fira code 11" :height 0.9))))
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-code ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-info ((t (:foreground "dark orange"))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-title ((t (:inherit default :height 2.0))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.75))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.5))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.25))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.25))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.1))))
 '(org-link ((t (:foreground "royal blue" :underline t))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))
