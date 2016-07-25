private
filterVariables: aString
	^ self activeVariables
		detect: [ :each | each matches: aString ] 
		ifFound: [ :each | aString copyReplaceAll: each name with: each value ]
		ifNone: [ aString ]