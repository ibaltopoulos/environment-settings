;; removes gnu startup screen
(setq inhibit-startup-message t)

;; disable system beep and enable visible bell
(setq visible-bell t)
(setq line-number-mode t)		;show line-numbers in the mode-line
(column-number-mode t)			;show column-number in the mode line
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)				;show date and time in modeline
(set-background-color "PeachPuff")
(set-face-font 'default "-outline-Consolas-normal-r-normal-normal-14-97-96-96-c-*-iso8859-1")

(setq-default ispell-program-name "aspell")             ; setup aspell as the spelling program

(let ((default-directory "~/.emacs.d/color-theme-6.6.0/"))
(normal-top-level-add-to-load-path '("."))
(normal-top-level-add-subdirs-to-load-path))

(require 'color-theme)
(color-theme-initialize)
(color-theme-pok-wob) ;; "White on Black" theme

;; Frame title bar formatting to show full path of file
(setq-default
 frame-title-format
 (list '((buffer-file-name " %f" (dired-directory 
	 			  dired-directory
				  (revert-buffer-function " %b"
				  ("%b - Dir:  " default-directory)))))))
(setq load-path (cons "C:\\Programs\\emacs-23.3\\lisp\\fsharp" load-path))
(setq auto-mode-alist (cons '("\\.fs[iylx]?$" . fsharp-mode) auto-mode-alist))
(autoload 'fsharp-mode "fsharp" "Major mode for editing F# code." t)
(autoload 'run-fsharp "inf-fsharp" "Run an inferior F# process." t)

(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist) )
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(load "preview-latex.el" nil t t)
(setq preview-image-type 'pnm)
(load "auctex.el" nil t t)

(setq-default TeX-master nil)
(setq TeX-parse-self t)
(setq TeX-auto-save t)

(if (and (boundp 'window-system) window-system)
    (when (string-match "XEmacs" emacs-version)
       	(if (not (and (boundp 'mule-x-win-initted) mule-x-win-initted))
            (require 'sym-lock))
       	(require 'font-lock)))

;; toggle between buffers
(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer)))

;; Define a count of the number of words in a highlighted region and bind to F6
;; Handy for forms with word limits and titles with character limits
(defun word-count (start end)
  (interactive "r")
  (let ((words 0) (lines 0) (chars 0))
    (save-excursion
      (goto-char start)
      (while (< (point) end) (forward-word 1) (setq words (1+ words))))
    (setq lines (count-lines start end) chars (- end start))
    (message "Region has  %d lines;   %d words;   %d characters."
             lines words chars)))


;;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph       
;;; Takes a multi-line paragraph and makes it into a single line of text.       
(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

(global-set-key (kbd "C-x M-q") 'unfill-paragraph)
(global-set-key [C-tab] 'other-window)

;; The following lines are always needed.  Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-font-lock-mode 1)                     ; for all buffers
(transient-mark-mode 1)

;; ====================
;; insert date and time

(defvar current-date-time-format "%a %b %d %H:%M:%S %Z %Y"
  "Format of date to insert with `insert-current-date-time' func
See help of `format-time-string' for possible replacements")

(defvar current-time-format "%a %H:%M:%S"
  "Format of date to insert with `insert-current-time' func.
Note the weekly scope of the command's precision.")

(defun insert-current-date-time ()
  "insert the current date and time into current buffer.
Uses `current-date-time-format' for the formatting the date/time."
       (interactive)
       (insert "==========\n")
;       (insert (let () (comment-start)))
       (insert (format-time-string current-date-time-format (current-time)))
       (insert "\n")
       )

(defun insert-current-time ()
  "insert the current time (1-week scope) into the current buffer."
       (interactive)
       (insert (format-time-string current-time-format (current-time)))
       (insert "\n")
       )

(global-set-key "\C-c\C-d" 'insert-current-date-time)
(global-set-key "\C-c\C-t" 'insert-current-time)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-delete-selection t)
 '(cua-enable-cua-keys t)
 '(cua-highlight-region-shift-only t)
 '(cua-keep-region-after-copy t)
 '(cua-mode t nil (cua-base))
 '(default-input-method "greek")
 '(display-time-mode t)
 '(emacsw32-max-frames nil)
 '(emacsw32-mode t)
 '(emacsw32-style-frame-title t)
 '(frame-background-mode (quote light))
 '(htmlize-view-print-visible t t)
 '(pr-gs-command "c:\\Programs\\Ghostscript\\gs8.53\\bin\\gswin32c.exe")
 '(pr-gv-command "C:\\Programs\\Ghostview\\gsview\\gsview32.exe")
 '(recentf-mode t)
 '(require (quote linum))
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(swbuff-y-mode t)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(w32-meta-style (quote w32-lr))
 '(w32-print-menu-show-print nil)
 '(w32-print-menu-show-ps-print nil)
 '(w32shell-cygwin-bin "C:\\Programs\\Cygwin\\bin")
 '(w32shell-shell (quote cmd)))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "outline" :family "Consolas")))))


