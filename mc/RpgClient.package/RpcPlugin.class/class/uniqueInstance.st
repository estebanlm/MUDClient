instance creation
uniqueInstance
	self isAbstract 
		ifTrue: [ self error: 'You cannot use me directly. Use one of the other plugins in the hierarchy' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]