accessing
pluginByClass: aClass ifAbsent: aBlock
	^ self plugins
		detect: [ :each | each isKindOf: aClass ]
		ifNone: aBlock