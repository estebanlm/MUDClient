"
I ask for a concrete variable. 

"
Class {
	#name : #MUDMSDPSendCommand,
	#superclass : #MUDServerMSDPQueryCommand,
	#category : 'MUDClient-Model-ServerCommand'
}

{ #category : #private }
MUDMSDPSendCommand >> commandName [
	^ 'SEND'
]
