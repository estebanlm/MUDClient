actions
configure
	(RpcPadConfigureDialog pad: self pad) openModal 
		ifNil: [ ^ self ].
	self hardRefresh