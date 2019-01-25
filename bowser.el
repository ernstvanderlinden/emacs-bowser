;;; bowser.el --- select and browse urls -*- lexical-binding: t -*-

;; Copyright (C) 2015-2019  Free Software Foundation, Inc.

;; Author: Ernst M. van der Linden <ernst.vanderlinden@ernestoz.com>
;; URL: https://github.com/ernstvanderlinden/bowser.el
;; Version: 1.0.0
;; Package-Requires: ((ivy) (url-util))
;; Keywords: convenience

;; This file is part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; To enable bowser on Emacs startup, add following to your init.el:
;;
;;   (require 'bowser)
;;
;;   ;; append urls to bowser's default list
;;   (setq bowser-list (append bowser-list '(
;;    ("gmail"            "https://mail.google.com")
;;    ("merriam-webster"  "https://www.merriam-webster.com/dictionary/%s" t)
;;    ("ycombinator"      "https://news.ycombinator.com"))))
;;
;; Usage:
;; 
;; - M-x bowser
;; - C-u prefix to skip url selection and auto-select bowser url
;; - Mark region to use as seach text for search-enabled bowser url

;;; Code:

(require 'ivy)
(require 'url-util)

;; browse-url default browser
(defcustom bowser-url-browser-function 'browse-url-firefox
  "See `browse-url-browser-function' for possible values.")

;; desc url search-p
(defcustom bowser-list '(
 ("google"           "https://www.google.com?gws_rd=ssl#q=%s"                     t)
 ("github"           "https://github.com/search?q=%s"                             t)
 ("gist"             "https://gist.github.com/search?p=50&q=%s&ref=searchresults" t)
 ("gnu-emacs"        "https://www.gnu.org/software/emacs/manual/"                 )
 ("reddit"           "https://www.reddit.com"                                     t)
 ("stackoverflow"    "https://stackoverflow.com/search?q=%s"                      t)
 ) "List of bowser urls \(desc url search-p\).")

(defun bowser (&optional arg)
  "Open a url defined in `bowser-list' by using `bowser-url-browser-function'.
If `integer' prefix argument ARG is provided, `bowser' will skip `ivy'
url selection and auto-select the url from `bowser-list'.  Calling
`bowser' on a region, will set the search text of search-enabled urls."
(interactive "P")
  (if arg
      (bowser-browse-url
       (nth (1- (prefix-numeric-value arg))
            bowser-list))
    (ivy-read "Bowser...ROAR! : "
              bowser-list
              :action 'bowser-browse-url)))

(defun bowser-browse-url (x)
  "Browse a bowser url provided as X."
  ;; (message "%S" x)
  (let ((desc (car x))
        (url (cadr x))
        (search-p (caddr x))
        (browse-url-browser-function bowser-url-browser-function))
    ;; search?
    (if search-p
        (progn
          (browse-url
          (format url
                  (url-encode-url
                   ;; region active?
                   (if (use-region-p)
                       (buffer-substring (mark) (point))
                     (read-string
                      (format "Bowser...ROAR! [%s] : " desc)))))))
      (browse-url url))))

(provide 'bowser)
;;; bowser.el ends here
