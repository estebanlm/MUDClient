tests
testArgument
	self parse: 'argument' rule: #argument.
	self parse: '"argument"' rule: #argument.
	self parse: '42 argument' rule: #argument.
	self parse: '42 "argument"' rule: #argument.
	self parse: 'all argument' rule: #argument.
	