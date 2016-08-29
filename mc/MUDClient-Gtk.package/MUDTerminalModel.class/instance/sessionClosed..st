private session
sessionClosed: ann
	self log info: 'Connection closed.'.
	session := nil.
	
	self dependentWindows do: [ :each | 
		[ each closeBySessionTerminate ]
		on: Error do: [ :e | self log error: e messageText ] ].
	self game ifNotNil: [ self storeGameBeforeClose ]. "Keep previous game"
	self game: nil. "Reset game"
	self refresh.
	self window sensitive: false.