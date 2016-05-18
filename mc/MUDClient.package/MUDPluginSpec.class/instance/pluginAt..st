accessing
pluginAt: aGame
	^ self pluginAt: aGame ifAbsentPut: [ self pluginClass new ]