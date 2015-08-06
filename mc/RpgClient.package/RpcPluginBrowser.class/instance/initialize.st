initialization
initialize
	super initialize.
	self client 
		when: RpcGameActivated send: #refresh to: self