actions
doConnect
	| game |
	
	game := RpcGameGenerator generate.
	game ifNil: [ ^ self ].
	self announce: (RpcGameActivated game: game)
	