Class {
	#name : #MUDFilterTest,
	#superclass : #TestCase,
	#category : #'MUDClient-Plugin-Filter-Tests'
}

{ #category : #tests }
MUDFilterTest >> testMatches [ 
	| filter |
	
	filter := MUDFilter new 
		name: 'Test';
		addPattern: (MUDFilterPattern new 
			pattern: '^\(OOC\).*|^\(NEWBIE\).*';
			yourself);
		yourself.
		
	self assert: (filter matches: '(OOC) test of string').
	self assert: (filter matches: '(NEWBIE) test of string').	
	self deny: (filter matches: 'this is somthing with (OOC) in the middle')

]

{ #category : #tests }
MUDFilterTest >> testPatternMatching [ 
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
]
