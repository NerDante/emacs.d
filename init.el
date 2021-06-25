;;; init.el --- init ---
;;; Commentary:

;;; Code:
(require 'package)
;; Error (use-package): Failed to install lsp-mode: Failed to verify signature: "spinner-1.7.3.el.sig"
(setq package-check-signature nil)
(package-initialize)

;; set package sources
(add-to-list 'package-archives '("melpa-cn" . "http://elpa.emacs-china.org/melpa/"))
(add-to-list 'package-archives '("org-cn" . "http://elpa.emacs-china.org/org/"))
(add-to-list 'package-archives '("gnu-cn" . "http://elpa.emacs-china.org/gnu/"))

(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; load path
(add-to-list 'load-path
             (expand-file-name "lorq" user-emacs-directory))
(add-to-list 'load-path
             (expand-file-name "misc" user-emacs-directory))

;; download lisp not support use-package
(require 'unicad) ;; universal charset auto detector
(require 'awesome-tab)

;; submodules
(require 'lorq-appearance)
(require 'lorq-keymap)
(require 'lorq-completion)
(require 'lorq-evil)
(require 'lorq-lsp)
(require 'lorq-dashboard)
(require 'lorq-project)
(require 'lorq-org)
(require 'lorq-edit)
(require 'lorq-git)
(require 'lorq-snippet)
(require 'lorq-treemacs)

;; machine depended confit put into custom.el
(setq custom-file "~/.emacs.d/custom.el")
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
(load custom-file)

;;; init.el ends here

