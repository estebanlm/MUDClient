accessing
pointLike: aString 
	^ self points 
		detect: [ :each | 
			each type = 'Place' 
			and: [each name beginsWith: aString ] ]