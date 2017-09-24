"
I'm a telnet session who also can stay alive to receive data from server and redirect it to suscribers.
"
Class {
	#name : #MUDTelnetSession,
	#superclass : #TelnetSessionBasic,
	#traits : 'TMUDAnnouncer',
	#classTraits : 'TMUDAnnouncer classTrait',
	#instVars : [
		'host',
		'port',
		'error',
		'dataProcess',
		'announcer',
		'protocols'
	],
	#category : 'MUDClient-Model-Telnet'
}

{ #category : #accessing }
MUDTelnetSession class >> bufferSize [
	^ 2000
]

{ #category : #'instance creation' }
MUDTelnetSession class >> connectTo: aString port: aNumber [ 
	^ self new 
		connectToHostNamed: aString port: aNumber;
		yourself
	
]

{ #category : #accessing }
MUDTelnetSession class >> maxRetries [
	^ 8
]

{ #category : #accessing }
MUDTelnetSession class >> timeout [ 
	^ 500
]

{ #category : #announcing }
MUDTelnetSession >> announcer [ 
	^ announcer ifNil: [ announcer := MUDScheduledAnnouncer new ]
]

{ #category : #connection }
MUDTelnetSession >> close [ 
	super close.
	self announce: MUDConnectionClosed new.
	self stopProcess.
	
]

{ #category : #connection }
MUDTelnetSession >> connectToHostNamed: aString port: aNumber [
	host := aString.
	port := aNumber.
	
	super connectToHostNamed: aString port: aNumber.
	self startProcess.
]

{ #category : #waiting }
MUDTelnetSession >> finishWithError: anError [
	error := anError.
	self close
]

{ #category : #accessing }
MUDTelnetSession >> host [
	^ host
]

{ #category : #initialization }
MUDTelnetSession >> initialize [ 
	super initialize.
	protocols := Dictionary new
]

{ #category : #private }
MUDTelnetSession >> isANSIComplete: buffer [
	"This is a hacky way to check for ANSI completion without scaning all string. 
	 I assume that an ANSI escape will not be larger than 12... this is just a 
	 guessed number and maybe needs adjustement. 
	 Also Ijust check for terminal that I parse, which means that there can be non-completed
	 escapes and I will lose them, and break the full chain"
	| scanFrom command size ansiTerminal |
	
	ansiTerminal := #($m $J).
	size := buffer size.
	command := 0.
	scanFrom := size - (size min: 12) + 1.
	scanFrom to: size do: [ :i | | ch |
		ch := buffer at: i.
		ch = Character escape 
			ifTrue: [ command := command + 1 ].
		(command > 0 and: [ ansiTerminal includes: ch ]) 
			ifTrue: [ command := command - 1 ] ].
	
	^ command = 0
]

{ #category : #testing }
MUDTelnetSession >> isRunning [ 
	^ dataProcess notNil
]

{ #category : #private }
MUDTelnetSession >> nextFrom: aStream [
	| byte |
	
	byte := aStream next.

	byte asInteger == IAC 
		ifTrue: [ ^ self processCommand: aStream ].

	byte asInteger == 0
		ifTrue:  [ ^ nil ]. 
		
	^ byte
]

{ #category : #accessing }
MUDTelnetSession >> port [
	^ port
]

{ #category : #private }
MUDTelnetSession >> processCommand: aStream [
	| command |
		
	command := aStream next.
	command ifNil: [  ^ nil ].
	command asInteger == IAC ifTrue: [ ^ command ].
	
	self
		processCommand: command 
		option: aStream next
		from: aStream.
			
	^ nil
]

{ #category : #private }
MUDTelnetSession >> processCommand: command option: option from: aStream [
	option ifNil: [ ^ self ].
	
	self 
		protocolAt: option asInteger 
		ifPresent: [ :protocol | 
			protocol 
				processCommand: command asInteger 
				session: self 
				stream: aStream.
			^ self ].

	"Old fashion process"
	self processCmd: command option: option 
]

{ #category : #private }
MUDTelnetSession >> protocolAt: protocolCommand ifPresent: aBlock [ 
	^ self protocols 
		at: protocolCommand 
		ifPresent: aBlock
]

{ #category : #accessing }
MUDTelnetSession >> protocols [ 
	^ protocols
		
]

{ #category : #read/write }
MUDTelnetSession >> rawWrite: aStringOrByteArray [
	self socket sendData: aStringOrByteArray
]

{ #category : #read/write }
MUDTelnetSession >> readWaiting [
	^ self readWithOperation: [ :buffer | 
		self socket receiveAvailableDataInto: buffer ]
]

{ #category : #read/write }
MUDTelnetSession >> readWaitingTimeout: aNumber [
	^ self readWithOperation: [ :buffer | 
		self socket receiveDataTimeout: aNumber into: buffer ]
]

{ #category : #read/write }
MUDTelnetSession >> readWaitingWithANSIComplete [
	| data retries |
	
	data := self readWaiting.	
	retries := 0.
	[ (retries < self class maxRetries) and: [ (self isANSIComplete: data) not ] ]
		whileTrue: [ 
			retries := retries + 1.
			data := data, (self readWaitingTimeout: self class timeout) ].
	^ data
]

{ #category : #read/write }
MUDTelnetSession >> readWithOperation: operationBlock [ 
	| buffer readed rawData |
	
	self socket waitForData.		
	buffer := String new: self class bufferSize.
	readed := operationBlock value: buffer.
	rawData := buffer copyFrom: 1 to: readed.
	^ self isRawModeOn
		ifTrue: [ rawData ]
		ifFalse: [ self processReadData: rawData ]
]

{ #category : #accessing }
MUDTelnetSession >> registerProtocol: aProtocol [
	protocols at: aProtocol command put: aProtocol
]

{ #category : #read/write }
MUDTelnetSession >> sendData: aStringOrByteArray [ 
	self socket sendData: aStringOrByteArray
]

{ #category : #waiting }
MUDTelnetSession >> startProcess [
	self isRunning ifTrue: [ ^ self ]. "Is already running"
	dataProcess := [ [ [ self isRunning ] whileTrue: [ self waitAndReceive ] ]
		on: ConnectionClosed 
		do: [ :e | 
			self announce: MUDConnectionClosed new.
			self finishWithError: e ] ] 
	 forkNamed: ('Telnet waiting {1}:{2}' format: { self host. self port })
]

{ #category : #waiting }
MUDTelnetSession >> stopProcess [
	self isRunning ifFalse: [ ^ self ].
	[ dataProcess terminate ]
	ensure: [ dataProcess := nil ]
]

{ #category : #waiting }
MUDTelnetSession >> waitAndReceive [
	| received |

	received := self readWaitingWithANSIComplete.	
	received ifEmpty: [ ^ self ].
	self announce: (MUDDataReceived data: received)
]
