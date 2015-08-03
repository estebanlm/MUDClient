actions
doConnect
	| game |
	
	game := RpcGameGenerator generate.
	game ifNil: [ ^ false ].
	self announce: (RpcGameActivated game: game).
	^ true	