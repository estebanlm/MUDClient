tests
testSentence
	self parse: 'command' rule: #sentence.
	self parse: 'command argument' rule: #sentence.
	self parse: 'command 42 argument' rule: #sentence.
