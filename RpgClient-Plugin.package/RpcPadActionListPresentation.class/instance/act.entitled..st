scripting
act: aBlock entitled: aStringOrBlock
	self addAction: (RpcPadAction new 
		action: aBlock; 
		title: aStringOrBlock; 
		yourself)