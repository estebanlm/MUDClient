private
arrivedToNewRoom: roomNumber
	self recordOriginRoom: self actualRoom.
	self moveActualRoomTo: roomNumber.
	self recordArrivalRoom: self actualRoom.
	self registerRecordedMovement