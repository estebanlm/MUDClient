accessing
withLevelConnectionsDo: aBlock
	self connections 
		reject: [ :each |
			each direction = LOTJCartographerDirection unknown 
			or: [ each direction = LOTJCartographerDirection up 
			or: [ each direction = LOTJCartographerDirection down] ] ]
		thenDo: aBlock