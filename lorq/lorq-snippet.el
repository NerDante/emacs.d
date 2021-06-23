;;; lorq-snippet.el --- snippet---
;;; Commentary:

;;; Code:
(use-package yasnippet
  :config
  (yas-global-mode 1)
  (setq yas-snippet-dirs
	'("~/.emacs.d/snippets")))

(use-package yasnippet-snippets
 :after (yasnippet))

(provide 'lorq-snippet)


(provide 'lorq-snippet)

;;; lorq-snippet.el ends here

