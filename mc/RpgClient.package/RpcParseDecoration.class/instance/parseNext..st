parsing
parseNext: aString 
	^ self next 
		ifNotNil: [ :decoration | decoration parse: aString ]
		ifNil: [ aString ]