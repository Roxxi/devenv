;; this is where I add files for extra functionality
(setq load-path (cons (expand-file-name "~/.emacs.d") load-path))
(server-start)

;; Mac preferences
(require 'mac)

;;; Bar Cursor configuration (I don't like the box cursor)
(require 'bar-cursor)
(bar-cursor-mode 1)

;;; COLUMN MARKER CONFIGURATION (I like knowing where the 80th column is)
(require 'column-marker)
(add-hook 'scheme-mode-hook (lambda () (interactive) (column-marker-3 80)))

;; Where we store temp files
(require 'temp-files)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Merced
;; (require 'merced)
;; (require 'erin) ;; twiki
;; OMG I NEED THIS
(setq unlog
   [?\C-\M-k right C-M-left ?\C-y ?\C-\M-k])
(global-set-key "\C-x\C-l" unlog)
(global-set-key "\C-c;" 'comment-region)
(global-set-key "\C-c'" 'uncomment-region)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Font needs to set before window dimensions for char-width
;; Font size... (each point of height is 1/10th pt e.g. 120 = 12pt)
(set-face-attribute 'default nil :height 140)

;;window dimensions
(setq default-frame-alist
 `(
; frame width and height
    (width             . ,(- (/ (/ (display-pixel-width) (frame-char-width)) 2) 4))
    (height            . ,(- (/ (display-pixel-height) (frame-char-height)) 7))
  )
)


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(delete-selection-mode t)
;; '(global-hl-line-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(save-place t nil (saveplace))
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(text-mode-hook (quote (text-mode-hook-identify)))
 '(transient-mark-mode (quote (only . t)))
 '(visible-cursor t))


;; todd made me this so I could open files from a given file name.
(global-set-key "\C-x\C-a" 'find-file-at-point)
(global-set-key [(control shift ?s)] 'list-matching-lines)



;; transparency!

;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(set-frame-parameter (selected-frame) 'alpha '(95 80))
(add-to-list 'default-frame-alist '(alpha 95 80))

(eval-when-compile (require 'cl))
(defun toggle-transparency ()
  (interactive)
  (if (/= (cadr (frame-parameter nil 'alpha)) 100)
      (set-frame-parameter nil 'alpha '(95 100))
    (set-frame-parameter nil 'alpha '(85 80))))
(global-set-key (kbd "C-c t") 'toggle-transparency)



;; iswitchb = makes C-x b awesome
(iswitchb-mode 1)

;;;
;;; C-c left undoes window config changes
;;;
(winner-mode)


;;;
;;; Change windows with S-<arrow>
;;;
(windmove-default-keybindings)

;;
;; show me what I'm marking
;;
(setq transient-mark-mode t)
;;
;; line wrapping
;;
(setq truncate-partial-width-windows nil)


;; show colored ls output in shell
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq visible-bell t)

(put 'erase-buffer 'disabled nil)

;; My very own customizations!
;; I don't like jerky scrolling
(setq scroll-step 1)

(put 'narrow-to-region 'disabled nil)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(cursor ((t nil))))


;; hide passwords in the shell
(defvar comint-password-prompt-regexp "\\(\\([Oo]ld \\|[Nn]ew \\|'s \\|login \\|Kerberos \\|CVS \\|UNIX \\| SMB \\|^\\|Enter \\)[Pp]assword\\( (again)\\)?\\|pass phrase\\|\\(Enter\\|Repeat\\|Bad\\) passphrase\\)\\(?:, try again\\)?\\(?: for [^:]+\\)?:\\s *\\'")
;; stop shell from echoing commands
(defun my-comint-init ()
  (setq comint-process-echoes t))
(add-hook 'comint-mode-hook 'my-comint-init 'comint-watch-for-password-prompt)
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Macros

;;; Set up a three column window
(fset 'three-column-disp
   [?\C-x ?1 ?\C-x ?3 ?\C-x ?3 ?\M-x ?b ?a ?l ?a tab return ?\C-x ?2 ?\C-x ?o ?\C-x ?o ?\C-x ?o ?\C-x ?2])
(global-set-key (kbd "C-c 3") 'three-column-disp)
(fset 'two-one-one
   [?\C-x ?1 ?\C-x ?3 ?\C-x ?3 ?\M-x ?b ?a ?l ?a ?n ?c ?e ?- tab return ?\C-x ?2])
(global-set-key (kbd "C-c 2") 'two-one-one)
(fset 'two-one
   "\C-x1\C-x3\C-x2")
(global-set-key (kbd "C-c 1") 'two-one)
(put 'three-column-disp 'kmacro t)
(put 'two-one-one 'kmacro t)
(put 'two-one 'kmacro t)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Editor identity reminders.  (try ESC : wq<RET>)
(setq w   "This is not vi, you klutz!")
(setq q   "vi is THAT OTHER editor, not THIS ONE.")
(setq w!  "This is not vi!  Don't do that!")
(setq q!  "That command wou¯ld be great if you were in vi.")
(setq wq  "This is not vi, dumbass!")
(setq wq! "This is EMACS you sleepyhead, not vi!")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; dired

;;; Load Dired-x when Dired is loaded.
(add-hook 'dired-load-hook '(lambda () (require 'dired-x)))

;; Enable toggling of uninteresting files.
(setq dired-omit-files-p t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; git
;; From https://github.com/tsgates/git-emacs
(require 'vc-git)
(add-to-list 'load-path (concat (getenv "HOME") "/.emacs.d/git-emacs"))
(require 'git-emacs)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; HTML

;;; Use html-helper-mode (not PSGML!)
(add-to-list 'auto-mode-alist '("\\.html?$" . html-mode))

;;; jsp
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . html-mode))

;;; javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SQL
(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (rename-buffer (concat "*SQL:" sql-user "@" sql-database "*"))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Java
(modify-coding-system-alist 'file "\\.java\\'" 'utf-8)
(modify-coding-system-alist 'file "\\.properties\\'" 'utf-8)
(modify-coding-system-alist 'file "\\.scm\\'" 'utf-8)
(modify-coding-system-alist 'file "\\.jsp\\'" 'utf-8)
(modify-coding-system-alist 'file "\\.js\\'" 'utf-8)







;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Scheme
(require 'scheme-indent)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Clojure
(require 'clojure-mode)


(setq compile-command "lein compile")
;; run the interpreter
(global-set-key "\C-xrc" 'inferior-lisp) 

;; To get syntax highlighting in your repl buffer, use this elisp:
(add-hook 'slime-repl-mode-hook
          (defun clojure-mode-slime-font-lock ()
            (require 'clojure-mode)
            (let (font-lock-mode)
              (clojure-mode-font-lock-setup))))

;;; Compojure formatting
(define-clojure-indent
  (defroutes 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ERC (Emacs IRC)

(setq erc-hide-list '("JOIN" "PART" "QUIT"))
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#clojure")
        ("freenode.net" "#leiningen")
        ;("aniverse.com" "#honobono")
        ))
(defun erc-go ()
  (interactive)
  (erc :server "irc.freenode.net" :port 6667 :nick "Roxxi")
  ;(erc :server "irc.aniverse.com" :port 6667 :nick "Roxxi")
  )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PHP
;; php mode sucks. Pretty much.
(require 'php-mode)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Color Theme

(add-to-list 'load-path (expand-file-name "~/.emacs.d/color-theme-6.6.0"))
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     ;; set the color theme here
     ;; to change it on the fly, M-x color-theme-<tab> for the list
     ;; (color-theme-standard) is the same as saying "nothing"
     (color-theme-hober)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Markdown mode
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md$" . gfm-mode))
(add-hook 'gfm-mode-hook 'turn-on-auto-fill)


          
