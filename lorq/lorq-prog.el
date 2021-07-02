;;; lorq-prog.el --- summary ---
;;; Commentary: programming lanaguage set

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;   C/C++ ;;;;;;;;;;;;;;;;;;;;;;

;;My C Programming Style
(defconst lorq/c-style
  '((c-tab-always-indent . t)
    (c-comment-only-line-offset . 0)
    (c-hanging-braces-alist . ((substatement-open after)
                               (brace-list-open)))
    (c-hanging-colons-alist . ((member-init-intro before)
                               (inher-intro)
                               (case-label after)
                               (label after)
                               (access-label after)))
    (c-cleanup-list . (scope-operator
                       empty-defun-braces
                       defun-close-semi))
    (c-offsets-alist . ((arglist-close . c-lineup-arglist)
                        (substatement-open . 0)
                        (case-label . 4)
                        (block-open . 0)
                        (knr-argdecl-intro . -)))
    (c-echo-syntactic-information-p . t)
    ))

;; offset customizations not in lorq/c-style
(setq c-offsets-alist '((member-init-intro . ++)))

(defun lorq/c-mode-common-hook ()
  (c-add-style "PERSONAL" lorq/c-style t)
  (setq tab-width 4
        indent-tabs-mode nil)
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))

(add-hook 'c-mode-common-hook 'lorq/c-mode-common-hook)

(use-package cc-mode)
(use-package cmake-mode)
(use-package modern-cpp-font-lock
  :ensure t
  :config
  (modern-c++-font-lock-global-mode t))


(provide 'lorq-prog)

;;; lorq-prog.el ends here
