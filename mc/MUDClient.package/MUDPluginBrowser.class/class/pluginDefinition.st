accessing
pluginDefinition 
	^ MUDPlugin allAvailable detect: [ :each | each browserClass = self ]