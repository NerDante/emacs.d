
;;; smartparens
(use-package smartparens
  :init
  (bind-key "C-M-f" #'sp-forward-sexp smartparens-mode-map)
  (bind-key "C-M-b" #'sp-backward-sexp smartparens-mode-map)
  (bind-key "C-)" #'sp-forward-slurp-sexp smartparens-mode-map)
  (bind-key "C-(" #'sp-backward-slurp-sexp smartparens-mode-map)
  (bind-key "M-)" #'sp-forward-barf-sexp smartparens-mode-map)
  (bind-key "M-(" #'sp-backward-barf-sexp smartparens-mode-map)
  (bind-key "C-S-s" #'sp-splice-sexp)
  (bind-key "C-M-<backspace>" #'backward-kill-sexp)
  (bind-key "C-M-S-<SPC>" (lambda () (interactive) (mark-sexp -1)))

  :config
  (smartparens-global-mode t)

  (sp-pair "'" nil :actions :rem)
  (sp-pair "`" nil :actions :rem)
  (setq sp-highlight-pair-overlay nil))


(provide 'lorq-edit)
