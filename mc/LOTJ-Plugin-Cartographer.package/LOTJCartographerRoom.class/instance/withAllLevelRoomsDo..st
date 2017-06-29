accessing
withAllLevelRoomsDo: aBlock
	(self collectLevelRoomsInto: OrderedCollection new)
		do: aBlock