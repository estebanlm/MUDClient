accessing
findMatchCreateIfNoneFor: aBrowser
	^ self 
		findMatchFor: aBrowser 
		ifNone: [ aBrowser createSettings save ]