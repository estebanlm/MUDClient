accessing
roomWithNumber: aNumber ifFound: aBlock
	^ self 
		roomWithNumber: aNumber 
		ifFound: aBlock
		ifNone: [ "Do nothing" ]