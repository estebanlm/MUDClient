actions
register
	self isRecordComplete ifFalse: [ ^ self ].
	"Come from nowhere, it was likelly a change of area"
	self direction ifNil: [ ^ self ]. 
	"No idea how this arrived here. But unknown is to ignore."
	self direction = LOTJCartographerDirection unknown ifNil: [ ^ self ].
	self originRoom 
		addConnection: self direction
		to: self arrivalRoom