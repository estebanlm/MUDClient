open/close
delete
	self isDisplayed ifFalse: [ ^ self ].
	self announce: (RpcWindowWillClose window: self).
	super delete