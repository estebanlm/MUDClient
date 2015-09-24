tests
testPatternMatching 
	| filter pattern |
	
	filter := MUDFilter new 
		name: 'Test';
		addPattern: (pattern := (MUDFilterPattern new 
			pattern: '^\(OOC\).*|^\(NEWBIE\).*';
			yourself));
		yourself.
		
	self assert: (filter patternMatching: '(OOC) test of string') = pattern.
	self assert: (filter patternMatching: '(NEWBIE) test of string') = pattern.	
	self assert: (filter patternMatching: 'this is somthing with (OOC) in the middle') isNil