tests
testGame
	| game notepad |
	
	game := RpcGame name: 'test' host: nil port: nil.
	notepad := RpcGameNotepad game: game.
	self assert: notepad game equals: game.
	self assert: notepad root children isEmpty