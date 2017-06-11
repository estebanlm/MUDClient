accessing
valueAt: keyString put: anObject
	^ self values 
		at: keyString asSymbol
		put: anObject