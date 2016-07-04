tests
testCommand
	self parse: 'command' rule: #command.
	self parse: 'command $arg1' rule: #command.
	self parse: 'command $arg1 to $arg2' rule: #command.
	self parse: 'command $arg1 to $arg2 and $arg3' rule: #command.
	self parse: 'command1 command2' rule: #command.	
		
	self fail: 'command $arg1 $arg2' rule: #command.