tests
deny: command matches: aString 
	self deny: (command matches: (self parseCommandLine: aString))