"
I'm an abstract command to send to the server.
Commands can be sent for all resons you want. In general to ask things. 

So, commands can wait for an answer: 
- waitForAnswer needs to return true
- you need to declare a block to handle returning value

Tipically, I can be used by subclassing me, in which case you will need to extend some methods: 

- #buildCommand, where you will actually build your command.
- #isProcessingProtocol: where you answer if this command is appropriate for certain protocol (an example is implemented with MSDP)

"
Class {
	#name : #MUDServerCommand,
	#superclass : #Object,
	#instVars : [
		'terminal',
		'value',
		'answerBlock'
	],
	#category : 'MUDClient-Model-ServerCommand'
}

{ #category : #'instance creation' }
MUDServerCommand class >> new [ 
	self error: 'Use #on:'
]

{ #category : #'instance creation' }
MUDServerCommand class >> on: aTerminal [
	^ self basicNew 
		initializeTerminal: aTerminal;
		yourself
]

{ #category : #private }
MUDServerCommand >> buildCommand [
	self subclassResponsibility
]

{ #category : #execute }
MUDServerCommand >> execute [
	self sendCommand: self buildCommand
]

{ #category : #execute }
MUDServerCommand >> executeAndWait [
	^ Continuation currentDo: [ :cc | 
		self onAnswer: [ :v | cc value: v ].
		self execute ].
]

{ #category : #execute }
MUDServerCommand >> executeThen: aBlock [
	answerBlock := aBlock.
	self execute
]

{ #category : #initialization }
MUDServerCommand >> initializeTerminal: aTerminal [
	self initialize.
	terminal := aTerminal
]

{ #category : #testing }
MUDServerCommand >> isProcessingProtocol: protocolId [
	^ self subclassResponsibility
]

{ #category : #accessing }
MUDServerCommand >> onAnswer: aBlock [
	answerBlock := aBlock
]

{ #category : #private }
MUDServerCommand >> processCommand: aCommand [
	value := aCommand variable value.
	self terminal removeServerCommandReceiver: self.
	answerBlock ifNotNil: [ answerBlock cull: value ]
]

{ #category : #private }
MUDServerCommand >> sendCommand: bytes [
	self waitForAnswer
		ifTrue: [ self terminal addServerCommandReceiver: self ].
	self terminal sendCommand: bytes
]

{ #category : #accessing }
MUDServerCommand >> terminal [
	^ terminal
]

{ #category : #accessing }
MUDServerCommand >> value [
	^ value
]

{ #category : #testing }
MUDServerCommand >> waitForAnswer [
	^ answerBlock notNil
]
