private factory
newBrowser
	^ self browserClass 
		game: self game 
		plugin: self plugin