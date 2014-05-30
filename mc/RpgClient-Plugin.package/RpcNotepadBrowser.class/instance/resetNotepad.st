private
resetNotepad
	notepad := RpcGameNotepad 
		findByGame: self client activeGame 
		ifAbsent: [ (RpcGameNotepad game: self client activeGame) save ]