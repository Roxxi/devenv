
; font
;(set-default-font "-adobe-courier-medium-r-normal--12-120-75-75-m-70-iso8859-1")
;(set-default-font "lucidasans-12")

;; perforce plugin!
;(setq load-path (cons "/usr/local/emacs/perforce" load-path))
(setenv "P4CLIENT" "abahouth1")
(setenv "P4USER" "abahouth")
(setq p4-executable "/usr/local/bin/p4")
(load-library "p4")



;;sqlplus plugin!
(require 'sqlplus)
(add-to-list 'auto-mode-alist '("\\.sqp\\'" . sqlplus-mode))

;;; Merced Specific
(defvar my-full-name "Alex Bahouth")

(add-to-list 'auto-mode-alist '("\\.cbeans?$" . scheme-mode))
(add-to-list 'auto-mode-alist '("\\.hammer\\'" . scheme-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Mercedize compilation-mode (a.k.a. M-x compile)
;;;

(setq compile-command "bake install")

;;; scheme
(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Switch to interactive Scheme buffer." t)
(when (getenv "MERCED_HOME")
  (setq scheme-program-name 
	(concat (directory-file-name (getenv "MERCED_HOME")) 
		"/bin/m ischeme -s")))

(defun my-inferior-scheme-mode-hook ()
  (turn-on-font-lock)
  (setq comint-prompt-regexp "^#[^#]+# +"))
(add-hook 'inferior-scheme-mode-hook 'my-inferior-scheme-mode-hook)

;;
;; Preprend Merced module path to error file names.  This way, when
;; you get errors in the compilation output window, you can just hit
;; enter on top of them, and it'll be able to find the right file and
;; line...
;;
(setq compilation-parse-errors-filename-function
      (lambda (raw-filename)
        (if (string-match "^\\(.+/src/\\)" default-directory)
            (let ((base-dir (match-string 0 default-directory)))
              (concat base-dir raw-filename))
          raw-filename)))

;; if you run p4 login in your emacs shell it hides the password you're typing in


;; I don't like typing M-x compile all the time
(global-set-key "\C-xc" 'compile)
;; I don't like typing M-x run-scheme all the time
(global-set-key "\C-xrs" 'run-scheme)

(defvar comint-password-prompt-regexp "\\(\\([Oo]ld \\|[Nn]ew \\|'s \\|login \\|Kerberos \\|CVS \\|UNIX \\| SMB \\|^\\|Enter \\)[Pp]assword\\( (again)\\)?\\|pass phrase\\|\\(Enter\\|Repeat\\|Bad\\) passphrase\\)\\(?:, try again\\)?\\(?: for [^:]+\\)?:\\s *\\'")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Get rid of log-expr-
;;; ex. If you have (log-expr (this is a block of code))
;;; put the cursor here...    ^infront of the inner paren
;;; and C-x C-l will make it look like
;;; (this is a block of code)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq unlog
   [?\C-\M-k right C-M-left ?\C-y ?\C-\M-k])
(global-set-key "\C-x\C-l" unlog)
(global-set-key "\C-c;" 'comment-region)


(provide 'merced)