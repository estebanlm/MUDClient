private session
dataSend: ann
	| data |
	self isRunning ifFalse: [ ^ self ].
	
	data := self filterInput: inputMorph text asString.
	data 
		ifNotEmpty: [ data linesDo: [ :each | self session writeln: each ] ]
		ifEmpty: [ self session writeln: '' ].

	"Echo"
	self isEchoOn ifFalse: [ ^ self ].
	areaMorph model appendText: data, String crlf.
	areaMorph adjustScrollbars.
	self registerSessionData: data, String crlf