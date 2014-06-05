accessing
findByGameCreateIfAbsent: aGame 
	^ self 
		findByGame: aGame 
		ifAbsent: [ (self game: aGame) save ]