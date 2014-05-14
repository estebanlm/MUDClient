private
dataSend: ann
	session isRunning ifFalse: [ ^ self ].
	session writeln: inputMorph text asString.
	"I send an enter to console, to proper show the command introduction (but not the command, 
	 I could, but is probably not visually good... we'll see."
	areaMorph model appendText: String crlf.