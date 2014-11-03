;; this is where I add files for extra functionality
(setq load-path (cons (expand-file-name "~/.emacs.d") load-path))
(setq load-path (cons (expand-file-name "~/.emacs.d/danger-emacs") load-path))
(require 'danger-core)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ERC (Emacs IRC)

(setq erc-hide-list '("JOIN" "PART" "QUIT"))
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#clojure")
        ("freenode.net" "#leiningen")))

(defun erc-go ()
  (interactive)
  (erc :server "irc.freenode.net" :port 6667 :nick "Roxxi"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Transparency
(set-frame-parameter (selected-frame) 'alpha '(80 80))
(add-to-list 'default-frame-alist '(alpha 80 80))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Font needs to set before window dimensions for char-width
;; Font size... (each point of height is 1/10th pt e.g. 120 = 12pt)
(set-face-attribute 'default nil :height 140)

;;window dimensions
(setq default-frame-alist
      `((width  . ,(- (/ (/ (display-pixel-width) (frame-char-width)) 2) 4))
	(height . ,(- (/ (display-pixel-height) (frame-char-height)) 7))))


;; I don't want whitespace to be shown at the end of file
(setq whitespace-style
      ;; turn off showing the following characters
      (quote
       (face trailing line space-before-tab
             newline space-after-tab)))

(require 'sql-indent)

;; Delete trailing whitespace on saves.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun compact-uncompact-block ()
  "Remove or add line ending chars on current paragraph.
This command is similar to a toggle of `fill-paragraph'.
When there is a text selection, act on the region."
  (interactive)

  ;; This command symbol has a property “'stateIsCompact-p”.
  (let (currentStateIsCompact (bigFillColumnVal 90002000) (deactivate-mark nil))
    ;; 90002000 is just random. you can use `most-positive-fixnum'

    (save-excursion
      ;; Determine whether the text is currently compact.
      (setq currentStateIsCompact
            (if (eq last-command this-command)
                (get this-command 'stateIsCompact-p)
              (if (> (- (line-end-position) (line-beginning-position)) fill-column) t nil) ) )

      (if (region-active-p)
          (if currentStateIsCompact
              (fill-region (region-beginning) (region-end))
            (let ((fill-column bigFillColumnVal))
              (fill-region (region-beginning) (region-end))) )
        (if currentStateIsCompact
            (fill-paragraph nil)
          (let ((fill-column bigFillColumnVal))
            (fill-paragraph nil)) ) )

      (put this-command 'stateIsCompact-p (if currentStateIsCompact nil t)) ) ) )
