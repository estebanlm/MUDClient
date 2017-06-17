private session
commandReceived: ann
	self serverCommandReceivers copy
		select: [ :each | 
			(each isProcessingProtocol: ann protocol) 
				and: [ each acceptsProcotolCommand: ann  ] ] 
		thenDo: [ :each | 
			[ each processCommand: ann ] schedule.
			^ self  ].
			
	self activePlugins
		select: [ :each | 
			(each isProcessingProtocol: ann protocol) 
				and: [ each acceptsProcotolCommand: ann  ] ] 
		thenDo: [ :each | [ each processOn: self command: ann ] schedule ]