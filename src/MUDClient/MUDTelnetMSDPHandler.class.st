"
I'm a MSDP protocol binding. 

"
Class {
	#name : #MUDTelnetMSDPHandler,
	#superclass : #TelnetProtocolHandler,
	#instVars : [
		'parser'
	],
	#pools : [
		'MUDTelnetConstantsMSDP'
	],
	#category : 'MUDClient-Protocols'
}

{ #category : #testing }
MUDTelnetMSDPHandler >> isProtocol: id [
	^ id = MSDP
]

{ #category : #processing }
MUDTelnetMSDPHandler >> nextCommand: command [
	| stream byte |
	
	byte := nil.
	stream := ByteArray new writeStream.
	"Preamble to ensure the command is complete"
	stream << IAC << SB << MSDP.		
	[ stream << (byte := self next) ]
	doWhileFalse: [ byte = SE ].
	^ stream contents.
		
]

{ #category : #accessing }
MUDTelnetMSDPHandler >> parser [ 
	^ parser ifNil: [ parser := MUDMSDPParser new ]
]

{ #category : #processing }
MUDTelnetMSDPHandler >> processNext: command [
	| data |

	command = SB ifFalse: [ 
		TelnetInvalidCommand new 
			command: command;
			signal ].
	
	data := self nextCommand: command.	
	self log debug: [ 'Received command: {1}' format: { data } ].
	self deactivate. 
	self session announce: (MUDMSDPCommandReceived new
		protocol: MSDP;
		data: data;
		variable: (self parser parse: data asString);
		yourself)
]
