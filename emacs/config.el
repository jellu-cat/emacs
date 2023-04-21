(add-to-list 'custom-theme-load-path "~/.config/emacs/themes")
(load-theme 'catppuccin t)

(catppuccin-set-color 'base "#f5f3f0" 'latte)
(catppuccin-set-color 'text "#18181A" 'latte)

(catppuccin-set-color 'surface2 "#38393d" 'latte)
(catppuccin-set-color 'surface1 "#9699a3" 'latte)
(catppuccin-set-color 'overlay0 "#acb0be" 'latte)

(catppuccin-set-color 'lavender "#5b6cca" 'latte)

(setq catppuccin-flavor 'latte)
(catppuccin-reload)

(setq inhibit-startup-message t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
;;(menu-bar-mode -1)

(setq visible-bell t)

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(global-visual-line-mode t)
