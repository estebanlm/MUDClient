instance creation
uniqueInstance
	self = RpcPluginPosition ifTrue: [ self error: 'I''m an abstract class, use one of my children' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]