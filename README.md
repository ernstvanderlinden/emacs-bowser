Emacs - bowser
==============
Emacs package to select and browse urls.

Copyright and License
---------------------
Copyright (C) 2015-2019  Free Software Foundation, Inc.

Author: Ernst M. van der Linden <ernst.vanderlinden@ernestoz.com> \
URL: https://github.com/ernstvanderlinden/bowser \
Version: 1.0.0 \
Package-Requires: ((ivy) (url-util)) \
Keywords: convenience

This file is part of GNU Emacs.

This file is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

For a full copy of the GNU General Public License
see <http://www.gnu.org/licenses/>.

Install
-------
#### Clone
As this package is not on melpa (yet), clone this repo and use ```package-install-file``` to install **bowser**. If you prefer, you can use [quelpa](https://github.com/quelpa/quelpa) as well.

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
