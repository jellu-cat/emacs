;;; package --- Summary
;;; Commentary:

;;; Code:

                                        ; --- Initialiazation ---
(require 'package)
(setq package-archives '(
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

                                        ; --- Key-related ---
(use-package evil
 :ensure t
 :init
 (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
 (setq evil-want-keybinding nil)
 :config
 (evil-mode 1))
 (evil-set-initial-state 'char-mode 'insert)
 (evil-set-initial-state 'term-mode 'insert)
 
(use-package evil-collection
 :after evil
 :ensure t
 :config
 (evil-collection-init))
 
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

(use-package marginalia
  :ensure t
  :init (marginalia-mode))

(use-package consult
  :ensure t)

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

;; (use-package company-lsp
  ;; :ensure t)
;; (push 'company-lsp company-backends)

                                        ; --- help ---
(use-package helpful
  :ensure t)

                                        ; --- Save history ---
(use-package savehist
  :init
  (savehist-mode))

(use-package harpoon
  :ensure t)

(use-package saveplace
  :ensure t
  :init (save-place-mode 1))

(use-package workgroups2
  :ensure t)

(setq desktop-path '("~/.config/emacs/custom/desktop/"))

                                        ; --- magit ---
(use-package magit
  :ensure t)

                                        ; --- Aesthetics ---
(use-package highlight-indent-guides
  :ensure t
  :init
  (setq highlight-indent-guides-method 'character)
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode))

(use-package doom-modeline
  :ensure t)
(doom-modeline-mode 1)

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))
;; (all-the-icons-install-fonts)

(use-package ligature
  :ensure t
  :defer t)

(use-package page-break-lines
  :ensure t)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

;;(use-package origami
;; :ensure t)
;;(global-origami-mode 1)

(use-package pulsar
  :ensure t
  :config (pulsar-global-mode 1))

(use-package volatile-highlights
  :ensure t
  :config (volatile-highlights-mode 1))

(use-package zoom
  :ensure t
  :config (zoom-mode 1))

;; (use-package dimmer
  ;; :ensure t
  ;; :config (dimmer-mode t))

(use-package org-present
  :ensure t)

(use-package visual-fill-column
  :ensure t)

                                        ; --- Snippets ---
(use-package yasnippet
  :ensure t
  :defer t)

(use-package yasnippet-snippets
  :ensure t
  :defer t)

                                        ; --- LSP & Tree-sitter ---

(use-package tree-sitter
  :ensure t)

(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(use-package tree-sitter-langs
  :ensure t)

(use-package flycheck
  :ensure t)
(add-hook 'prog-mode-hook 'flycheck-mode)

(use-package lsp-mode
  :ensure t
  :hook (
         (prog-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)
(setq lsp-warn-no-matched-clients nil)

(use-package lsp-ui
  :ensure t
  ;; :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-doc-header t)
  (setq lsp-ui-doc-include-signature t)
  (setq lsp-ui-doc-border (face-foreground 'default))
  (setq lsp-ui-sideline-show-code-actions t)
  (setq lsp-ui-sideline-delay 0.05)
  )

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-error-list)

(use-package dap-mode
  :ensure t
  :hook prog-mode)

(use-package eldoc-box
  :ensure t)

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))

                                        ; --- Literate proggraming ---

;; (use-package literate-calc-mode
;; :ensure t)

(use-package ein
  :ensure t)

                                        ; --- Format ---

;;(use-package aggressive-indent
;; :ensure t)
;; (global-aggressive-indent-mode 1)
;; (add-to-list 'aggressive-indent-excluded-modes 'html-mode)

(use-package format-all
  :ensure t)
(add-hook 'prog-mode-hook 'format-all-mode)

(use-package electric-operator
  :ensure t)
(add-hook 'prog-mode #'electric-operator-mode)
(add-hook 'text-mode #'electric-operator-mode)

;; (use-package smartparens
;; :ensure t)
;; (add-hook 'prog-mode-hook #'smartparens-mode)
;; (add-hook 'text-mode-hook #'smartparens-mode)

                                        ; --- Proyect management ---
(use-package projectile
  :ensure t)
(add-hook 'prog-mode-hook 'projectile-mode)

                                        ; --- Org Mode ---
(use-package org-superstar
  :ensure t
  :config
  (setq org-superstar-special-todo-items t))
(add-hook 'org-mode-hook 'org-superstar-mode)
(add-hook 'text-mode-hook (lambda () (company-mode -1)))

(use-package org-appear
  :hook org-mode)
(add-hook 'org-mode-hook 'org-appear-mode)

(use-package org-modern
  :ensure t)
(add-hook 'org-mode-hook 'org-modern-mode)

                                        ; --- Major modes ---
(use-package lua-mode
  :ensure t)

(use-package nix-mode
  :ensure t)

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda () (require 'lsp-pyright)
                         (lsp)))
  :init (when (executable-find "python3")
          (setq lsp-pyright-python-executable-cmd "python3")))

                                        ; --- bechmark ---
(use-package esup
  :ensure t
  :commands esup)

                                        ; --- edit as sudo ---
(use-package sudo-edit
  :ensure t)

(provide 'packages)
;;; packages.el ends here
