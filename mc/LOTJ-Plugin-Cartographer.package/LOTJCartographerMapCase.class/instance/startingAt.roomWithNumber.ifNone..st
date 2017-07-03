accessing
startingAt: aMap roomWithNumber: aNumber ifNone: aBlock
	aMap ifNotNil: [ 
		aMap roomWithNumber: aNumber ifFound: [ :room | ^ room ] ].  
	^ self roomWithNumber: aNumber ifNone: aBlock.