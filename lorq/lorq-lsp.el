
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
        lsp-session-file "~/.emacs/.cache/lsp-sessions" ;; 给缓存文件换一个位置
        lsp-keymap-prefix "C-l") ;; keymap prefix
  :config
  (lsp-enable-which-key-integration t)
  )

;; 内容呈现
(use-package lsp-ui
  ;; 仅在某软件包被加载后再加载
  :after (lsp-mode)
  ;; 延时加载
  :commands (lsp-ui-mode)
  :bind
  (:map lsp-ui-mode-map
        ;; 查询符号定义：使用 LSP 来查询。通常是 M-.
        ([remap xref-find-references] . lsp-ui-peek-find-references)
        ;; 查询符号引用：使用 LSP 来查询。通常是 M-?
        ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
        ;; 该文件里的符号列表：类、方法、变量等。前提是语言服务支持本功能。
        ("C-c u" . lsp-ui-imenu))
  ;; 当 lsp 被激活时自动激活 lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :init
  ;; lsp-ui 有相当细致的功能开关。具体参考：
  ;; https://github.com/emacs-lsp/lsp-mode/blob/master/docs/tutorials/how-to-turn-off.md
  (setq lsp-enable-symbol-highlighting t
	lsp-ui-peek-enable t
	lsp-ui-imenu-enable t
	lsp-ui-flycheck-enable t
        lsp-ui-doc-enable nil
        lsp-lens-enable t))


(use-package cc-mode)
(use-package cmake-mode)

(provide 'lorq-lsp)
