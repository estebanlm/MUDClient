"
I'm a tool for snoop session data.
"
Class {
	#name : #MUDTelnetSessionSniffer,
	#superclass : #Object,
	#instVars : [
		'buffer'
	],
	#category : 'MUDClient-Model-Telnet'
}

{ #category : #editing }
MUDTelnetSessionSniffer >> attachTo: aSession [
	aSession weakWhen: MUDDataReceived send: #dataReceived: to: self
]

{ #category : #'private session' }
MUDTelnetSessionSniffer >> dataReceived: ann [
	self fillBufferWith: ann data asByteArray
	
]

{ #category : #accessing }
MUDTelnetSessionSniffer >> fillBufferWith: aByteArray [
	1 to: aByteArray size do: [ :index | 
		buffer nextPut: (aByteArray at: index) ]
]

{ #category : #initialization }
MUDTelnetSessionSniffer >> initialize [
	super initialize.
	buffer := MUDRingBuffer new: 4096
]
