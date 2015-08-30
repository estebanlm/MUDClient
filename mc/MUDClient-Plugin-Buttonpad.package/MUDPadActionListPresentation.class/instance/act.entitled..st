scripting actions
act: aBlock entitled: aStringOrBlock
	self addAction: (MUDPadAction new 
		action: aBlock; 
		title: aStringOrBlock; 
		yourself)