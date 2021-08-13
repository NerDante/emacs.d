;;; lorq-snippet.el --- snippet---
;;; Commentary:

;;; Code:
(use-package yasnippet
  :config
  (yas-global-mode 1)
  (setq yas-snippet-dirs
	'("~/.emacs.d/snippets")))

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
;; Bind `SPC' to `yas-expand' when snippet expansion available
; (define-key yas-minor-mode-map (kbd "SPC") yas-maybe-expand)
(define-key yas-minor-mode-map (kbd "C-<tab>") #'yas-expand)

(provide 'lorq-snippet)

;;; lorq-snippet.el ends here

