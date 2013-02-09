(add-to-list 'load-path' "~/.emacs.d/")
(add-to-list 'load-path' "~/.emacs.d/puppet")

(load "puppet-mode")
(load "puppet-mode-init")

(add-to-list 'auto-mode-alist '("\\.pp\\'" . puppet-mode))
(put 'upcase-region 'disabled nil)

;; show line number and column number
(line-number-mode t)                     ;; show line numbers
(column-number-mode t)                   ;; show column numbers
(size-indication-mode t)
(global-linum-mode t)
