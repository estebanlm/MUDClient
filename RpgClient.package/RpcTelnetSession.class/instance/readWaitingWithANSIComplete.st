read/write
readWaitingWithANSIComplete
	| data retries |
	
	data := self readWaiting.	
	retries := 0.
	[ (retries < self class maxRetries) and: [ (self isANSIComplete: data) not ] ]
		whileTrue: [ 
			retries := retries + 1.
			data := data, (self readWaitingTimeout: self class timeout) ].
	^ data