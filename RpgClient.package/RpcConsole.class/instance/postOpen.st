showing
postOpen
	self window announcer
		when: WindowActivated send: #transmitFocus to: self;
		when: WindowClosed send: #closeSessionAndCleanUpDisplay to: self.	
	inputMorph takeKeyboardFocus.
	window disable