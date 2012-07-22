;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Automatically decompile classes when opening a .class file
;; - install jad http://www.varaneckas.com/jad/ (just put it in usr/local/bin)
;; - from http://jdee.sourceforge.net/contrib/decompile.el
;; - then go to http://jdee.sourceforge.net/
;; and download and install jdee (I placed it in my .emacs.d/jdee)
;; - then go and download CEDET
;; http://sourceforge.net/projects/cedet/?source=recommended&_test=goal
;;  then run make once you expand that directory from TERMINAL (not from within emacs)
;;  then, from the INSTALL File, paste the set up here
;; (Note: keep reading below this section)

;; ---- from install ----
;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
;; IMPORTANT: For Emacs >= 23.2, you must place this *before* any
;; CEDET component (including EIEIO) gets activated by another 
;; package (Gnus, auth-source, ...).
(load-file "~/.emacs.d/cedet-1.1/common/cedet.el")

;; Enable EDE (Project Management) features
(global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")


;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode,
;;   imenu support, and the semantic navigator
(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode,
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberant ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)
;;   Or, use one of these two types of support.
;;   Add support for new languages only via ctags.
;; (semantic-load-enable-primary-exuberent-ctags-support)
;;   Add support for using ctags as a backup parser.
;; (semantic-load-enable-secondary-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)

;; ---- end from install ----


;; Then download http://jdee.sunsite.dk/elib-1.0.tar.gz
;; expand it, and go ALLL  the way down to elib-1.0 and move it
;; to your .emacs.d

;; Then in step 4, from the original instructions, do this:

(add-to-list 'load-path (expand-file-name "~/.emacs.d/jdee/lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/cedet-1.1/common"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elib-1.0"))

(require 'jde)
(require 'decompile)

;; a hook to be able to automatically decompile-find-file .class files 
(add-hook
 'find-file-hooks
 (lambda () 
   (cond ((string-match jdc-object-extension-pattern (buffer-file-name))
          (jdc-buffer)))))

;; a hook to open class files from archives
(add-hook
 'archive-extract-hooks
 (lambda ()
   (cond ((string-match "\312\376\272\276" (buffer-substring-no-properties 1 5))
          (jdc-buffer)))))

(provide 'decompile-main)