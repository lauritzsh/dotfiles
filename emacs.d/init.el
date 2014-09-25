;; Getting rid of menu and toolbar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Full height
(add-to-list 'initial-frame-alist `(fullscreen . fullheight))
(add-to-list 'default-frame-alist `(fullscreen . fullheight))
;; Highlight paranthesis on hover
(show-paren-mode 1)

;; Add MELPA to package archives
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)

;; Helper variables/functions
(defconst is-osx (eq system-type 'darwin))

;; Setup use-package
(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

(require 'use-package)

;; Implicit `:ensure t'
(setq use-package-always-ensure t)

;; Theme
(use-package zenburn-theme)

;; Highlight paranthesis on hover
(setq show-paren-style 'parenthesis)

;; Better way to search buffers and files
(require 'ido)
(ido-mode t)

;; Install and configure packages
(when is-osx
  (use-package exec-path-from-shell))

(use-package fsharp-mode
  :config
  (add-hook 'fsharp-mode-hook
            (lambda ()
              (define-key fsharp-mode-map (kbd "M-RET") 'fsharp-eval-region))))

(use-package evil
  :config
  (evil-mode 1))

(use-package auto-complete
  :config
  (ac-config-default))

(use-package whitespace-cleanup-mode)

(use-package markdown-mode)

(use-package org)

(use-package linum-relative
  :config
  (global-linum-mode 1)
  (setq linum-relative-current-symbol ""))

(use-package inf-ruby)
(use-package ruby-tools)
(use-package ruby-end
  :config
  (setq ruby-end-insert-newline nil))
(use-package enh-ruby-mode
  :mode
  ("\\.rb\\'"    . enh-ruby-mode)
  ("\\.ru\\'"    . enh-ruby-mode)
  ("Gemfile"     . enh-ruby-mode)
  ("Rakefile"    . enh-ruby-mode)
  ("Vagrantfile" . enh-ruby-mode)

  :config
  (add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
  (add-hook 'enh-ruby-mode-hook 'ruby-tools-mode)
  (add-hook 'enh-ruby-mode-hook 'ruby-end-mode))

(use-package clojure-mode)
(use-package clojure-mode-extra-font-locking)
(use-package cider)
(use-package paredit)
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package smex
  :config
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))

(use-package magit)

(use-package web-mode
  :mode
  ("\\.html?\\'"      . web-mode)
  ("\\.erb\\'"        . web-mode)
  ("\\.jsx?\\'"       . web-mode)
  ("\\.ios.js\\'"     . web-mode)
  ("\\.android.js\\'" . web-mode)

  :config
  (setq web-mode-enable-auto-quoting nil)
  (setq web-mode-content-types-alist
        '(("jsx" . "\\.jsx\\'")
          ("jsx" . "\\.ios.js\\'")
          ("jsx" . "\\.android.js\\'"))))

;; Auto insert matching brackets
(electric-pair-mode 1)

;; Tabs and spaces
(setq-default indent-tabs-mode nil)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

;; Move backup files
(make-directory "~/.emacs.d/backups")
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq backup-by-copying t)
