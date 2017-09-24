"
I'm a chunk of text.
"
Class {
	#name : #MUDANSIText,
	#superclass : #MUDANSINode,
	#instVars : [
		'text'
	],
	#category : 'MUDClient-Protocol-ANSI'
}

{ #category : #visitor }
MUDANSIText >> acceptCollector: aCollector [
	aCollector visitText: self.
]

{ #category : #accessing }
MUDANSIText >> size [ 
	^ self text size
]

{ #category : #accessing }
MUDANSIText >> text [
	^ text
]

{ #category : #accessing }
MUDANSIText >> text: anObject [
	text := anObject
]
