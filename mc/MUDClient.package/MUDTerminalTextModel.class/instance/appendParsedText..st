accessing
appendParsedText: aString
	self basicAppendText: (self parseText: aString).
	[ self announcer announce: RubTextUpdatedInModel ]
	on: Error 
	do: [ :e | self log debug: e messageText ]