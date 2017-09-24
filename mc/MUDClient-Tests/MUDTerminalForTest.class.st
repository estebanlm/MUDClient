Class {
	#name : #MUDTerminalForTest,
	#superclass : #MUDTerminal,
	#category : 'MUDClient-Tests'
}

{ #category : #private }
MUDTerminalForTest >> browserSettings [
	^ MUDTerminalBrowserSettings browserClass: self class
]

{ #category : #'private ui' }
MUDTerminalForTest >> prepareDisplayAfterConnect [
	"Test terminal does not have display"
]

{ #category : #'as yet unclassified' }
MUDTerminalForTest >> receive: aString [
	self session announce: (MUDDataReceived data: aString)
]
