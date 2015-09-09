accessing
name 
	self input ifNil: [ ^ '<undefined alias>' ].
	^ self input copyUpTo: Character space