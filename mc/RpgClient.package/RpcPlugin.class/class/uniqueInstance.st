instance creation
uniqueInstance
	self = RpcPlugin ifTrue: [ 
		self error: 'I''m an abstract class. Access my children instead.' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]