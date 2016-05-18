accessing
findByGame: aGame
	^ self selectMany: [ :each | each game = aGame ]