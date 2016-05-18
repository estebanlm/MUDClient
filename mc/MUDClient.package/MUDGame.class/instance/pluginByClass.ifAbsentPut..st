accessing
pluginByClass: aClass ifAbsentPut: aBlock
	^ self plugins
		detect: [ :each | each isKindOf: aClass ]
		ifNone: [ self addPlugin: aBlock value ]