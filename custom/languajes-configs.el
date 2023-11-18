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
      )

lsp-ui-sideline-show-diagnostics
lsp-ui-doc-enable
lsp-ui-sideline-update-mode

(provide 'languajes-configs)
;;; languajes-configs.el ends here
