tests
testGame
	| game notepad |
	
	game := MUDGame name: 'test' host: nil port: nil.
	notepad := MUDGameNotepad new game: game.
	self assert: notepad game equals: game.
	self assert: notepad root children isEmpty