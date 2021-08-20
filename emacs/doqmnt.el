;;; doqmnt.el --- A library for automatic documentation of code.  -*- lexical-binding: t; -*-

;; Copyright (C) 2021 Joshua T. Guerin & Kathleen Ericson

;; Author: Joshua T. Guerin, Ph.D. <jguerin@utm.edu>
;; Maintainer: Kathleen Ericson, Ph.D. <kericson@utm.edu>
;; Created: 02 August 2021
;; Keywords: languages programming documentation comments
;; URL: https://github.com/joshuaguerin/doqmnt

;; This file is not part of GNU Emacs.

;; This file is free software. You are welcome to download it and give it a try!
;; Please note that no guarantees are made regarding software correctness.
;; Please feel free to give the source a read to make yourself comfortable with how it works.
;; We are not responsible for anything that may go wrong in running the software.
;; (Although we do not currently foresee anything that it would do.)

;; Package-Requirements: N/A

;;; Code:

(defun file-doq ()
  "Insert a header comment at the top of the file."
  (interactive)
  (setq brief (read-string "@brief "))
  (setq desc (read-string "@description "))
  (setq current (point))
  (setq total (point-max))
  
  (goto-char 0)
  (insert "/**")
  (insert "\n * @file ")
  (setq vals (split-string (buffer-file-name) "/"))
  (insert (car (last vals))) ; need to fix
  (insert "\n * @author ")
  (insert user-full-name)
  (insert "\n * @date ")
  (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d)"))
  (insert (concat' "\n * @brief " brief))
  
  (insert "\n * \n * ")
  (insert desc)
  (insert "\n */\n\n")
  (setq total (- (point-max) total))
  (setq current (+ current total))
  (goto-char current))

(defun class-doq ()
  "Provide documentation for the class declared on the current line."
  (interactive)
  (setq current (point))
  (setq p1 (line-beginning-position))
  (end-of-line)
  (setq p2 (point))
  (setq line (buffer-substring p1 p2))
  (setq def (split-string line))
  (setq classname (cadr def))
  (setq end (point-max))

  (goto-char p1)
  (insert "\n/**\n * ")
  (setq desc (read-string "@description: "))
  (insert desc)
  (insert "\n *\n * @class ")
  (insert classname)
  (insert " ")
  (setq vals (reverse (split-string (buffer-file-name) "/")))
  (insert (car vals)) ; need to fix
  (insert " \"")
  (insert (cadr vals))
  (insert "/")
  (insert (car vals))
  (insert "\"\n")
  (insert " * @brief ")
  (setq brief (read-string "@brief: "))
  (insert brief)
  (insert "\n *\n */\n")
  (setq end (- (point-max) end))
  (goto-char (+ current end)))


(defun fun-doq ()
  "Insert a comment block on the line below for the function prototyped on the current line"
  (interactive)
  (setq end (point-max))
  (setq p1 (line-beginning-position))
  (setq position (point))

  (end-of-line)
  (setq p2 (point))
  (setq line (buffer-substring p1 p2))
  (setq retval (car (split-string line)))
  (setq args (substring line (+ (string-match "(" line) 1) (string-match ")" line)))
  (setq arglist (split-string args ", "))

  (goto-char p1)
  (insert "\n/**\n")
  (setq desc (read-string "@description  "))
  (insert (concat' " * " desc "\n *\n"))

  ;;put args in here
  (if (> (length arglist) 0)
      (dolist (arg arglist)
	(setq param_desc (read-string (concat' "Describe " arg " ")))
        (insert " * @param ")
        (insert arg)
	(insert " ")
	(insert param_desc)
        (insert "\n") ))
  (insert " * @pre \n")
  (setq ret_desc (read-string (concat' "@return " retval " ")))
  (insert (concat' " * @return " retval " " ret_desc "\n"))
  (insert " * @post \n")
  (insert " * \n")
  (insert " */\n")
  
  ;; Return to original cursor position.
  (setq end (- (point-max) end))
  (goto-char (+ position end)))


