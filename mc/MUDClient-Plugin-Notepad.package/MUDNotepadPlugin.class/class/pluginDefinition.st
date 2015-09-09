accessing
pluginDefinition
	^ MUDPluginDefinition allAvailable detect: [ :each | each pluginClass = self ]