; get all IPs assigned to this machine on Win32

(define (get-ips , ips)
	(println "getting Ips")
	(dolist (ln (exec "ipconfig"))
		(if (find
			{\b\d{1,3}\.\d{,3}\.\d{1,3}\.\d{1,3}\b} ln 0)
				(push $0 ips)
		)
	)
	ips
)
;

(println "IPs: " ips)

(println "Hello")
