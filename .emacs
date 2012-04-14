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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Merced
(require 'merced)
(require 'temp-files)
(require 'erin) ;; twiki
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; window dimensions
(setq default-frame-alist
 '(
; frame width and height
    (width             . 200)
    (height            . 56)
  )
)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(delete-selection-mode t)
 '(global-hl-line-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(save-place t nil (saveplace))
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(transient-mark-mode (quote (only . t)))
 '(visible-cursor t))


;; todd made me this so I could open files from a given file name.
(global-set-key "\C-x\C-a" 'find-file-at-point)
(global-set-key [(control shift ?s)] 'list-matching-lines)


;; transparency!

;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(set-frame-parameter (selected-frame) 'alpha '(85 70))
(add-to-list 'default-frame-alist '(alpha 85 70))

(eval-when-compile (require 'cl))
(defun toggle-transparency ()
  (interactive)
  (if (/= (cadr (frame-parameter nil 'alpha)) 100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(85 70))))
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

;; NOTE comment this out when you want to use bake/guru/merced compile commands
(setq compile-command "lein compile")
;; run the interpreter
(global-set-key "\C-xrc" 'inferior-lisp) 



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PHP
;; php mode sucks. Pretty much.
(require 'php-mode)

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


;; stop shell from echoing commands
(defun my-comint-init ()
  (setq comint-process-echoes t))
(add-hook 'comint-mode-hook 'my-comint-init)



