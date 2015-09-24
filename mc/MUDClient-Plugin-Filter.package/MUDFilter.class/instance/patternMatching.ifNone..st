accessing
patternMatching: aString ifNone: aBlock
	^ self patterns 
		detect: [ :each | each matches: aString ]
		ifNone: aBlock