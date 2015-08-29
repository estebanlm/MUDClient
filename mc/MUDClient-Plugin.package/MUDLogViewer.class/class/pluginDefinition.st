accessing
pluginDefinition
	^ MUDPlugin allAvailable detect: [ :each | each pluginClass = self ]