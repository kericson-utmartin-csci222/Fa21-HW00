;; Joshua T. Guerin
;; Syntax highlighting isn't enabled by default.
;Enable syntax highlighting in the current buffer
(global-font-lock-mode 1)

;Disable the welcome screen
(setq inhibit-startup-message t)

;;;FOR FLYSPELL MODE

(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)

;Add hooks for common programming languages
(add-hook 'c-mode-common-hook 'flyspell-prog-mode)
(add-hook 'c++-mode-common-hook 'flyspell-prog-mode)
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)
(add-hook 'haskell-mode-hook 'flyspell-prog-mode)
(add-hook 'html-mode-hook 'flyspell-prog-mode)
(add-hook 'java-mode-hook 'flyspell-prog-mode)
(add-hook 'javascript-mode-hook 'flyspell-prog-mode)
(add-hook 'latex-mode-hook 'turn-on-flyspell)
(add-hook 'message-mode-hook 'turn-on-flyspell)
(add-hook 'pearl-mode-hook 'flyspell-prog-mode)
(add-hook 'prolog-mode-hook 'flyspell-prog-mode)
(add-hook 'python-mode-hook 'flyspell-prog-mode)
(add-hook 'text-mode-hook 'turn-on-flyspell)

;Force flyspell mode in certain modes
(defun turn-on-flyspell ()
  "Force flyspell-mode on using a positive arg.  For use in hooks."
  (interactive)
  (flyspell-mode 1))
;;;FOR FLYSPELL MODE
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)


;Use pdflatex to compile LaTeX documents.
(setq latex-run-command "pdflatex")

;Add .emacs.d to load path
(add-to-list 'load-path "~/.emacs.d/include")
(load "doqmnt.el")

(defun main ()
  "Insert main.cpp template at cursor point."
  (interactive)
  (insert "\n#include <iostream>\n\nusing namespace std;\n\nint main() {\n  \n  \n  return 0;\n}\n")
  (backward-char 18)
)



    
(defun guard ()
  "Insert header guards into the header file"
  (interactive)
  (setq file_name (split-string (buffer-file-name) "/"))
  (setq file_name (car (last file_name)))
  (setq file_name (upcase file_name))
  (setq file_name (replace-regexp-in-string "\\." "_" file_name))
  (insert "#ifndef ")
  (insert file_name)
  (insert "\n#define ")
  (insert file_name)
  (insert "\n\n")
  (setq current(point))
  (goto-char (point-max))
  (insert "\n#endif //")
  (insert file_name)
  (goto-char current))



;; Installation of packages (e.g., haskell-mode) (require 'package) (custom-set-variables  ;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
;'(package-archives
;  (quote
;   (("gnu" . "http://elpa.gnu.org/packages/")
;    ("melpa-stable" . "http://stable.melpa.org/packages/")))))

;(require 'package)
;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;(package-initialize)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (manoj-dark)))
 '(package-selected-packages (quote (company gnu-elpa-keyring-update dart-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;company mode
;;(add-hook 'after-init-hook 'global-company-mode)
