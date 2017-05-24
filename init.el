;; emacs server
(require 'server)
(server-start)

;; remove distractions
(setq inhibit-startup-message t)
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; open empty scratch buffer in text mode
(setq initial-major-mode 'text-mode)
(setq initial-scratch-message nil)

;; disable colors
(global-font-lock-mode 0)

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
;; make sure that tab-to-tab-stop also use spaces
(set-default 'indent-tabs-mode nil)
;; place tab stops
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

;; C-w kills the word behind point (like in readline)
;; If the region is active and non-empty, call `kill-region'
(defun kill-region-or-backward-word ()
  (interactive)
  (call-interactively (if (use-region-p) 'kill-region 'backward-kill-word)))
(global-set-key (kbd "C-w") 'kill-region-or-backward-word)

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

;; stop creating backup files
(setq make-backup-files nil) 
;; disable autosave
(setq auto-save-default nil)
;; prevent the creation of lock files: Interlocking.html#Interlocking
(setq create-lockfiles nil)

(setq delete-by-moving-to-trash t)
(setq echo-keystrokes 0.1)

(global-set-key (kbd "<f1>") 'help-command)

;; use Readline-like shortcuts
(dolist (key '("\C-c" "\C-o" "\C-v" "\C-z"))
  (global-unset-key key))

(global-set-key (kbd "C-a") 'move-beginning-of-line)
(global-set-key (kbd "C-b") 'backward-char)
(global-set-key (kbd "C-d") 'delete-char)
(global-set-key (kbd "C-e") 'move-end-of-line)
(global-set-key (kbd "C-f") 'forward-char)
(global-set-key (kbd "C-g") 'keyboard-quit)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-i") 'tab-to-tab-stop)
(global-set-key (kbd "TAB") 'tab-to-tab-stop)
(global-set-key (kbd "C-j") 'newline-and-indent)
(global-set-key (kbd "C-k") 'kill-line)
(global-set-key (kbd "C-l") 'recenter-top-bottom)
(global-set-key (kbd "<RET>") 'newline-and-indent) ; C-m and Enter
(global-set-key (kbd "C-n") 'next-line)
(global-set-key (kbd "C-p") 'previous-line)
(global-set-key (kbd "C-q") 'quoted-insert) 
(global-set-key (kbd "C-r") 'isearch-backward)
(global-set-key (kbd "C-s") 'isearch-forward)
(global-set-key (kbd "C-t") 'transpose-chars)
(global-set-key (kbd "C-u") '(lambda () (interactive) (kill-line 0)))
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-y") 'yank)



