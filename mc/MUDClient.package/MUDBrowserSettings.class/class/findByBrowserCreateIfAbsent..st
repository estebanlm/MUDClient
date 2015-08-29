accessing
findByBrowserCreateIfAbsent: aBrowser 
	^ (self selectOne: [ :each | each browserClass = aBrowser class and: [ aBrowser game = each game ]])
		ifNil: [ (self browserClass: aBrowser class game: aBrowser game) save ]