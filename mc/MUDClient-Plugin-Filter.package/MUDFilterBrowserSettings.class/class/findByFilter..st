accessing
findByFilter: aFilter
	^ self selectOne: [ :each | each filter = aFilter ]