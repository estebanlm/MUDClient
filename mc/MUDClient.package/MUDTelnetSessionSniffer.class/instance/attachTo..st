editing
attachTo: aSession
	aSession weakWhen: MUDDataReceived send: #dataReceived: to: self