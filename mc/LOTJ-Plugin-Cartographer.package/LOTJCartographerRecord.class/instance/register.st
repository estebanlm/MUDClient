actions
register
	self originRoom 
		addConnection: (self direction ifNil: [ LOTJCartographerDirection unknown ])
		to: self arrivalRoom