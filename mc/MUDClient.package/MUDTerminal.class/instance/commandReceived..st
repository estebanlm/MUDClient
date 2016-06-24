private session
commandReceived: ann
	self game plugins 
		select: [ :each | each isProcessingProtocol: ann protocol ] 
		thenDo: [ :each | each processOn: self command: ann ]