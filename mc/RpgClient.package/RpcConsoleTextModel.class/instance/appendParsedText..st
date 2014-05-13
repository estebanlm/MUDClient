accessing
appendParsedText: aString
	self mutex critical: [
		self basicAppendText: (self parseText: aString) ]