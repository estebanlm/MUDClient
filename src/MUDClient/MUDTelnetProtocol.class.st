"
I'm a binding between a telnet session and a protocol. 
Protocols are defined elsewhere, but my subclasses provide the appropriate binding between a session and the receiving protocol.
"
Class {
	#name : #MUDTelnetProtocol,
	#superclass : #Object,
	#pools : [
		'TelnetConstantsRFC854'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'MUDClient-Model-Telnet'
}

{ #category : #accessing }
MUDTelnetProtocol class >> MSDP [
	^ MUDMSDPTelnetProtocol uniqueInstance
]

{ #category : #'instance creation' }
MUDTelnetProtocol class >> new [ 
	self error: 'Use #uniqueInstance'
]

{ #category : #'instance creation' }
MUDTelnetProtocol class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := super new ]
]

{ #category : #accessing }
MUDTelnetProtocol >> command [
	^ self subclassResponsibility
]

{ #category : #processing }
MUDTelnetProtocol >> processCommand: command session: aSession stream: aStream [
	self subclassResponsibility	
]
