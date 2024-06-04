;;; languajes-configs -- Summary:
;;; Commentary:

;;; Code:

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

(elpaca (typst-ts-mode
         :host sourcehut
         :repo "meow_king/typst-ts-mode"))

(lsp-register-client
 (make-lsp-client
  :new-connection
  (lsp-stdio-connection (list "swipl"
                              "-g"
                              "use_module(library(lsp_server))."
                              "-g" "lsp_server:main"
                              "-t" "halt"
                              "--" "stdio"))
  :major-modes '(prolog-mode)
  :priority 1
  :multi-root t
  :server-id 'prolog-ls))

                                        ;--- Tree-sitter

(setq major-mode-remap-alist '(
                               (bash-mode . bash-ts-mode)
                               (typescript-mode . typescript-ts-mode)
                               (javascript-mode . javascript-ts-mode)
                               (css-mode . css-ts-mode)
                               (c-mode . c-ts-mode)
                               (c++-mode . c++-ts-mode)
                               (python-mode . python-ts-mode)))

                                        ; --- C-like languages ---

(add-hook 'c-ts-mode-hook 'lsp)
(add-hook 'c++-ts-mode-hook 'lsp)

(setq-default c-basic-offset 4)

                                        ; --- LSP ---

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
     (c "https://github.com/tree-sitter/tree-sitter-c")
     (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
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

;; (mapc #'treesit-install-language-grammar (mapcar #'car treesit-language-source-alist))

(add-hook 'prog-mode-hook
          (lambda ()
            (unless (derived-mode-p 'javascript-ts-mode)
              'lsp-deferred)))
(setq lsp-warn-no-matched-clients nil)

(use-package lsp-pyright
  :ensure t
  :hook (python-ts-mode . (lambda () (require 'lsp-pyright)
                         (lsp)))
  :init (when (executable-find "python3")
          (setq lsp-pyright-python-executable-cmd "python3")))

                                        ; --- Eglot ---

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(typst-ts-mode . ("typst-lsp"))))
(add-hook 'typst-ts-mode-hook 'eglot-ensure)
(add-hook 'typst-ts-mode-hook 'company-mode)

(add-hook 'js-ts-mode-hook 'eglot-ensure)

(provide 'languajes-configs)
;;; languajes-configs.el ends here
