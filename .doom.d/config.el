;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Andres Ruiz"
	user-mail-address "andrsruiz@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Mononoki Nerd Font Mono" :size 15))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-dracula)

;; If you intend to use org, it is recommended you change this!
;;(setq org-directory "~/org/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

; START CONFIGS
(require 'multiple-cursors)
(require 'magit)
(require 'vue-mode)
(require 'nvm)
(require 'neotree)
(require 'restclient)
(require 'gdscript-mode)
;; When you have an active region that spans multiple lines, the following will
;; add a cursor to each line:
(global-set-key (kbd "C-S-c RET") 'mc/edit-lines)
;; When you want to add multiple cursors not based on continuous lines, but based on
;; keywords in the buffer, use:
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
; END MULTIPLE-CURSOR CONFIG

; START MAGIT CONFIG
(setq magit-view-git-manual-method 'man)
(global-set-key (kbd "C-x g") 'magit-status)
; END MAGIT CONFIG

; START TABS CONFIG
;; Create a variable for our preferred tab width
(setq custom-tab-width 4)
(setq custom-tab-width-for-web 2)

;; Two callable functions for enabling/disabling tabs in Emacs
(defun disable-tabs () (setq indent-tabs-mode nil))
(defun enable-tabs  ()
	(local-set-key (kbd "TAB") 'tab-to-tab-stop)
	(setq indent-tabs-mode t)
	(setq tab-width custom-tab-width))
(defun enable-tabs-for-web ()
	(local-set-key (kbd "TAB") 'tab-to-tab-stop)
	(setq indent-tabs-mode t)
	(setq tab-width custom-tab-width-for-web))

;; Hooks to Enable Tabs
(add-hook 'prog-mode-hook 'enable-tabs)
(add-hook 'c-mode-hook 'enable-tabs)
(add-hook 'c++-mode-hook 'enable-tabs)
(add-hook 'python-mode-hook 'enable-tabs)
(add-hook 'ruby-mode-hook 'enable-tabs)
(add-hook 'lua-mode-hook 'enable-tabs)
(add-hook 'php-mode-hook 'enable-tabs)
(add-hook 'web-mode 'enable-tabs-for-web)
(add-hook 'html-mode-hook 'enable-tabs-for-web)
(add-hook 'css-mode-hook 'enable-tabs-for-web)
(add-hook 'js2-mode-hook 'enable-tabs)
(add-hook 'js-mode-hook 'enable-tabs)
(add-hook 'vue-mode 'enable-tabs-for-web)
(add-hook 'typescript-mode 'enable-tabs-for-web)
(add-hook 'org-mode-hook 'enable-tabs)
(add-hook 'lisp-mode-hook 'enable-tabs)
(add-hook 'emacs-lisp-mode-hook 'enable-tabs)
(add-hook 'gdscript-mode 'enable-tabs)

;; Language-Specific Tweaks
(setq-default python-indent-offset custom-tab-width)  ;; Python
(setq-default web-mode-markup-indent-offset custom-tab-width-for-web)
(setq-default web-mode-css-indent-offset custom-tab-width-for-web)
(setq-default web-mode-script-padding custom-tab-width-for-web)
(setq-default css-indent-offset custom-tab-width-for-web) ;; CSS
(setq-default js2-indent-hook custom-tab-width-for-web) ;; JavaScript

;; Making electric-indent behave sanely
(setq-default electric-indent-inhibit t)
;; make return key also do indent, globally
(electric-indent-mode 1)

; END TABS CONFIG

;; Make the backspace properly erase the tab instead of
;; removing 1 space at a time.
(setq backward-delete-char-untabify-method 'hungry)

;; Visualize tabs as a pipe character - "|"
;; This will also show trailing characters as they are useful to spot.
(setq whitespace-style '(face tabs tab-mark trailing))
(custom-set-faces
	'(whitespace-tab ((t (:foreground "#383A59")))))
(setq whitespace-display-mappings
	'((tab-mark 9 [124 9] [92 9]))) ; 124 is the ascii ID for '\|'
(global-whitespace-mode) ; Enable whitespace mode everywhere

;; Vue Config
(add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))
(add-hook 'vue-mode-hook 'lsp!)
(add-hook 'vue-mode-hook
	(lambda()
		(set-face-background 'mmm-default-submode-face nil)))

;; setup files ending in ".ts"
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
(defun gt/typescript-mode-setup ()
  "Custom setup for Typescript mode"
  (setq flycheck-checker 'javascript-eslint)
  )
(add-hook 'typescript-mode-hook 'gt/typescript-mode-setup)

;; GDScript Config
(setq gdscript-use-tab-indents t) ;; If true, use tabs for indents. Default: t
(setq gdscript-indent-offset 4) ;; Controls the width of tab-based indents

