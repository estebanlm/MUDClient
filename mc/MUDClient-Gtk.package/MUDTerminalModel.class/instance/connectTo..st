private
connectTo: aGame
	self game: aGame.
	[ 
		session := aGame connect.
		session 
			when: MUDCommandReceived send: #commandReceived: to: self;
			when: MUDDataReceived send: #dataReceived: to: self;
			when: MUDConnectionClosed send: #sessionClosed: to: self.
		self prepareDisplayAfterConnect.
		self log info: [ 'Connected to: {1}:{2}' format: { aGame host. aGame port } ].
		self postConnect ]
	on: ConnectionTimedOut, NameLookupFailure, MUDError 
	do: [ :e | 
		self inform: e messageText.
		self connectTo: aGame "recursive call, probably not the best" ]