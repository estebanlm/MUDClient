tests
testMatches
	| alias |
	
	alias := MUDAlias whenCommand: 'alias' send: 'some-trigger-command'.
	
	self assert: (alias matches: 'alias').
	self assert: (alias matches: 'alias with parameters').
	self assert: (alias matches: 'ALIAS').
	self assert: (alias matches: 'Alias').
	self assert: (alias matches: 'AlIas').
	self deny: (alias matches: 'alias1').
	self deny: (alias matches: 'aliasAsSuffix').
	self deny: (alias matches: 'aliasAsSuffix').
	self deny: (alias matches: 'prefixAsAlias').
	