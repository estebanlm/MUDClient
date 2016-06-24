private session
sessionClosed: ann
	self log info: 'Connection closed.'.
	session := nil.
	
	self dependentWindows do: #closeBySessionTerminate.
	self game ifNotNil: [ self storeGameBeforeClose ]. "Keep previous game"
	self game: nil. "Reset game"
	self refresh.
	self window disable.