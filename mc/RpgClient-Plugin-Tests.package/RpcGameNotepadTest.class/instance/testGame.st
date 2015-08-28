tests
testGame
	| game notepad |
	
	game := RpcGame name: 'test' host: nil port: nil.
	notepad := RpcNotepad new game: game.
	self assert: notepad game equals: game.
	self assert: notepad root children isEmpty