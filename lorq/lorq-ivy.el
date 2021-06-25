;;; lorq-ivy.el --- ivy ---
;;; Commentary:

;;; Code:

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

(use-package counsel
    :bind (("C-M-j" . 'counsel-switch-buffer)
          :map minibuffer-local-map
          ("C-r" . 'counsel-minibuffer-history))
    :custom
    (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
    :config
    (counsel-mode 1))

(provide 'lorq-ivy)

;;; lorq-ivy.el ends here

