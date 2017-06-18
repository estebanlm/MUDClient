private
refresh
	self removeAllMorphs.
	self 
		addRoom: selectedRoom 
		position: self bounds center.
	self changed
	
	