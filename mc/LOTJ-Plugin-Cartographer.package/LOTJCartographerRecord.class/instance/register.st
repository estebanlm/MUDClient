actions
register
	self isRecordComplete ifFalse: [ ^ self ].		
	self originRoom 
		addConnection: (self direction ifNil: [ LOTJCartographerDirection unknown ])
		to: self arrivalRoom