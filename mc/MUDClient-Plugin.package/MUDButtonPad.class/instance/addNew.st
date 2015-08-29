accessing
addNew
	^ self add: (MUDPad new 
		name: self nextName;
		owner: self;
		yourself)