showing
postOpen
	self window announcer
		when: WindowActivated send: #transmitFocus to: self;
		when: WindowClosed send: #closeSession to: self.	
	inputMorph takeKeyboardFocus.
	window disable