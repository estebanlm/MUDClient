tests
testMatches 
	| filter |
	
	filter := MUDFilter new 
		title: 'Test';
		pattern: '^\(OOC\).*|^\(NEWBIE\).*';
		yourself.
		
	self assert: (filter matches: '(OOC) test of string').
	self assert: (filter matches: '(NEWBIE) test of string').	
	self deny: (filter matches: 'this is somthing with (OOC) in the middle')
