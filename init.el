

(when (version<= emacs-version "24")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(setq inhibit-startup-message t)
(setq initial-scratch-message "")


;;; Set up package
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)


;;; Bootstrap use-package
;; Install use-package if it's not already installed.
;; use-package is used to configure the rest of the packages.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package auto-compile
  :ensure t
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

(require 'diminish) ;; if you use :diminish
(require 'bind-key)

(setq use-package-verbose t)

;;; Load the config

;;; Terminal
(when (eq window-system 'nil)
  (defconst *is-a-terminal* t)
  (message "It is a Terminal"))

;;; Window-System
(when window-system
  ;;(menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1)
  ;;; Mac
  (when (eq system-type 'darwin)
  (defconst *is-a-mac* t)
  (message "System is a Mac"))
  ;;; Linux
  ;; (when (eq system-type 'darwin)
  ;;   (defconst *is-a-mac* t)
  ;;   (message "System is a Mac"))
  (org-babel-load-file (concat user-emacs-directory "config.org"))
  )



