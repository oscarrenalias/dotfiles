(add-to-list 'load-path' "~/.emacs.d/")
(add-to-list 'load-path' "~/.emacs.d/puppet")

(load "puppet-mode")
(load "puppet-mode-init")

(add-to-list 'auto-mode-alist '("\\.pp\\'" . puppet-mode))
