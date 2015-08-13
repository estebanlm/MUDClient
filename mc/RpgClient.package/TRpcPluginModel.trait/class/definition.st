accessing
definition 
	^ RpcPlugin allAvailable detect: [ :each | each pluginClass = self ]