private session
sessionClosed: ann
	self log info: 'Connection closed.'.
	session := nil.
	
	self game ifNotNil: [ self storeGameBeforeClose ]. "Keep previous game"
	self game: nil. "Reset game"
	self refresh.
	self window disable.
	self dependentWindows do: #closeBySessionTerminate.