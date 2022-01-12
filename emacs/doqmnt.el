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
  (setq current (point))
  (setq total (point-max))
  
  (goto-char 0)
  (insert "/**\n * @file ")
  (setq vals (split-string (buffer-file-name) "/"))
  (insert (car (last vals))) ; need to fix
  (insert "\n * @author ")
  (insert user-full-name)
  (insert "\n * @date ")
  (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d)"))
  (insert (concat' "\n * @brief " (read-string "@brief ")))
  
  (insert "\n * \n * ")
  (insert (read-string "@description "))
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
  (insert "\n/**\n")
  (insert (concat' " * " (read-string "@description: ") "\n"))
  (insert " *\n * @class ")
  (insert classname)
  (insert " ")
  (setq vals (reverse (split-string (buffer-file-name) "/")))
  (insert (car vals)) ; need to fix
  (insert " \"")
  (insert (cadr vals))
  (insert "/")
  (insert (car vals))
  (insert "\"\n")
  ;;(insert " * @brief ")
  (setq brief (concat' " * @brief " (read-string "@brief: ")))
  (insert brief)
  (insert "\n *\n */\n")
  (setq end (- (point-max) end))
  (goto-char (+ current end)))


(defun fun-doq ()
  "Insert a comment above the prototype on the current line."
  (interactive)
  (setq end (point-max))
  (setq p1 (line-beginning-position))
  (setq position (point))

  (end-of-line)
  (setq p2 (point))
  
  ;; Retrieve prototype line
  (setq line (buffer-substring p1 p2))
  
  (goto-char p1)
  
  ;; Process prototype
  (setq arglist (get_args line))
  (setq type_name (get_type_ident line))

  ;; Start docs
  (insert "\n/**\n")
  (insert (concat' " * " (read-string "@description  ") "\n *\n"))
  
  ;; Process args if they exist
  (insert_args? arglist)
  
  (insert (concat' " * @pre " (read-string "@pre ") "\n")) 

  ;; Process type info if it exists
  (insert_type? type_name)

  (insert (concat' " * @post " (read-string "@post ") "\n"))
  (insert " * \n */\n")
  
  ;; Return to original cursor position.
  (goto-char (+ position (- (point-max) end))))


;; String Processing Functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Takes prototype, returns a list containing a type and identifier
(defun get_type_ident (line)
    (split-string (substring line 0 (string-match "(" line))))


;; Takes prototype, returns a list of arguments.
(defun get_args (line)
  (split-string
   ;; Get everything before first paren.
   (substring line (+ (string-match "(" line) 1) (string-match ")" line))
   ;; Split over , and trim whitespace
   "," t "\s*"))


;; Printing Functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; If args exist, print in a loop
(defun insert_args? (args)
  (if (> (length arglist) 0)
      (dolist (arg arglist)
	(setq param_desc (read-string (concat' "@param " arg " ")))
        (insert " * @param ")
        (insert arg)
	(insert " ")
	(insert param_desc)
        (insert "\n") ))
  )

;; If type info exists, query user and print
(defun insert_type? (t_name)
  (if (> (length type_name) 1)
      (insert
       (concat' " * @return " (car type_name) " "
		(read-string (concat' "@return " (car type_name) " "))
		"\n")) nil))
