private
connectTo: aGame
	self game: aGame.
	[ 
		session := aGame connect.
		session 
			when: MUDDataReceived send: #dataReceived: to: self;
			when: MUDConnectionClosed send: #sessionClosed: to: self.
		self prepareDisplayAfterConnect.
		self logInfo: [ 'Connected to: {1}:{2}' format: { aGame host. aGame port } ] ]
	on: ConnectionTimedOut, NameLookupFailure, MUDError 
	do: [ :e | 
		self inform: e messageText.
		self connectTo: aGame "recursive call, probably not the best" ]