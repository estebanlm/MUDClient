actions
connectTo: aGame
	[ 
		self closeSession.
		session := aGame connect.
		session 
			when: RpcDataReceived send: #dataReceived: to: self;
			when: RpcConnectionClosed send: #sessionClosed: to: self.
	  	window enable.
		self clearContents.
		self transmitFocus.
		self announce: (RpcGameConnected game: aGame).
		self logInfo: [ 'Connected to: {1}:{2}' format: { aGame host. aGame port } ] ]
	on: ConnectionTimedOut, NameLookupFailure, RpcError 
	do: [ :e | 
		self inform: e messageText.
		self connectTo: aGame "recursive call, probably not the best" ]