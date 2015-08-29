accessing
pluginDefinition 
	^ RpcPlugin allAvailable detect: [ :each | each browserClass = self ]