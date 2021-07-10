;;; lorq-edit.el --- edit ---
;;; Commentary:

;;; Code:

;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)

;; hight current line
(global-hl-line-mode t)
;; Reduce the frequency of garbage collection by making it happen on
;; each 100MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold (* 100 1024 1024))

;; Increase the amount of data which Emacs reads from the
;; process. Again the emacs default is too low 4k considering that the
;; some of the language server responses are in 800k - 3M range.
(setq read-process-output-max (* 5 1024 1024))

;; Don’t compact font caches during GC.
(setq inhibit-compacting-font-caches t)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold (* 100 1024 1024))

;;; smartparens
(use-package smartparens
  :init
  (bind-key "C-M-f" #'sp-forward-sexp smartparens-mode-map)
  (bind-key "C-M-b" #'sp-backward-sexp smartparens-mode-map)
  (bind-key "C-)" #'sp-forward-slurp-sexp smartparens-mode-map)
  (bind-key "C-(" #'sp-backward-slurp-sexp smartparens-mode-map)
  (bind-key "M-)" #'sp-forward-barf-sexp smartparens-mode-map)
  (bind-key "M-(" #'sp-backward-barf-sexp smartparens-mode-map)
  (bind-key "C-S-s" #'sp-splice-sexp)
  (bind-key "C-M-<backspace>" #'backward-kill-sexp)
  (bind-key "C-M-S-<SPC>" (lambda () (interactive) (mark-sexp -1)))

  :config
  (smartparens-global-mode t)
  (show-smartparens-global-mode t)
  (sp-pair "'" nil :actions :rem)
  (sp-pair "`" nil :actions :rem)
  (setq sp-highlight-pair-overlay nil))

;;; avy
(use-package avy
  :config
  (setq avy-background t ;; 打关键字时给匹配结果加一个灰背景，更醒目
        avy-all-windows t ;; 搜索所有 window，即所有「可视范围」
        avy-timeout-seconds 0.1)) ;; 「关键字输入完毕」信号的触发时间

;;; tab width
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;;; symbol-overlay
(use-package symbol-overlay
  :ensure t)
  :general
  (my-leader-def "m" '(:keymap symbol-overlay-map :which-key "symbol-overlay"))

;;; expand-region
(use-package expand-region
  :ensure t)

(provide 'lorq-edit)

;;; lorq-edit.el ends here
