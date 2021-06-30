;;; lorq-prog.el --- summary ---
;;; Commentary: programming lanaguage set

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;   C/C++ ;;;;;;;;;;;;;;;;;;;;;;

;; c indent style
(setq c-default-style "linux"
      c-basic-offset 4)

(use-package cc-mode)
(use-package cmake-mode)

(use-package modern-cpp-font-lock
  :ensure t
  :config
  (modern-c++-font-lock-global-mode t))


(provide 'lorq-prog)

;;; lorq-prog.el ends here
