(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :general
  (my-leader-def "p" '(:keymap projectile-command-map :which-key "projectile")))

(provide 'lorq-project)
