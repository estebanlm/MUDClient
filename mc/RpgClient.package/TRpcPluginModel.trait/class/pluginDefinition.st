accessing
pluginDefinition
	^ RpcPlugin allAvailable detect: [ :each | each pluginClass = self ]