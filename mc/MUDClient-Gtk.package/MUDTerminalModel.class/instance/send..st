accessing
send: aString
	self isRunning ifFalse: [ ^ self ].
	self session writeln: aString