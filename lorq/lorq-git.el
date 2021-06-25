;;; lorq-git.el --- git ---
;;; Commentary:

;;; Code:

(use-package magit
  :ensure t)

(use-package git-gutter+
  :ensure t
  :config
  (progn
    (global-git-gutter+-mode)))

(provide 'lorq-git)

;;; lorq-git.el ends here

