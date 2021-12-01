
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(setq package-archives
      '(("melpa" . "http://melpa.org/packages/")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tango-dark))
 '(package-selected-packages '(emmet-mode idle-highlight-mode highlight-symbol company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq make-backup-files nil)
(keyboard-translate ?\C-h ?\C-?)

(defun my-insert--tab-char ()
  "Insert a tab char. (ASCII 9, \t)"
  (interactive)
  (insert "\t"))

(global-set-key (kbd "TAB") 'my-insert--tab-char)
(setq x-select-enable-clipboard t)
(setq-default tab-width 4)

(require 'company)
(global-company-mode) ; 全バッファで有効にする
(setq company-transformers '(company-sort-by-backend-importance)) ;; ソート順
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
(setq completion-ignore-case t)
(setq company-dabbrev-downcase nil)
(global-set-key (kbd "C-M-i") 'company-complete)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

;; color settings black, lightgrey, white, steelblue etc.
(set-face-attribute 'company-tooltip nil
		    :foreground "white" :background "black")
(set-face-attribute 'company-tooltip-common nil
		    :foreground "white" :background "black")
(set-face-attribute 'company-tooltip-common-selection nil
		    :foreground "white" :background "black")
(set-face-attribute 'company-tooltip-selection nil
		    :foreground "yellow" :background "black")
(set-face-attribute 'company-preview-common nil
		    :background nil :foreground "lightgrey" :underline t)
(set-face-attribute 'company-scrollbar-fg nil
		    :background "grey60")
(set-face-attribute 'company-scrollbar-bg nil
		    :background "gray40")

;;(require 'emmet-mode)
;;(add-hook 'sgml-mode-hook 'emmet-mode) ;; マークアップ言語全部で使う
;;(add-hook 'css-mode-hook  'emmet-mode) ;; CSSにも使う
;;(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 4))) ;; indent はスペース2個
;;(define-key emmet-mode-keymap (kbd "C-j") 'emmet-expand-line) ;; C-j で展開
;;e.g
;;ul#id>li.list*3 in html
;;p1-2!m10e+bd1#2s in css

;;reference
;;https://github.com/smihica/emmet-mode#html-abbreviations
