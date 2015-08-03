accessing
formatter 
	^ formatter ifNil: [ formatter := RpcANSITextFormatter new ]