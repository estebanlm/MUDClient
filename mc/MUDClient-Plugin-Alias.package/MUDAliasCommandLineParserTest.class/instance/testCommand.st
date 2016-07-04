tests
testCommand
	self parse: 'put argument to bag' rule: #command.
	self parse: 'put 42 argument to bag' rule: #command.

	self parse: 'command' rule: #command.
	self parse: 'command argument' rule: #command.
	self parse: 'command "argument ''with'' string"' rule: #command.
	self parse: 'command ''argument "with" string''' rule: #command.
	self parse: 'command arg1 to arg2' rule: #command.
	self parse: 'command arg1 to arg2 and "arg3 is a string"' rule: #command.
	self parse: 'command all arg1 to 2 arg2 and 3 "arg3 is a string"' rule: #command.
	self fail: 'command arg1 "arg2"' rule: #command.