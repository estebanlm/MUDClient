execute
browserFor: aGame
	^ RpcNotepadBrowser notepad: (RpcGameNotepad 
		findByGame: aGame 
		ifAbsent: [ (RpcGameNotepad game: aGame) save ])