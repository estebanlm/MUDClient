private session
dataSend: ann
	| data |
	self isRunning ifFalse: [ ^ self ].
	
	data := self filterInput: inputMorph text asString.
	self session writeln: data.

	"Echo"
	self isEchoOn ifFalse: [ ^ self ].
	areaMorph model appendText: data, String crlf.
	areaMorph adjustScrollbars.
	self registerSessionData: data, String crlf