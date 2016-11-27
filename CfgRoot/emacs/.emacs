(load-theme 'wombat)
(setq frame-title-format "emacs")
'(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-default 'cursor-type 'hbar)
(ido-mode)
(column-number-mode)
(show-paren-mode)
(winner-mode t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t )
(package-initialize)



