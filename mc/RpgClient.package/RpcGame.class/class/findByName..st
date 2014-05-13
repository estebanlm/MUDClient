accessing
findByName: aString
	^ self selectOne: [ :each | each name = aString ]