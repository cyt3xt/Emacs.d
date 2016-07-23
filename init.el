
;;; Version Requirement
(when (version<= emacs-version "24")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))


;;; Set up package
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)


;;; use-package : used to configure rest of packages
;; Install
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq use-package-verbose t)


;;; Basic config
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)

(setq inhibit-startup-message t)
(setq initial-scratch-message "")

(use-package auto-compile
  :ensure t
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

(require 'diminish)
(require 'bind-key)


;;; UI
;; Terminal
(unless window-system
  (defconst *is-a-terminal* t)
  (message "It is a Terminal")
  (menu-bar-mode -1))
;; Window-System
(when window-system 
  (if (eq system-type 'darwin)
      ;; Mac
      (progn
        (defconst *is-a-mac* t)
        (message "System is a Mac"))
    ;; Linux
    (progn
      (defconst *is-a-linux* t)))
  (org-babel-load-file (concat user-emacs-directory "config.org")))



