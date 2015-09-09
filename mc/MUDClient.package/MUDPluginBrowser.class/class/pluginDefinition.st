accessing
pluginDefinition 
	^ MUDPluginDefinition allAvailable detect: [ :each | each browserClass = self ]