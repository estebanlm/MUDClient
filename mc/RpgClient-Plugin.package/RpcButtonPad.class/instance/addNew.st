accessing
addNew
	^ self add: (RpcPad new 
		name: self nextName;
		owner: self;
		yourself)