persistence
save 
	self isRoot 
		ifTrue: [ super save ]
		ifFalse: [ self root save ]