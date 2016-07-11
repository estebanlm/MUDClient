tests
testMatches
	| command |

	command := MUDAliasCommand fromString: 'rep'.
	self assert: command matches: 'rep'.
	self deny: command matches: 'rep other'.

	command := MUDAliasCommand fromString: 'rep some'.
	self assert: command matches: 'rep some'.
	self deny: command matches: 'rep other added'.
	self deny: command matches: 'rep other'.
	
	command := MUDAliasCommand fromString: 'rep $arg1'.
	self assert: command matches: 'rep some'.
	self assert: command matches: 'rep other'.
	self deny: command matches: 'rep other with some'.

	command := MUDAliasCommand fromString: 'rep $arg1 with $arg2'.
	self assert: command matches: 'rep some with other'.
	self assert: command matches: 'rep other with another'.
	self deny: command matches: 'rep some'.
	self deny: command matches: 'rep other'