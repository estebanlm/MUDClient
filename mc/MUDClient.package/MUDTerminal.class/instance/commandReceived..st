private session
commandReceived: ann
	self serverCommandReceivers copy
		select: [ :each | 
			(each isProcessingProtocol: ann protocol) 
				and: [ each acceptsProcotolCommand: ann  ] ] 
		thenDo: [ :each | 
			[ each processCommand: ann ] executeOnUIThread.
			self removeServerCommandReceiver: each.
			^ self  ].
			
	self activePlugins
		select: [ :each | 
			(each isProcessingProtocol: ann protocol) 
				and: [ each acceptsProcotolCommand: ann  ] ] 
		thenDo: [ :each | [ each processOn: self command: ann ] executeOnUIThread ]