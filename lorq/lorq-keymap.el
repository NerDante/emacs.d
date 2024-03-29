;;; lorq-keymap.el --- key maps ---
;;; Commentary:

;;; Code:

(use-package general
  :config
  (general-create-definer my-leader-def
    :keymaps '(normal visual emacs)
    :prefix ";"
    :non-normal-prefix "C-;")

  (general-create-definer lorq-space-leader-def
    :keymaps '(normal visual emacs)
    :prefix "SPC")

  (my-leader-def
    "," '(xref-pop-marker-stack :which-key "back <==")
    ;; tag
    ";"  '(projectile-find-tag :which-key "find-tag")
    ;; awesome-tab
    "a" '(:ignore t :which-key "awesome-tab")
    "as"  '(awesome-tab-counsel-switch-group :which-key "awesome-tab-counsel-switch-group")
    "aj"  '(awesome-tab-forward-tab :which-key "awesome-tab-forward-tab")
    "ak"  '(awesome-tab-backward-tab :which-key "awesome-tab-backward-tab")

    ;; Switch buffer
    "b"  '(switch-to-buffer :which-key "switch-to-buffer")
    ;; comment
    "c"  '(evilnc-comment-or-uncomment-lines :which-key "comment(out)")

    "e" '(:ignore t :which-key "edit")
    "ea"  '(align-regexp :which-key "align-regxep")

    ;; close current buffer
    "k"  '(kill-current-buffer :which-key "kill-current-buffer")
    ;; close current buffer
    "r"  '(eval-buffer :which-key "eval-buffer")
    ;; save 
    "s"  '(save-buffer :which-key "save-buffer")
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

    ;; terminal
    "t"  '(eshell :which-key "eshell")

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
    "wk" '(windmove-up :which-key "to-up")
    ;; remap C-x
    "x" '(:keymap ctl-x-map :which-key "ctl-x-map"))

  (lorq-space-leader-def
    "SPC" '(avy-goto-char-timer :which-key "avy-goto-char-timer")
    "b" '(counsel-projectile-switch-to-buffer :which-key "counsel-projectile-switch-to-buffer")
    "s" '(swiper :which-key "swiper")
    "f" '(counsel-projectile-find-file :which-key "counsel-projectile-find-file"))

  ;; keymap not use leaderkey
  (general-define-key
    ;; expand region 
    "C-<return>" '(er/expand-region :which-key "expand-region")
    ;; choose tab with index
    "M-1"  '(awesome-tab-select-visible-tab :which-key "select-tab-1")
    "M-2"  '(awesome-tab-select-visible-tab :which-key "select-tab-2")
    "M-3"  '(awesome-tab-select-visible-tab :which-key "select-tab-3")
    "M-4"  '(awesome-tab-select-visible-tab :which-key "select-tab-4")
    "M-5"  '(awesome-tab-select-visible-tab :which-key "select-tab-5")
    "M-6"  '(awesome-tab-select-visible-tab :which-key "select-tab-6")
    "M-7"  '(awesome-tab-select-visible-tab :which-key "select-tab-7")
    "M-8"  '(awesome-tab-select-visible-tab :which-key "select-tab-8")
    "M-9"  '(awesome-tab-select-visible-tab :which-key "select-tab-9")))


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

