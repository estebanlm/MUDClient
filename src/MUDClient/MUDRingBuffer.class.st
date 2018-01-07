"
simple ring buffer implementation. can hold arbitrary items but will override elements at the start if it reaches capacity.

This class was taken from Latsabben repository. Credits to him :)

http://smalltalkhub.com/#!/~Latsabben/RingBuffer
"
Class {
	#name : #MUDRingBuffer,
	#superclass : #Object,
	#instVars : [
		'array',
		'readIndex',
		'writeIndex',
		'overlapp'
	],
	#category : #'MUDClient-Utils'
}

{ #category : #initialization }
MUDRingBuffer class >> defaultSize [

	^ 128
]

{ #category : #initialization }
MUDRingBuffer class >> new [

	^ self new: self defaultSize 
]

{ #category : #'instance creation' }
MUDRingBuffer class >> new: anInteger [

	^ self basicNew buffer: (ByteArray new: anInteger)
]

{ #category : #initialization }
MUDRingBuffer >> buffer: anArray [
	array := anArray.
	self reset 
]

{ #category : #accessing }
MUDRingBuffer >> capacity [ 
	^ array size
]

{ #category : #enumerating }
MUDRingBuffer >> do: aBlock [

	[ self isEmpty ] whileFalse: [ 
		aBlock value: self nextOrNil
	].
]

{ #category : #private }
MUDRingBuffer >> increment: anIndex [

	^ anIndex = array size 
		ifTrue: [ 1 ]
		ifFalse: [ anIndex + 1 ]
]

{ #category : #private }
MUDRingBuffer >> incrementRead [

	readIndex := self increment: readIndex 
]

{ #category : #private }
MUDRingBuffer >> incrementWrite [

	writeIndex := self increment: writeIndex.
	
	overlapp ifTrue: [ self incrementRead ].
	overlapp := writeIndex = readIndex
]

{ #category : #testing }
MUDRingBuffer >> isEmpty [

	^ overlapp not and: [ readIndex = writeIndex ]
]

{ #category : #testing }
MUDRingBuffer >> isFull [

	^ overlapp
]

{ #category : #accessing }
MUDRingBuffer >> nextOrNil [

	| item |

	self isEmpty ifTrue: [ ^ nil ].	
	overlapp 	ifTrue: [ overlapp := false ].
	
	item := array at: readIndex.	
	self incrementRead.	
		
	^ item	
]

{ #category : #accessing }
MUDRingBuffer >> nextPut: aValue [

	array at: writeIndex put: aValue.
	
	self incrementWrite.
	
	^ aValue 
]

{ #category : #accessing }
MUDRingBuffer >> peek [

	self isEmpty ifTrue: [ ^ nil ].
	
	^ array at: readIndex.
]

{ #category : #initialization }
MUDRingBuffer >> reset [

	writeIndex := readIndex := 1.
	overlapp := false.
]

{ #category : #accessing }
MUDRingBuffer >> size [

	readIndex = writeIndex ifTrue: [ ^ overlapp ifTrue: [ self capacity ] ifFalse: [ 0 ] ].
	
	^ readIndex < writeIndex 
		ifTrue: [ writeIndex - readIndex ]
		ifFalse: [ self capacity - (readIndex - writeIndex) ]
]
