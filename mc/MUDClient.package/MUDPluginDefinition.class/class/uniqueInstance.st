instance creation
uniqueInstance
	self = MUDPluginDefinition ifTrue: [ 
		self error: 'I''m an abstract class. Access my children instead.' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]