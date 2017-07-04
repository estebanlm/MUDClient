accessing
room: aRoom 
	currentRoom := aRoom.
	self internalSelect: aRoom.
	self refresh