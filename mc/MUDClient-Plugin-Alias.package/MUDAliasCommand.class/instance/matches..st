testing
matches: aCommandLine
	self hasUniqueKeywordWithoutArguments ifTrue: [ ^ self matchesUniqueString: aCommandLine ].
	^ self matchesKeywords: aCommandLine