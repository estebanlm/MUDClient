open/close
delete
	self isDisplayed ifFalse: [ ^ self ].
	self announce: (RpcWindowDidClose window: self).
	super delete