private
activateGame: ann
	activeGame ifNotNil: [ 
		self announce: (RpcGameDeactivated game: ann game) ].
	activeGame := ann game.
	self console openAndConnectTo: self activeGame.
	self announce: ann "pump up"