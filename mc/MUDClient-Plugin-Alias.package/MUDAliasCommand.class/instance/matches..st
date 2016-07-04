testing
matches: aString 
	self hasUniqueKeywordWithoutArguments ifTrue: [ ^ self matchesUniqueString: aString ]
		