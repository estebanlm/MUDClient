accessing
addRoom: aRoom
	aRoom map: self.
	^ self rooms 
		at: aRoom number 
		put: aRoom