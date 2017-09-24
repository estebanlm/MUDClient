Class {
	#name : #MUDSessionForTest,
	#superclass : #Object,
	#traits : 'TMUDAnnouncer',
	#classTraits : 'TMUDAnnouncer classTrait',
	#instVars : [
		'stream',
		'announcer'
	],
	#category : 'MUDClient-Tests'
}

{ #category : #announcing }
MUDSessionForTest >> announcer [ 
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #initialization }
MUDSessionForTest >> close [

]

{ #category : #accessing }
MUDSessionForTest >> contents [ 
	^ stream contents
]

{ #category : #initialization }
MUDSessionForTest >> initialize [
	super initialize.
	self reset
]

{ #category : #testing }
MUDSessionForTest >> isRunning [
	^ true
]

{ #category : #accessing }
MUDSessionForTest >> reset [
	stream := String new writeStream
]

{ #category : #read/write }
MUDSessionForTest >> write: aStringOrByteArray [ 
	stream nextPutAll: aStringOrByteArray
]

{ #category : #read/write }
MUDSessionForTest >> writeln: aString [ 
	self write: (aString , String crlf)
]
