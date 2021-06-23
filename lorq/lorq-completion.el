;;; lorq-completion.el --- auto completion ---
;;; Commentary:

;;; Code:

(use-package company
  :delight
  :hook (after-init . global-company-mode)
  :config
  (setq company-tooltip-align-annotations t
        company-tooltip-limit 20
        company-show-numbers t
        company-idle-delay .2               ; decrease delay before autocompletion popup shows
        company-echo-delay 0                ; remove annoying blinking
        company-minimum-prefix-length 1
        company-require-match nil)

  (defun nema--company-backend-with-yas (backend)
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))

;; Icons and fancies
(use-package all-the-icons)

(use-package company-box
  :delight
  :hook (company-mode . company-box-mode)
  :config
  (setq company-box-backends-colors nil
        company-box-show-single-candidate t
        company-box-max-candidates 20
        company-box-doc-delay 0.5
        company-box-icons-alist 'company-box-icons-all-the-icons))

(provide 'lorq-completion)

;;; lorq-completion.el ends here

