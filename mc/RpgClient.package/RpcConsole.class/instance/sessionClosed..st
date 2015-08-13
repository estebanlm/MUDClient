private session
sessionClosed: ann
	self logInfo: 'Connection closed.'.
	session := nil.
	
	self game ifNotNil: [ previousGame := self game ]. "Keep previous game"
	self game: nil. "Reset game"
	self refresh.
	self window disable.
	self dependentWindows do: #close