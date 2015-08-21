accessing
text: aString
	self mutex critical: [
		super text: (self parseText: aString) ]