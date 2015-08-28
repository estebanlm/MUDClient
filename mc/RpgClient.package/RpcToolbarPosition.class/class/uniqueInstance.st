instance creation
uniqueInstance
	self = RpcToolbarPosition ifTrue: [ self error: 'I''m an abstract class, use one of my children' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]