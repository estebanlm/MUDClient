Class {
	#name : #MUDServerMSDPCommand,
	#superclass : #MUDServerCommand,
	#pools : [
		'MUDTelnetConstantsMSDP'
	],
	#category : 'MUDClient-Model-ServerCommand'
}

{ #category : #testing }
MUDServerMSDPCommand >> isProcessingProtocol: protocolId [
	^ protocolId == MSDP
]
