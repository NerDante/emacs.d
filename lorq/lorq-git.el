;;; lorq-git.el --- git ---
;;; Commentary:

;;; Code:

(use-package magit
  :bind (("C-x g" . magit-status)
         ("C-x C-g" . magit-status)))

(use-package git-gutter+
  :ensure t
  :config
  (progn
    (global-git-gutter+-mode)))

(provide 'lorq-git)

;;; lorq-git.el ends here

