tests
testCommand
	self parse: 'reparmpr' rule: #command.
	self parse: 'reparmpr $arg1' rule: #command.
	self parse: 'reparmpr $arg1 to $arg2' rule: #command.
	