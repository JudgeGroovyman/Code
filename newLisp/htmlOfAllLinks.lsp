; write links.html with all links in page

(setq page (get-url "http://www.newlisp.org/"))
(println "About to grab links")
(write-file "links.html"
	(join (find-all
		"<a href=([^>]+)>([^>]*)</a>" page)
		"<br>\n"))
;
(println "should be done now")
(exit)