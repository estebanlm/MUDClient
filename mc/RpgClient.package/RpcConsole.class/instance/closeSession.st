private
closeSession
	(session notNil and: [ session isRunning ]) 
		ifTrue: [ 
			session close.
			self announce: RpcGameDisconnected new ]