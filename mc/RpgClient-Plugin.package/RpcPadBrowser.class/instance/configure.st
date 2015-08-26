actions
configure
	(RpcPadConfigureDialog pad: self pad) generate
		ifNil: [ ^ self ].
	self hardRefresh