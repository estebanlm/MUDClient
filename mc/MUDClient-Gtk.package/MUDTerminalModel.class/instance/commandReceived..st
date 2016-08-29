private session
commandReceived: ann
	self activePlugins
		select: [ :each | 
			(each isProcessingProtocol: ann protocol) 
				and: [ each acceptsProcotolCommand: ann  ] ] 
		thenDo: [ :each | each processOn: self command: ann ]