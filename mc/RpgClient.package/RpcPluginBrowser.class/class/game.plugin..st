instance creation
game: aGame plugin: aPlugin
	^ self basicNew 
		initializeGame: aGame plugin: aPlugin;
		yourself