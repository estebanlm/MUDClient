tests
testMatches
	| variable |
	
	variable := MUDVariable name: '$var1' value: '12345'.
	self assert: (variable matches: '$var1').
	self assert: (variable matches: 'some $var1').
	self assert: (variable matches: 'some $var1 more').