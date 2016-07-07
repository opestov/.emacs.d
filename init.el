;; inspired by https://github.com/magnars/.emacs.d

;; emacs server
(require 'server)
(server-start)

;; set up load path
(setq settings-dir (expand-file-name "settings" user-emacs-directory))
(add-to-list 'load-path settings-dir)

;; install MELPA repository
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(require 'general)
;(require 'setup-editor)
;(require 'setup-ido)
;(require 'setup-magit)
;(require 'setup-dired)
;(require 'setup-projectile)
;(require 'setup-org-journal)
;(require 'setup-org-mode)
;(require 'setup-yasnippet)
