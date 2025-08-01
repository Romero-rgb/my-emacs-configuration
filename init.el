;; Load a dark mode theme
(load-theme 'deeper-blue t)

;; Disable menu bar, scroll bar, and tool bar
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq gc-cons-threshold 100000000) ; 100 mb
(setq read-process-output-max (* 1024 1024)) ; 1mb

;; Auto-refresh buffers when files on disk change.
(global-auto-revert-mode t)

;; Ensure unique names when matching files exist in the buffer.
;; e.g. This helps when you have multiple copies of "main.rs"
;; open in different projects. It will add a "myproj/main.rs"
;; prefix when it detects matching names.
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Place backups in a separate folder.
(setq backup-directory-alist `(("." . "~/.saves")))
(setq auto-save-file-name-transforms `((".*" "~/.saves/" t)))

;; I store automatic customization options in a gitignored file,
;; but this is definitely a personal preference.
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; You'll be installing your packages with the
;; built-in package.el script
(require 'package)

;; Add MELPA to your list of package archives
(add-to-list 'package-archives
	         '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Go ahead and refresh your package list to
;; make sure everything is up-to-date
(unless package-archive-contents
  (package-refresh-contents))

;; API to control the packages
(unless (package-installed-p 'use-package)
  (package-install 'use-package))



(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package marginalia
  :after vertico
  :ensure t
  :init
  (marginalia-mode))

(use-package savehist
  :init
  (savehist-mode))
