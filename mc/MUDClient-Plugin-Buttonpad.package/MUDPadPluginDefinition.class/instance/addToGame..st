execute
addToGame: aGame 
	| plugin |
	plugin := super addToGame: aGame.
	plugin hasPads ifFalse: [ plugin addNew ].
	^ plugin