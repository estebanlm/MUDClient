Class {
	#name : #MUDScript,
	#superclass : #Object,
	#instVars : [
		'terminal',
		'do',
		'while',
		'until'
	],
	#category : 'MUDClient-Plugin-Alias'
}

{ #category : #'instance creation' }
MUDScript class >> on: aTerminal [
	^ self basicNew 
		initializeTerminal: aTerminal;
		yourself
]

{ #category : #'private session' }
MUDScript >> dataReceived: ann [
	ann data linesDo: [ :each | 
		].
]

{ #category : #scripting }
MUDScript >> do: aBlock until: aString [ 
	self do: aBlock untilAnyOf: { aString }
]

{ #category : #scripting }
MUDScript >> do: aBlock untilAnyOf: aCollection [ 
	self notYetImplemented
]

{ #category : #scripting }
MUDScript >> do: aBlock while: whileString until: untilString [ 
	self do: aBlock whileAnyOf: { whileString } untilAnyOf: { untilString }
]

{ #category : #scripting }
MUDScript >> do: aBlock while: whileString untilAnyOf: aCollection [ 
	self do: aBlock whileAnyOf: { whileString } untilAnyOf: aCollection
]

{ #category : #scripting }
MUDScript >> do: aBlock whileAnyOf: aCollection until: untilString [ 
	self do: aBlock whileAnyOf: aCollection untilAnyOf: { untilString }
]

{ #category : #scripting }
MUDScript >> do: aBlock whileAnyOf: whileCollection untilAnyOf: untilCollection [ 
	do := aBlock.
	while := whileCollection.
	until := untilCollection.
	self waiting.
	do value. "Execute first time"
	
]

{ #category : #executing }
MUDScript >> execute: aBlock [
	aBlock value: self 
]

{ #category : #initialization }
MUDScript >> initializeTerminal: aTerminal [ 
	terminal := aTerminal.
	self initialize
]

{ #category : #scripting }
MUDScript >> send: aString [ 
	terminal send: aString.
]

{ #category : #accessing }
MUDScript >> terminal [
	^ terminal
]

{ #category : #private }
MUDScript >> waiting [
	terminal when: MUDDataReceived send: #dataReceived: to: self
]
