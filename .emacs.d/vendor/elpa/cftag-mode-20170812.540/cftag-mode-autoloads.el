;;; cftag-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "cftag-mode" "../../../../../../../.emacs.d/elpa/cftag-mode-20170812.540/cftag-mode.el"
;;;;;;  "1a87fbfa3a356382900d81a59c44a30d")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/cftag-mode-20170812.540/cftag-mode.el

(autoload 'cftag-mode "cftag-mode" "\
Major mode based on SGML mode for editing HTML documents.
This allows inserting skeleton constructs used in hypertext documents with
completion.  See below for an introduction to HTML.  Use
\\[browse-url-of-buffer] to see how this comes out.  See also `sgml-mode' on
which this is based.

Do \\[describe-variable] cftag- SPC and \\[describe-variable] sgml- SPC to see available variables.

To write fairly well formatted pages you only need to know few things.  Most
browsers have a function to read the source code of the page being seen, so
you can imitate various tricks.  Here's a very short HTML primer which you
can also view with a browser to see what happens:

<title>A Title Describing Contents</title> should be on every page.  Pages can
have <h1>Very Major Headlines</h1> through <h6>Very Minor Headlines</h6>
<hr> Parts can be separated with horizontal rules.

<p>Paragraphs only need an opening tag.  Line breaks and multiple spaces are
ignored unless the text is <pre>preformatted.</pre>  Text can be marked as
<b>bold</b>, <i>italic</i> or <u>underlined</u> using the normal M-o or
Edit/Text Properties/Face commands.

Pages can have <a name=\"SOMENAME\">named points</a> and can link other points
to them with <a href=\"#SOMENAME\">see also somename</a>.  In the same way <a
href=\"URL\">see also URL</a> where URL is a filename relative to current
directory, or absolute as in `http://www.cs.indiana.edu/elisp/w3/docs.html'.

Images in many formats can be inlined with <img src=\"URL\">.

If you mainly create your own documents, `sgml-specials' might be
interesting.  But note that some HTML 2 browsers can't handle `&apos;'.
To work around that, do:
   (eval-after-load \"sgml-mode\" \\='(aset sgml-char-names ?\\=' nil))

\\{cftag-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../../../.emacs.d/elpa/cftag-mode-20170812.540/cftag-mode-autoloads.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/cftag-mode-20170812.540/cftag-mode.el")
;;;;;;  (23777 50158 110922 769000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; cftag-mode-autoloads.el ends here
