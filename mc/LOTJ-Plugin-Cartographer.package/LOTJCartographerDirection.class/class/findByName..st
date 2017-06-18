accessing
findByName: aString
	^ self perform: aString asLowercase asSymbol