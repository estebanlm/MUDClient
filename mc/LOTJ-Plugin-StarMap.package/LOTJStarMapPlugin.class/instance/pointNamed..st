accessing
pointNamed: aString 
	^ self points detect: [ :each | 
		each type = 'Place' 
		and: [each name = aString ] ]