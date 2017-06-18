copying
, aRoom
	^ (LOTJCartographerRoomConnectionSet direction: self direction) 
		add: self room;
		add: aRoom;
		yourself