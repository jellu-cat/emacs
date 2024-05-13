;;; keybindings --- Summary

;;; Commentary:

;;; Code:

(defun terminal-lauch ()
  "Open a terminal in the current working directory."
  (interactive)
  (let
      ((terminal-command
        "wezterm start --class wezterm-emacs --cwd "))

    (shell-command (concat terminal-command
                           default-directory " &"))
  )
)

;; prevent esc from deleting windows
(defadvice keyboard-escape-quit
  (around keyboard-escape-quit-dont-close-windows activate)
  (let ((buffer-quit-function (lambda () ())))
    ad-do-it))

(general-define-key
 "<escape>" 'keyboard-escape-quit
 "C-+" 'text-scale-increase
 "C--" 'text-scale-decrease
 "C-z" 'evil-normal-state
 "C-e" 'execute-extended-command
 "C-t" 'terminal-lauch)

(global-unset-key
 (kbd "C-SPC"))
(global-unset-key
 (kbd "<next>"))
(global-unset-key
 (kbd "<prior>"))

(defvar jellu-mode-map (make-keymap) "Jellu minor mode keymap.")
(define-minor-mode jellu-mode
  "Jellu mode with all the important keybindings."
  :init-value 1
  :global t
  :lighter " jellu"
  :keymap jellu-mode-map
  )
(jellu-mode 1)

                                        ; --- windows ---
(global-unset-key (kbd "C-w"))

(progn
  (define-prefix-command 'window-cmd)

  (general-define-key :keymaps 'window-cmd
                      "C-h" 'windmove-left
                      "C-j" 'windmove-down
                      "C-k" 'windmove-up
                      "C-l" 'windmove-right
                      "C-w" 'other-window

                      "C-s" 'split-window-below
                      "C-v" 'split-window-right

                      "C-m" 'delete-other-windows
                      "C-q" 'delete-window
                      )

(global-set-key (kbd "C-w") window-cmd)
(general-define-key :keymaps 'jellu-mode-map
                   "C-w" 'window-cmd
                   )
  )

                                        ; --- buffers ---
(global-unset-key (kbd "C-b"))
(progn
  (define-prefix-command 'buffer-cmd)

  (general-define-key :keymaps 'buffer-cmd
                      "C-b" 'consult-buffer
                      "C-k" 'kill-current-buffer
                      "C-n" 'next-buffer
                      "C-p" 'previous-buffer
                      ;; "C-l" 'ibuffer-list-buffers
                      )
(general-define-key :keymaps 'jellu-mode-map
                   "C-b" 'buffer-cmd
                   )
)

                                        ; --- C-x ---
(general-define-key :keymaps 'ctl-x-map
                   "C-r" 'consult-recent-file
                   "C-l" 'pulsar-pulse-line
                    )

;; (meow-leader-define-key
;;  '("w" . window-cmd)
;;  '("b" . buffer-cmd))

                                        ; --- god-mode ---

(general-define-key
 :states 'god
 "j" 'evil-normal-state
 "k" 'evil-normal-state
 "l" 'evil-normal-state
 "u" 'evil-normal-state
 )

(general-define-key
 :states 'normal
 "SPC" 'evil-execute-in-god-state)

;; (add-hook 'evil-god-state-exit-hook
;;           (lambda ()
;;             (if (eq evil-state 'god)
;;                 (progn
;;                   (message "gatito")
;;                   (evil-normal-state)))))

                                        ; --- commenter ---
(nvmap :prefix "g"
  "c l" '(evilnc-comment-or-uncomment-lines
          :which-key "toggle comment in a line")
  "c b" '(evilnc-quick-comment-or-uncomment-to-the-line
          :which-key "toggle comment in multiple lines"))

                                        ; --- elisp-mode ---
(general-define-key
 :keymaps 'emacs-lisp-mode-map
 "C-c C-c" 'eval-buffer)

                                        ; --- helpful ---

(global-set-key (kbd "C-h f") #'helpful-callable)
(global-set-key (kbd "C-h v") #'helpful-variable)
(global-set-key (kbd "C-h k") #'helpful-key)
(global-set-key (kbd "C-h x") #'helpful-command)
(global-set-key (kbd "C-c C-d") #'helpful-at-point)
(global-set-key (kbd "C-h F") #'helpful-function)


(provide 'keybindings)
;;; keybindings.el ends here
