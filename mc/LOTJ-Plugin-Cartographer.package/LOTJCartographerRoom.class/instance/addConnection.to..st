accessing
addConnection: direction to: aRoom
	self basicConnection: direction to: aRoom.
	aRoom basicConnection: direction inverse to: self