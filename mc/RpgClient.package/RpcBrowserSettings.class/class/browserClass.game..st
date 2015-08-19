instance creation
browserClass: aClass game: aGame
	^ self basicNew
		initializeBrowserClass: aClass game: aGame;
		yourself