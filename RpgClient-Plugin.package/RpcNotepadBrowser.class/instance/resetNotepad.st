private
resetNotepad
	notepad := RpcGameNotepad findByGameCreateIfAbsent: self client activeGame 
		