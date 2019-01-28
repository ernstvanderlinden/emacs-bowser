Emacs - bowser
==============
Emacs package to select and browse urls.

Install
-------
#### Clone
As this package is not on [Melpa](https://melpa.org) (yet), clone this repo and call ```package-install-file``` or simply add a ```load-path``` which points to **bowser** local repo. If you prefer, you could use [quelpa](https://github.com/quelpa/quelpa) as well.

#### Startup
To enable **bowser** on Emacs startup, add the following to your init.el:

```elisp
(require 'bowser)

;; append my urls to bowser's default list
(setq bowser-list (append bowser-list '(
 ("gmail"            "https://mail.google.com")
 ("merriam-webster"  "https://www.merriam-webster.com/dictionary/%s" t)
 ("ycombinator"      "https://news.ycombinator.com"))))
```

#### Dependency
This package depends on [ivy](https://melpa.org/#/ivy), so please make sure that has been installed as well.

Usage
-----
- M-x ```bowser```
- ```C-u prefix``` to skip url selection and auto-select bowser url
- Mark region to use as seach text for search-enabled bowser url
