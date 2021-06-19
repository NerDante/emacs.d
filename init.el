;;; entrance of config

(require 'package)
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

;; Core config files
(add-to-list 'load-path
             (expand-file-name "lorq" user-emacs-directory))

;; submodules
(require 'lorq-appearance)
(require 'lorq-keymap)
(require 'lorq-completion)
(require 'lorq-evil)
(require 'lorq-ivy)
(require 'lorq-lsp)

;; machine depended confit put into custom.el
(setq custom-file "~/.emacs.d/custom.el")
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
(load custom-file)

;;; end of init.el

