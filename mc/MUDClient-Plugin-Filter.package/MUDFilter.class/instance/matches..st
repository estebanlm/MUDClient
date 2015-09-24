testing
matches: aString 
	^ self patterns anySatisfy: [ :each | each matches: aString ]