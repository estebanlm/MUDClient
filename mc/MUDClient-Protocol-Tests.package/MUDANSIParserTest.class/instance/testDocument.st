tests
testDocument
	| parsed |
	
	parsed := self 
		parse: 
			Character escape asString, '[2J', 
			'a text', 
			Character escape asString, '[31m', 
			'color one' 
		rule: #document.
		
	self assert: parsed isCollection.
	self assert: parsed size equals: 4.
	self assert: parsed first value equals: 2.
	self assert: parsed second text equals: 'a text'.
	self assert: parsed third foregroundColor equals: (MUDANSIColor normalColorMapAt: 1).
	self assert: parsed fourth text equals: 'color one'.