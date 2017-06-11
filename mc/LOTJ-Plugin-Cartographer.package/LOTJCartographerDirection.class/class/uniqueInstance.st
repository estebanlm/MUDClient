instance creation
uniqueInstance
	self = LOTJCartographerDirection 
		ifTrue: [ self error: 'I''m abstract, use one of my children' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]