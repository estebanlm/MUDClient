initialization
initialize
	super initialize.
	values := SmallDictionary newFromPairs: { 
		ROOM_VNUM. nil.
		ROOM_NAME. nil.
		ROOM_EXITS. nil }.
	connections := Dictionary new