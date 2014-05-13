as yet unclassified
formatter 
	^ formatter ifNil: [ formatter := RpcANSITextFormatter new ]