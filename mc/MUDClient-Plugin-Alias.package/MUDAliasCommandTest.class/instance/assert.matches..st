tests
assert: command matches: aString 
	self assert: (command matches: (self parseCommandLine: aString))