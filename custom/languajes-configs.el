;;; languajes-configs -- Summary:
;;; Commentary:

;;; Code:

                                        ; c-like languajes
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(setq-default c-basic-offset 4)

                                        ; general
(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1
      lsp-signature-auto-activate nil
      lsp-ui-sideline-show-diagnostics 1
      lsp-ui-doc-enable 1
      lsp-ui-sideline-update-mode 1
      )

(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")
     (typst "https://github.com/uben0/tree-sitter-typst"))
   )

;; (treesit-install-language-grammar 'typst)

(add-hook 'prog-mode-hook
          (lambda ()
            (unless (derived-mode-p 'javascript-mode)
              'lsp-deferred)))
(setq lsp-warn-no-matched-clients nil)

                                        ; --- Major modes ---
(use-package lua-mode
  :ensure t)

(use-package nix-mode
  :ensure t)

(use-package haskell-mode
  :ensure t)

(use-package lsp-haskell
  :ensure t)
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)

;; (use-package typst-ts-mode
  ;; :ensure t
  ;; :elpaca (:type git :host sourcehut :repo "meow_king/typst-ts-mode")
  ;; :custom
  ;; (typst-ts-mode-watch-options "--open"))

(elpaca (typst-ts-mode
         :host sourcehut
         :repo "meow_king/typst-ts-mode"))

(elpaca (ox-typst
         :host github
         :repo "https://github.com/jmpunkt/ox-typst"))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(typst-ts-mode . ("typst-lsp"))))
(add-hook 'typst-ts-mode-hook 'eglot-ensure)
(add-hook 'typst-ts-mode-hook 'company-mode)

(add-hook 'js-mode-hook 'eglot-ensure)

;; (elpaca (typst-mode
         ;; :type git
         ;; :host github
         ;; :repo "Ziqi-Yang/typst-mode.el"))

;; (defvar lsp-language-id-configuration
  ;; '("\\.typ$" . "typst"))
;; 
;; (lsp-register-client
 ;; (make-lsp-client :new-connection (lsp-stdio-connection
                                   ;; "typst-lsp")
                  ;; :major-modes '(typst-ts-mode)
                 ;; :activation-fn (lsp-activate-on "typst")
                 ;; :server-id 'typst-lsp))
;; (add-hook 'typst-ts-mode-hook #'lsp)

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda () (require 'lsp-pyright)
                         (lsp)))
  :init (when (executable-find "python3")
          (setq lsp-pyright-python-executable-cmd "python3")))

(provide 'languajes-configs)
;;; languajes-configs.el ends here
