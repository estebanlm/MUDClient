private
windowFor: aPlugin game: aGame
	^ self browserClass 
		game: aGame
		plugin: aPlugin