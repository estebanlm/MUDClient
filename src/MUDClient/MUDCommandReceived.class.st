Class {
	#name : #MUDCommandReceived,
	#superclass : #TelnetCommandReceived,
	#instVars : [
		'protocol',
		'data'
	],
	#category : #'MUDClient-Model-Telnet'
}

{ #category : #accessing }
MUDCommandReceived >> data [
	^ data
]

{ #category : #accessing }
MUDCommandReceived >> data: anObject [
	data := anObject
]

{ #category : #accessing }
MUDCommandReceived >> protocol [
	^ protocol
]

{ #category : #accessing }
MUDCommandReceived >> protocol: anObject [
	protocol := anObject
]
