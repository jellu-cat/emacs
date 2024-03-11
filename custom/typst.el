(add-to-list 'treesit-language-source-alist
             '(typst "https://github.com/uben0/tree-sitter-typst"))
(treesit-install-language-grammar 'typst)

(provide 'typst)
