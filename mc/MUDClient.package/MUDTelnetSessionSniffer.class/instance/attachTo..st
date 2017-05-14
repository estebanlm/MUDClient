editing
attachTo: aSession
	aSession when: MUDDataReceived send: #dataReceived: to: self
	