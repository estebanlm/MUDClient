private
sessionClosed: ann
	window ifNotNil: [ window disable ].
	session := nil.
	self announce: RpcGameDisconnected new.
	self logInfo: 'Connection closed.'