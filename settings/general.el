;; no splash screen please
(setq inhibit-startup-message t)

;; remove distractions
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; use unicode by default
(set-language-environment 'utf-8)

;; 80 chars is a good width
(setq-default fill-column 80)
;; don't break lines
(setq-default truncate-lines t)

;; disable on-the-fly reindentation
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))
;; by default do not use tab for indentation
(setq tab-always-indent nil)
;; place tab stops on even columns
(set-default 'tab-width 2)

;; show empty lines after buffer end
(setq-default indicate-empty-lines t)
;; add a newline at the end of the file when it is about to be saved
(setq require-final-newline t)

;; remove text in active region if inserting text
(delete-selection-mode 1)

;; toggle visualization of matching parens
(show-paren-mode 1)

;; always show line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; in readline C-w kills the word behind point,
(defun kill-region-or-backward-word ()
    "If the region is active and non-empty, call `kill-region'. Otherwise, call `backward-kill-word'."
    (interactive)
    (call-interactively
     (if (use-region-p) 'kill-region 'backward-kill-word)))
(global-set-key (kbd "C-w") 'kill-region-or-backward-word)
;; use shell-like backspace C-h
(define-key key-translation-map [?\C-h] [?\C-?])
;; press f1 to get help
(global-set-key (kbd "<f1>") 'help-command)

;; C-\
(setq default-input-method "russian-computer")
(require 'quail)
(add-to-list 'quail-keyboard-layout-alist
             `("dvorak" . ,(concat "                              "
				   "  1!2@3#4$5%6^7&8*9(0)[{]}`~  "
				   "  '\",<.>pPyYfFgGcCrRlL/?=+    "
				   "  aAoOeEuUiIdDhHtTnNsS-_\\|    "
				   "  ;:qQjJkKxXbBmMwWvVzZ        "
				   "                              ")))
(quail-set-keyboard-layout "dvorak")

;; disable bell
(setq ring-bell-function 'ignore)

;; when visit two files with the same name in different directories, the buffer
;; names have the directory name appended to them
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; disable autosave
(setq auto-save-default nil)
;; prevent the creation of lock files: Interlocking.html#Interlocking
(setq create-lockfiles nil)

(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      vc-make-backup-files t)
(setq delete-by-moving-to-trash t)
(setq echo-keystrokes 0.1)

(provide 'general)
