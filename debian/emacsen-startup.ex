;; -*-emacs-lisp-*-
;;
;; Emacs startup file, e.g.  /etc/emacs/site-start.d/50phantomjs.el
;; for the Debian phantomjs package
;;
;; Originally contributed by Nils Naumann <naumann@unileoben.ac.at>
;; Modified by Dirk Eddelbuettel <edd@debian.org>
;; Adapted for dh-make by Jim Van Zandt <jrv@debian.org>

;; The phantomjs package follows the Debian/GNU Linux 'emacsen' policy and
;; byte-compiles its elisp files for each 'emacs flavor' (emacs19,
;; xemacs19, emacs20, xemacs20...).  The compiled code is then
;; installed in a subdirectory of the respective site-lisp directory.
;; We have to add this to the load-path:
(let ((package-dir (concat "/usr/share/"
                           (symbol-name debian-emacs-flavor)
                           "/site-lisp/phantomjs")))
;; If package-dir does not exist, the phantomjs package must have
;; removed but not purged, and we should skip the setup.
  (when (file-directory-p package-dir)
    (if (fboundp 'debian-pkg-add-load-path-item)
        (debian-pkg-add-load-path-item package-dir)
      (setq load-path (cons package-dir load-path)))
    (autoload 'phantomjs-mode "phantomjs-mode"
      "Major mode for editing phantomjs files." t)
    (add-to-list 'auto-mode-alist '("\\.phantomjs$" . phantomjs-mode))))

