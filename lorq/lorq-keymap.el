;;; lorq-keymap.el --- key maps ---
;;; Commentary:

;;; Code:
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
    ;; goback to last position
    "," '(xref-pop-marker-stack :which-key "back <==")
    ;; tag
    ";"  '(projectile-find-tag :which-key "find-tag")
    ;; switch buffer
    "b"  '(switch-to-buffer :which-key "switch-to-buffer")
    ;; comment
    "c"  '(evilnc-comment-or-uncomment-lines :which-key "comment(out)")
    ;; text scale
    "="  '(text-scale-increase :which-key "text-scale-increase")
    "-"  '(text-scale-decrease :which-key "text-scale-decrease")

    ;; find
    "f" '(:ignore t :which-key "find")
    "ff"  '(projectile-find-file :which-key "projectile-find-file")
    "ft"  '(projectile-find-tag :which-key "projectile-find-tag")

    ;; goto
    "g" '(:ignore t :which-key "goto")
    "gd"  '(lsp-find-definition :which-key "lsp-find-definition")
    "gr"  '(lsp-find-references :which-key "lsp-find-references")

    ;; quick-jump 
    "j" '(:ignore t :which-key "quick-jump")
    "jc" '(avy-goto-char-timer :which-key "avy-goto-char-timer")
    "jj" '(avy-goto-line-below :which-key "avy-goto-line-below")
    "jk" '(avy-goto-line-above :which-key "avy-goto-line-above")

    ;; open 
    "o" '(:ignore t :which-key "open/toggle")
    "ot" '(treemacs :which-key "toogle-treemacs")
    "oc" '(counsel-load-theme :which-key "choose theme")

    ;; git
    "v" '(:ignore t :which-key "magit")
    "vs" '(magit-status :which-key "magit-status")
    "vl" '(magit-log-all :which-key "magit-log-all")

    ;; window operation
    "w" '(:ignore t :which-key "window-operation")
    "wv" '(split-window-right :which-key "split-right")
    "wd" '(split-window-below :which-key "split-below")
    "wq" '(delete-window :which-key "close")
    "wo" '(delete-other-windows :which-key "close-others")
    "wl" '(windmove-right :which-key "to-right")
    "wh" '(windmove-left :which-key "to-left")
    "wj" '(windmove-down :which-key "to-down")
    "wk" '(windmove-up :which-key "to-up")))



(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(which-key-mode)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(provide 'lorq-keymap)

;;; lorq-keymap.el ends here

