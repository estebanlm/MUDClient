private session
dataReceived: ann 
	| rawData data |
	
	rawData := ann data asString.
	[  
		self hasGame ifTrue: [ 
			data := self filterOutput: rawData.
			data ifNotEmpty: [ 
				areaMorph model appendParsedText: data.	
				self isPinned ifFalse: [ areaMorph adjustScrollbars ] ] ]
	] executeOnUIThread.
	self registerSessionData: rawData