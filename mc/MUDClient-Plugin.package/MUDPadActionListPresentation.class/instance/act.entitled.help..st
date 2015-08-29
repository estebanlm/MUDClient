scripting actions
act: aBlock entitled: aStringOrBlock help: helpString
	self addAction: (MUDPadAction new 
		action: aBlock; 
		title: aStringOrBlock; 
		help: helpString;
		yourself)