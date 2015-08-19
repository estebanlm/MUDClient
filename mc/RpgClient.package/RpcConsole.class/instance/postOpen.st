showing
postOpen
	self window disable.
	self window announcer
		when: WindowActivated send: #transmitFocus to: self
