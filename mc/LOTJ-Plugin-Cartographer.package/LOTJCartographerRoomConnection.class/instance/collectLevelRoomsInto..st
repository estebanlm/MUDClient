accessing
collectLevelRoomsInto: aCollection
	"If direction points to non-level places, stop here."
	(self direction = LOTJCartographerDirection unknown 
		or: [ self direction = LOTJCartographerDirection up 
		or: [ self direction = LOTJCartographerDirection down] ]) 
		ifTrue: [ ^ aCollection ].
	"If this room has already been visited, stop here."
	(aCollection includes: self room) ifTrue: [ ^ aCollection ].
	"Then just add room and iterate its connections"
	aCollection add: self room.
	self room collectLevelRoomsInto: aCollection.
	^ aCollection