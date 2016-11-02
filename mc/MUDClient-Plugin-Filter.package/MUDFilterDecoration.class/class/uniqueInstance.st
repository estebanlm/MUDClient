instance creation
uniqueInstance
	self = MUDFilterDecoration 
		ifTrue: [ self error: 'I''m abstract, use one of my children instead.' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]