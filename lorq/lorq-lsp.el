;;; lorq-lsp.el --- lsp ---
;;; Commentary:

;;; Code:

(use-package lsp-mode
  ;; 延时加载：仅当 (lsp) 函数被调用时再 (require)
  :commands (lsp)
  :hook (((cc-mode
           c-mode
           c++-mode
           ;; ......
           ) . lsp))
  :init
  (setq lsp-auto-configure t
        lsp-auto-guess-root t
        lsp-idle-delay 0.500
        lsp-diagnostic-package :none ;; disable diagnostic
        lsp-session-file "~/.emacs/.cache/lsp-sessions")
  :general
  (my-leader-def "l" '(:keymap lsp-command-map :which-key "lsp"))
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-ui
  :after (lsp-mode)
  :commands (lsp-ui-mode)
  :hook (lsp-mode . lsp-ui-mode)
  :init
  ;; lsp-ui 有相当细致的功能开关。具体参考：
  ;; https://github.com/emacs-lsp/lsp-mode/blob/master/docs/tutorials/how-to-turn-off.md
  (setq lsp-enable-symbol-highlighting t
	lsp-ui-imenu-enable t
    lsp-ui-doc-enable t 
	lsp-ui-sideline-show-code-action t
	lsp-ui-sideline-show-diagnostics nil 
	lsp-modeline-code-actions-enable t 
	lsp-ui-sideline-show-hover nil
	lsp-headerline-breadcrumb-enable nil
	lsp-signature-render-documention nil
	lsp-signature-auto-active nil
    lsp-lens-enable t))

(provide 'lorq-lsp)

;;; lorq-lsp.el ends here

