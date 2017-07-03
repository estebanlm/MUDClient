accessing
roomWithNumber: aNumber ifNone: aBlock
	^ self 
		roomWithNumber: aNumber
		ifFound: [ :found | found ]
		ifNone: aBlock