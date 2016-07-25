private
filterAliases: aString
	^ self activeAliases
		detect: [ :each | each matches: aString ] 
		ifFound: [ :each | each output ]
		ifNone: [ aString ]