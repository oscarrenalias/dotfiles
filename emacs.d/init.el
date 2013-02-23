(add-to-list 'load-path' "~/.emacs.d/")
(add-to-list 'load-path' "~/.emacs.d/puppet")
(add-to-list 'load-path' "~/.emacs.d/color-theme-6.6.0")

(load "puppet-mode")
(load "puppet-mode-init")

(add-to-list 'auto-mode-alist '("\\.pp\\'" . puppet-mode))
(put 'upcase-region 'disabled nil)

;; show line number and column number
(line-number-mode t)                     ;; show line numbers
(column-number-mode t)                   ;; show column numbers
(size-indication-mode t)
(if (fboundp 'global-linum-mode)
    (global-linum-mode t))

(if (eq system-type "darwin")
    ;; needed in OS X so that I can get curly braces and square brackets
    (setq default-input-method "MacOSX")
  (setq mac-command-modifier 'meta
	mac-option-modifier nil
	mac-allow-anti-aliasing t
	mac-command-key-is-meta t)
)

;; load the color theme module and set my preferred theme
(require 'color-theme)
;; or this one when using it in X
(if (not (display-graphic-p))
    (eval-after-load "color-theme"
      '(progn
	 (color-theme-initialize)
	 (color-theme-renegade))))
;; use this theme when using emacs from the console
(if (display-graphic-p)
    (eval-after-load "color-theme"
      '(progn
	 (color-theme-initialize)
	 (require 'color-theme-oscar)
	 (color-theme-oscar))))