;;; url-list-mode.el --- simple mode for Web Secretary url files ("url.list")

;; Copyright (C) 2002 Christoph Conrad

;; Author: Christoph Conrad <christoph.conrad@gmx.de>
;; Created: 11 Feb 2002
;; Version: 0.5
;; Keywords: fontlock web secretary

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING. If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;; This file lost the indentation in the mail archive of websec in yahoo.
;; It is placed here in the hope that some user will provide a correct version.

;; Not available in XEmacs
(require 'generic)
(require 'font-lock)

;; Keywords embedded anywhere (except [normally] in quoted strings)
(defvar url-list-font-lock-list
  '(("^\\([^=\n\r]*\\)=\\([^\n\r]*\\)$"
     (2 font-lock-variable-name-face))))

(defvar url-list-keywords
  '( "URL" "Auth" "Name" "Prefix" "Diff" "Hicolor" "Ignore" "IgnoreURL"
     "Tmin" "Tmax" "Proxy" "ProxyAuth" "Email" "EmailLink" "Digest" ))

(define-generic-mode 'url-list-mode
  ;; comment-list
  '("#")
  ;; keyword-list
  url-list-keywords
  ;; font-lock-list
  url-list-font-lock-list
  ;; auto-mode-list
  '("/url\.list$")
  ;; function-list for setup
  nil )
"Mode for highlighting Web Secretary URL files.")

(provide 'url-list-mode)
