private
closeSession
	(self session isNil or: [ self session isRunning not ]) ifTrue: [ ^ self ].
	self session close.
	self announce: RpcGameDisconnected new