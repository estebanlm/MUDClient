private session
dataSend: ann
	| data |
	self isRunning ifFalse: [ ^ self ].
	
	data := inputMorph text asString.
	self 
		filterInput: data
		ifNone: [ 
			self session writeln: data.
			"I send an enter to console, to proper show the command introduction (but not the command, 
	 		 I could, but is probably not visually good... we'll see."
			areaMorph model appendText: String crlf ].