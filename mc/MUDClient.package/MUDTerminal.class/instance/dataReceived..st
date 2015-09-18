private session
dataReceived: ann 
	| data |
	
	data := self filterOutput: ann data.
	data ifNotEmpty: [ 
		areaMorph model appendParsedText: data.	
		self isPinned ifFalse: [ areaMorph adjustScrollbars ]].
	self registerSessionData: ann data