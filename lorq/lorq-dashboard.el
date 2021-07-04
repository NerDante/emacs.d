;;; lorq-dashboard.el --- dashboard ---
;;; Commentary:

;;; Code:

(use-package dashboard
  :init
  (add-hook 'after-init-hook 'dashboard-refresh-buffer)
  :config
  (dashboard-setup-startup-hook))

;; configuration
(setq dashboard-banner-logo-title "Welcome LordQqiang")
(setq dashboard-startup-banner "~/.emacs.d/lorq-banner.png")
(setq dashboard-center-content t)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-projects-backend 'projectile)

(setq dashboard-items '((projects . 8)
                        (recents . 8)))


(provide 'lorq-dashboard)

;;; lorq-dashboard.el ends here
