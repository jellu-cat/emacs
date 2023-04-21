;;; package --- Summary
;;; Commentary:

;;; Code:

                                        ; --- Initialiazation ---
(require 'package)
(setq package-archives '(
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

                                        ; --- Key-related ---
(use-package evil
  :ensure t  ;; install if it's not installed
  :init      ;; configure evil before loading it
  (setq evil-want-integration t)
  ;; (setq evil-want-keybindig nil)
  :config
  (evil-mode 1))

;; (use-package evil-collection
;; :after evil
;; :ensure t
;; :config
;; (evil-collection-init))

(use-package god-mode
  :ensure t
  :config
  (setq god-exempt-major-modes nil)
  (setq god-exempt-predicates nil))

(use-package which-key
  :ensure t
  :config (which-key-enable-god-mode-support))
(which-key-mode)

(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package evil-nerd-commenter
  :ensure t
  :config (evilnc-default-hotkeys)
  :defer t)

(use-package general
  :ensure t
  :config
  (general-evil-setup t))

                                      ; --- Completion ---
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-override
   '((file (styles basic partial-completion))))
  :defer t)

(use-package company
  :ensure t)
(add-hook 'after-init-hook 'global-company-mode)

                                        ; --- Save history ---
(use-package savehist
  :init
  (savehist-mode))

                                        ; --- Aesthetics ---
(use-package highlight-indent-guides
  :ensure t
  :init
  (setq highlight-indent-guides-method 'character)
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode))

(use-package modus-themes
  :ensure t)

(use-package doom-modeline
  :ensure t)
(doom-modeline-mode 1)

(use-package solaire-mode
  :ensure t)
(solaire-global-mode 1)

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))
;; (all-the-icons-install-fonts)

(use-package ligature
  :ensure t
  :defer t)

(use-package dimmer
  :ensure t)
(dimmer-configure-which-key)
(dimmer-mode t)

(use-package page-break-lines
  :ensure t)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

;;(use-package origami
;; :ensure t)
;;(global-origami-mode 1)

                                        ; --- Snippets ---
(use-package yasnippet
  :ensure t
  :defer t)

(use-package yasnippet-snippets
  :ensure t
  :defer t)

                                        ; --- LSP & Tree-sitter ---
(use-package tree-sitter
  :ensure t
  :hook prog-mode)

(use-package tree-sitter-langs
  :ensure t
  :hook prog-mode)

(use-package flycheck
  :ensure t
  :hook prog-mode)

(use-package lsp-mode
  :ensure t
  :hook (
         (prog-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration)))

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-error-list)

(use-package dap-mode
  :ensure t
  :hook prog-mode)

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))

                                        ; --- Literate proggraming ---
; (use-package literate-calc-mode
  ; :ensure t)

(use-package ein
  :ensure t)

                                        ; --- Format ---
(use-package aggressive-indent
  :ensure t)
;; (global-aggressive-indent-mode 1)
;; (add-to-list 'aggressive-indent-excluded-modes 'html-mode)

(use-package format-all
  :ensure t)

(add-hook 'prog-mode-hook 'format-all-mode)
(add-hook 'after-init-hook 'electric-pair-mode)

                                        ; --- Proyect management ---
(use-package projectile
  :ensure t
  :hook prog-mode)

                                       ; --- Org Mode ---
(use-package org-superstar
  :ensure t
  :hook org-mode
  :config
  (setq org-superstar-special-todo-items t))

(use-package mixed-pitch
  :ensure t
  :hook text-mode)

(use-package org-appear
  :hook org-mode)

(use-package org-modern
  :ensure t
  :hook org-mode)

                                        ; ; --- Major modes ---
; (use-package lua-mode
  ; :ensure t)

;; (use-package markdown-mode
;;   :ensure t
;;   :mode ("README\\.md\\" . gfm-mode)
;;   :init (setq markdown-command "multimarkdown"))

                                        ; --- bechmark ---
(use-package esup
  :ensure t
  :commands esup)

(provide 'packages)
;;; packages.el ends here
