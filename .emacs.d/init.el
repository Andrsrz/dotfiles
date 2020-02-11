;; load theme
;; make {copy, cut, paste, undo} have {C-c, C-x, C-v, C-z} keys
(cua-mode 1)
;; make emacs use standar keys
;; Find. was forward-char
(global-set-key (kbd "C-f") 'isearch-forward)
;; New. was next-line
(global-set-key (kbd "C-n") 'xah-new-empty-file)
;; New Window. was nil
(global-set-key (kbd "C-S-n") 'make-frame-command)
;; Open. was open-line
(global-set-key (kbd "C-o") 'ido-find-file)
;; Save. was isearch-forward
(global-set-key (kbd "C-s") 'save-buffer)
;; Save As. was nil
(global-set-key (kbd "C-S-s") 'write-file)
;; Close. was kill-region
(global-set-key (kbd "C-w") 'kill-buffer)

;; auto insert closing bracket
(electric-pair-mode 1)
;; turn on highlighting current line
(global-hl-line-mode 1)
;; turn on bracket match highlight
(show-paren-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (dracula)))
 '(display-line-numbers-type (quote relative))
 '(global-auto-revert-mode t)
 '(global-display-line-numbers-mode t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 117 :width normal)))))

;; Disable menu-bar
(menu-bar-mode 0)

;; Custom initial buffer
(setq initial-buffer-choice "~/Documents/projects")

;; Indentation to always use tab
(defun my-insert-tab-char ()
	"Insert a tar char. (ASCII 9, \t)"
	(interactive)
	(insert "\t"))

(global-set-key (kbd "TAB") 'my-insert-tab-char) ; same as Ctrl+i
;; Tab width
(setq tab-width 4)
;; Disable auto indentation
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

;; Install themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)
