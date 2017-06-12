private session
dataReceived: ann 
	| data |
	
	[  
		self hasGame ifTrue: [ 
			data := self filterOutput: ann data.
			data ifNotEmpty: [ 
				areaMorph model appendParsedText: data.	
				self isPinned ifFalse: [ areaMorph adjustScrollbars ] ] ]
	] executeOnUIThread.
	self registerSessionData: ann data