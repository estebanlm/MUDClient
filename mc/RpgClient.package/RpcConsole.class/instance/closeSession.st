private
closeSession
	(session isNil or: [ session isRunning not ]) ifTrue: [ ^ self ].
	session close.
	self announce: RpcGameDisconnected new