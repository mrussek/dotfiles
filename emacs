
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(c-default-style
   (quote
    ((c-mode . "linux")
     (c++-mode . "stroustrup")
     (java-mode . "java"))))
 '(desktop-save-mode nil)
 '(erc-hide-list (quote ("JOIN" "NICK" "PART" "QUIT")))
 '(erc-nick "gardnan")
 '(erc-port 6667)
 '(erc-server "irc.freenode.net")
 '(ess-use-toolbar nil)
 '(haskell-mode-hook (quote (turn-on-haskell-indentation)))
 '(inhibit-startup-screen t)
 '(ispell-alternate-dictionary "/usr/share/dict/linux.words")
 '(make-backup-files nil)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("MELPA" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (visual-fill-column utop sbt-mode markdown-mode glsl-mode geiser flymd flycheck-rust ess cargo)))
 '(prolog-program-name
   (quote
    (((getenv "EPROLOG")
      (eval
       (getenv "EPROLOG")))
     (eclipse "eclipse")
     (mercury nil)
     (sicstus "sicstus")
     (swi "swipl")
     (gnu "gprolog")
     (t "swipl"))))
 '(safe-local-variable-values
   (quote
    ((TeX-master . t)
     (c-default-style . "java")
     (c-indentation-style . "java"))))
 '(send-mail-function (quote smtpmail-send-it))
 '(show-trailing-whitespace nil)
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
 '(tex-dvi-view-command
   (quote
    (cond
     ((eq window-system
	  (quote x))
      "ec")
     ((eq window-system
	  (quote w32))
      "yap")
     (t "dvi2tty * | cat -s"))))
 '(timeclock-relative nil)
 '(timeclock-workday 28800)
 '(tool-bar-mode t)
 '(tool-bar-position (quote top))
 '(user-mail-address "maxwell.russek@gmail.com"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'erase-buffer 'disabled nil)

(defun clear-ocaml-toplevel ()
  (interactive)
  (erase-buffer)
  (comint-send-string (get-buffer-process (current-buffer)) "();;\n"))

(autoload 'tuareg-mode "tuareg")
(add-hook 'text-mode-hook 'visual-line-mode)
(add-hook 'latex-mode-hook (lambda () (auto-fill-mode 0)))
(add-hook 'latex-mode-hook 'visual-line-mode)
(add-hook 'tuareg-interactive-mode-hook
	  (lambda ()
	    (define-key tuareg-interactive-mode-map "\C-cl" 'clear-ocaml-toplevel)))
(add-to-list 'auto-mode-alist '(".*_EDITMSG\\'" . text-mode))
(add-to-list 'auto-mode-alist '("\\.ml[ily]?$" . tuareg-mode))
(add-to-list 'auto-mode-alist '("\\.pro$" . prolog-mode))
