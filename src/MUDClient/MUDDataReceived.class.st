"
I announce when data is received from server.
"
Class {
	#name : #MUDDataReceived,
	#superclass : #Announcement,
	#instVars : [
		'data'
	],
	#category : 'MUDClient-Model-Telnet'
}

{ #category : #'instance creation' }
MUDDataReceived class >> data: aStringOrByteArray [
	^ self new 
		data: aStringOrByteArray;
		yourself
]

{ #category : #accessing }
MUDDataReceived >> data [
	^ data
]

{ #category : #accessing }
MUDDataReceived >> data: anObject [
	data := anObject
]
