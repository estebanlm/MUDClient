actions
connect
	game := RpcGameGenerator generate.
	game ifNil: [ ^ self ].
	
	[ 
		self closeSession.
		session := game connect.
		session 
			when: RpcDataReceived send: #dataReceived: to: self;
			when: RpcConnectionClosed send: #sessionClosed: to: self.
	  	window enable.
		self transmitFocus.
		self logInfo: [ 'Connected to: {1}:{2}' format: { game host. game port } ] ]
	on: ConnectionTimedOut, NameLookupFailure, RpcError 
	do: [ :e | 
		self inform: e messageText.
		self connect "recursive call, probably not the best" ]