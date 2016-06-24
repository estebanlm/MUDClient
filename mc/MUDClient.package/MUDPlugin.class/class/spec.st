accessing
spec 
	self = MUDPlugin ifTrue: [ ^ self subclassResponsibility ].
	^ (MUDPluginSpec allSubclasses collect: #uniqueInstance)
		detect: [ :each | each pluginClass = self ]
		ifNone: [ nil ]