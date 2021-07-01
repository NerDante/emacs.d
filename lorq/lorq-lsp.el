;;; lorq-lsp.el --- lsp ---
;;; Commentary:

;;; Code:

(use-package lsp-mode
  ;; 延时加载：仅当 (lsp) 函数被调用时再 (require)
  :commands (lsp)
  ;; 在哪些语言 major mode 下启用 LSP
  :hook (((cc-mode
           ;; ......
           ) . lsp))
  :init ;; 在 (reuqire) 之前执行
  (setq lsp-auto-configure t ;; 尝试自动配置自己
        lsp-auto-guess-root t ;; 尝试自动猜测项目根文件夹
        lsp-idle-delay 0.500 ;; 多少时间idle后向服务器刷新信息
        lsp-diagnostic-package :none ;; disable diagnostic
        lsp-session-file "~/.emacs/.cache/lsp-sessions") ;; 给缓存文件换一个位置
  :general
  (my-leader-def "l" '(:keymap lsp-command-map :which-key "lsp"))
  :config
  (lsp-enable-which-key-integration t))

;; 内容呈现
(use-package lsp-ui
  ;; 仅在某软件包被加载后再加载
  :after (lsp-mode)
  ;; 延时加载
  :commands (lsp-ui-mode)
  ;; 当 lsp 被激活时自动激活 lsp-ui
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

