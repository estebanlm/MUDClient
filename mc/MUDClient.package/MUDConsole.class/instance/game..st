accessing
game: aGame
	super game: aGame.
	aGame ifNotNil: [ 
		self browserSettings lastActiveGame: aGame ].
	register := nil