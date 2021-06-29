;;; lorq-appearance.el --- appearance ---
;;; Commentary:

;;; Code:

(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(menu-bar-mode -1)          ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell t)

;; set fullscreen while startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; font
(set-face-attribute 'default nil :height 138)

;; if get error while connect raw.githubusercontent.com:443, edit hosts file,
;; find ways here ->   https://learnku.com/articles/40037
(use-package all-the-icons
  :if (display-graphic-p)
  :commands all-the-icons-install-fonts
  :init
  (unless (find-font (font-spec :name "all-the-icons"))
    (all-the-icons-install-fonts t)))

(use-package all-the-icons-dired
  :if (display-graphic-p)
  :hook (dired-mode . all-the-icons-dired-mode))

;; show numers
(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative) 
;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook
                treemacs-mode-hook))
    (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package rainbow-delimiters
   :hook (prog-mode . rainbow-delimiters-mode))

(use-package doom-themes
  :init (load-theme 'doom-one t))

;; awesome-tab
(awesome-tab-mode t)
(setq
  awesome-tab-height 128
  ;; awesome-tab-display-sticky-function-name t
  awesome-tab-index-format-str " %d"
  awesome-tab-show-tab-index t)

(provide 'lorq-appearance)

;;; lorq-appearance.el ends here
