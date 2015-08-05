accessing
findByGame: aGame ifAbsent: aBlock
	^ (self selectOne: [ :each | each game = aGame ])
		ifNil: aBlock