private
closeSession
	session ifNotNil: [ 
		session close.
		self announce: RpcGameDisconnected new ]	