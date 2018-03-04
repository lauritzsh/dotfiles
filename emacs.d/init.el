;; load package manager
;; add MELPA and org as package registry
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org"   . "https://orgmode.org/elpa/") t)

(package-initialize)

;; disable bell ring
(setq ring-bell-function 'ignore)

;; disable startup screen
(setq inhibit-startup-message t)

;; disable .#files
(setq create-lockfiles nil)

;; disable toolbar
(tool-bar-mode -1)

;; insert newline at end of file
(setq require-final-newline t)

;; put the custom-set-variables in a different file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; bootstrap use-package if not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

;; move backup files to a temporary directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq org-agenda-files '("/keybase/private/lauritzsh/todos.org"))

;; Vim package
(use-package evil
  :ensure t
  :config
  (evil-mode))

;; Org package
(use-package org
  :ensure org-plus-contrib
  :pin org
  :config
  ;; open agenda in current window
  (setq org-agenda-window-setup (quote current-window))
  ;; open agenda with C-c a
  (global-set-key (kbd "C-c a") 'org-agenda)

  (define-key global-map (kbd "C-c c") 'org-capture)
  ;; capture todo items using C-c c t
  (setq org-capture-templates
	'(("t" "todo" entry (file+headline "/keybase/private/lauritzsh/todos.org" "Tasks")
	   "* TODO [#A] %?"))))

;; latex package
(use-package auctex
  :defer t
  :config
  (add-hook 'latex-mode-hook #'auto-fill-mode)
  ;; required for previewing math with auctex
  (setenv "LANG" "en_US.UTF-8"))

;; elixir package
(use-package alchemist)

;; auto-completion
(use-package company
  :ensure t
  :pin melpa
  :init
  (add-hook 'after-init-hook 'global-company-mode))

;; smartparans
(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (require 'smartparens-config)
  (smartparens-global-mode 1))

(use-package flx-ido
  :ensure t
  :config
  (setq ido-enable-flex-matching t))

(use-package projectile
  :ensure t
  :config
  (projectile-mode))

(use-package emmet-mode
  :ensure t
  :init
  (add-hook 'sgml-init-hook 'emmet-mode)
  (add-hook 'css-init-hook 'emmet-mode))

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))
