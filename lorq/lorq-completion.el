;;; lorq-completion.el --- auto completion ---
;;; Commentary:

;;; Code:
;; company
(use-package company
  :delight
  :hook (after-init . global-company-mode)
  :config
  (setq company-tooltip-align-annotations t
        company-tooltip-limit 20
        company-show-numbers t
        company-idle-delay .2               ; decrease delay before autocompletion popup shows
        company-echo-delay 0                ; remove annoying blinking
        company-selection-wrap-around t
        company-minimum-prefix-length 2
        company-require-match nil))

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
;; ivy
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1)
  :custom
  (ivy-height 15)
  (ivy-fixed-height-minibuffer t)
  (ivy-display-style 'fansy)
  (ivy-count-format "%d/%d"))

(use-package ivy-rich
   :init
   (ivy-rich-mode 1))

(use-package all-the-icons-ivy
  :ensure t
  :init
  (add-hook 'after-init-hook 'all-the-icons-ivy-setup))

(use-package ivy-posframe
  :ensure t
  :after ivy posframe
  :config
  ;; Different command can use different display function.
  (setq ivy-posframe-display-functions-alist
        '((swiper          . ivy-display-function-fallback)
          (complete-symbol . ivy-posframe-display-at-point)
          ;(counsel-M-x     . ivy-posframe-display-at-window-center)
          (counsel-M-x     . ivy-posframe-display-at-frame-center)
          (t               . ivy-posframe-display)))
  (ivy-posframe-mode t))

(use-package counsel
    :bind (("C-M-j" . 'counsel-switch-buffer)
          :map minibuffer-local-map
          ("C-r" . 'counsel-minibuffer-history))
    :custom
    (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
    :config
    (counsel-mode 1))

(provide 'lorq-completion)

;;; lorq-completion.el ends here

