actions
deactivateGame
	| game |
	game := self activeGame.
	self activeDisplayConfiguration deactivate.
	self announce: (RpcGameDeactivated game: game).
	self console closeSession. "Ensure an existing session is closed"
	lastActiveGame := game.
	activeGame := nil. 
	self toolBar refresh.
	self announce: (RpcGameDisconnected game: game) "pump up"