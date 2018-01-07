"
I'm a MSDP protocol binding. 

"
Class {
	#name : #MUDMSDPTelnetProtocol,
	#superclass : #MUDTelnetProtocol,
	#traits : 'TMUDLogueable',
	#classTraits : 'TMUDLogueable classTrait',
	#instVars : [
		'parser'
	],
	#pools : [
		'MUDTelnetConstantsMSDP'
	],
	#category : #'MUDClient-Model-Telnet'
}

{ #category : #'accessing commands' }
MUDMSDPTelnetProtocol class >> willDO [
	^ ByteArray with: IAC with: DO with: MSDP
]

{ #category : #'accessing commands' }
MUDMSDPTelnetProtocol class >> willMSDP [
	^ ByteArray with: IAC with: WILL with: MSDP
]

{ #category : #accessing }
MUDMSDPTelnetProtocol >> command [
	^ MSDP
]

{ #category : #private }
MUDMSDPTelnetProtocol >> parser [ 
	^ parser ifNil: [ parser := MUDMSDPParser new ]
]

{ #category : #processing }
MUDMSDPTelnetProtocol >> processCommand: command session: aSession stream: aStream [
	| reply |

	command = WILL ifTrue: [ reply := self class willDO ].
	command = DO ifTrue: [ reply := self class willMSDP ].
	command = SB ifTrue: [ self processSubCommandSession: aSession stream: aStream ].
	
	reply ifNotNil: [
		aSession sendData: reply ]	
]

{ #category : #processing }
MUDMSDPTelnetProtocol >> processSubCommandSession: aSession stream: aStream [
	| cs byte data |
	
	cs := ByteArray new writeStream. 
	
	"Preamble to ensure the command is complete"
	cs << IAC << SB << MSDP.
	
	byte := nil.
	
	[[ byte == SE ] whileFalse: [
		byte := aStream next asInteger. 
		cs nextPut: byte ].
	
		data := cs contents.
		aSession announce: (MUDMSDPCommandReceived new
			protocol: self;
			data: data;
			variable: (self parser parse: data asString);
			yourself) ]
	 on: Error do: [ :e | 
		e crLog.
		self log error: e ].
]
