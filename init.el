;;; init --- Sumary
;;; Commentary:

;;; Code:
(add-to-list 'load-path "~/.config/emacs/custom/")
(add-to-list 'load-path "~/.config/emacs/evil-god-state")
 
(require 'elpaca-init)
(require 'packages)
(require 'evil-god-state)
(require 'keybindings)
(require 'faces-ui)
(require 'editing)
(require 'languajes-configs)
(require 'colorscheme)
(require 'org-config)
;; (require 'functions)
;; (server-start)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:family "FiraCode Nerd Font 11" :height 0.9))))
 '(mode-line-active ((t (:family "FiraCode Nerd Font 11" :height 0.9))))
 '(mode-line-inactive ((t (:family "FiraCode Nerd Font 11" :height 0.9))))
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
 '(org-property-value ((t (:inherit fixed-pitch))))
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("cb8eb6d80c3908a53b0c8a98ab0cedd007c1f10593a5f0f1e2ee24eec241e3e0" "c1638a7061fb86be5b4347c11ccf274354c5998d52e6d8386e997b862773d1d2" "317754d03bb6d85b5a598480e1bbee211335bbf496d441af4992bbf1e777579e" "df1ed4aa97d838117dbda6b2d84b70af924b0380486c380afb961ded8a41c386" "4343cbc036f09361b2912119c63573433df725f599bfbdc16fb97f1e4847a08b" "0d9028987183602b113c27e52e549b2eeb23fb29ebfc19ca0b6612fa57472066" "7776ba149258df15039b1f0aba4b180d95069b2589bc7d6570a833f05fdf7b6d" default))
 '(package-selected-packages '(nix-mode lua-mode haskell-mode)))
