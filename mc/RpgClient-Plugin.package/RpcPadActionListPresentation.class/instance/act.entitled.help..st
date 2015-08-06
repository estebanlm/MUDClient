scripting actions
act: aBlock entitled: aStringOrBlock help: helpString
	self addAction: (RpcPadAction new 
		action: aBlock; 
		title: aStringOrBlock; 
		help: helpString;
		yourself)