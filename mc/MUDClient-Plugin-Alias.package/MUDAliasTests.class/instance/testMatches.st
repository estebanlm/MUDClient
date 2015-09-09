tests
testMatches
	| alias |
	
	alias := MUDAlias new 
		whenReceive: 'alias' send: 'some-trigger-command';
		yourself.
		
	self assert: (alias matches: 'alias').
	self assert: (alias matches: 'alias with parameters').
	self assert: (alias matches: 'ALIAS').
	self assert: (alias matches: 'Alias').
	self assert: (alias matches: 'AlIas').
	self deny: (alias matches: 'alias1').
	self deny: (alias matches: 'aliasAsSuffix').
	self deny: (alias matches: 'aliasAsSuffix').
	self deny: (alias matches: 'prefixAsAlias').
	