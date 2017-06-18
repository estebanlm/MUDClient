private
registerRecordedMovement
	"if is the same, then it means I made a 'fake' movement: I tried to move in an invalid 
	 direction"
	self record originRoom = self record arrivalRoom 
		ifTrue: [ ^ self ].
	self record register.
	record := nil "reset"