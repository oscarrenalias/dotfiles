(add-to-list 'load-path' "~/.emacs.d/")
(add-to-list 'load-path' "~/.emacs.d/puppet")

(load "puppet-mode")
(load "puppet-mode-init")

(add-to-list 'auto-mode-alist '("\\.pp\\'" . puppet-mode))

;; show line number and column number
(line-number-mode t)                     ;; show line numbers
(column-number-mode t)                   ;; show column numbers
(size-indication-mode t)
(global-linum-mode t)

(if (eq system-type "darwin")
    ;; needed in OS X so that I can get curly braces and square brackets
    (setq default-input-method "MacOSX")
  (setq mac-command-modifier 'meta
	mac-option-modifier nil
	mac-allow-anti-aliasing t
	mac-command-key-is-meta t)
)