; generate 1000 random numbers between 1 and 10
; 		(true-random 1000 1 10)

(println "About to do randos")
(define (true-random num from to)
	(let (params (format "num=%d&min=%d&max=%d&" num from to)
			pre "http://www.random.org/integers/?"
			post "col=1&base=10&format=plain&rnd=new")
			(println pre params post)
		(map int (parse (get-url (append pre params post))))
		
	)
)
;

(println "Randos Done!")
(exit)

