accessing
send: aString
	self areaMorph model appendParsedText: (aString, String lf).
	self areaMorph adjustScrollbars.
	self announcer announce: MUDFilterUpdated new.