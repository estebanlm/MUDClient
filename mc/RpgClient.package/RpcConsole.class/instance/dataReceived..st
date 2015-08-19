private session
dataReceived: ann 
	areaMorph model appendParsedText: ann data.
	areaMorph adjustScrollbars.
	self registerSessionData: ann data.
	