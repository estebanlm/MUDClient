accessing
roomWithNumber: aNumber ifNone: aBlock
	^ self 
		roomWithNumber: aNumber 
		ifFound: [ :room | room ]
		ifNone: aBlock