Class {
	#name : #MUDMSDPCommandReceived,
	#superclass : #MUDCommandReceived,
	#instVars : [
		'variable'
	],
	#category : 'MUDClient-Model-Telnet'
}

{ #category : #accessing }
MUDMSDPCommandReceived >> variable [
	^ variable
]

{ #category : #accessing }
MUDMSDPCommandReceived >> variable: anObject [
	variable := anObject
]
