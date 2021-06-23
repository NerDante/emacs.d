(defconst my-leader ";")

(use-package general
  :config
  (general-create-definer my-leader-def
    :keymaps '(normal visual emacs)
    :prefix my-leader)

  (my-leader-def
    :keymaps 'projectile-command-map
    :prefix "p")

  (my-leader-def
    "b"  '(switch-to-buffer :which-key "switch-to-buffer")
    ;; avy quick jump
    "s"  '(avy-goto-char-timer :which-key "avy-quick-jump")
    ;; comment
    "c"  '(evilnc-comment-or-uncomment-lines :which-key "(un)comment")

    ;; find
    "f" '(:ignore t :which-key "find")
    "ff"  '(projectile-find-file :which-key "find-file")
    "ft"  '(projectile-find-tag :which-key "find-tag")

    ;; goto
    "g" '(:ignore t :which-key "goto")
    "gd"  '(lsp-find-definition :which-key "goto-definition")
    "gr"  '(lsp-find-references :which-key "find-references")

    ;; window operation
    "w" '(:ignore t :which-key "window-operation")
    "wv" '(split-window-right :which-key "split-right")
    "wd" '(split-window-below :which-key "split-below")
    "wq" '(delete-window :which-key "close")
    "wo" '(delete-other-windows :which-key "close-others")
    "wl" '(windmove-right :which-key "to-right")
    "wh" '(windmove-left :which-key "to-left")
    "wj" '(windmove-down :which-key "to-down")
    "wk" '(windmove-up :which-key "to-up")

    ;; toggles
    "t"  '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "choose theme")))



(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(which-key-mode)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(provide 'lorq-keymap)

