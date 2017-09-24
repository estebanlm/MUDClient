"
I'm a base visitor to make something with parsed ANSI strings. 
"
Class {
	#name : #MUDANSIVisitor,
	#superclass : #Object,
	#category : 'MUDClient-Protocol-ANSI'
}

{ #category : #visitor }
MUDANSIVisitor class >> visitAll: aCollection [ 
	^ self new visitAll: aCollection 
]

{ #category : #visitor }
MUDANSIVisitor >> visit: element [
	element acceptCollector: self
]

{ #category : #visitor }
MUDANSIVisitor >> visitAll: aCollection [ 
	aCollection do: [ :each | self visit: each ]
]

{ #category : #visitor }
MUDANSIVisitor >> visitClear: aNode [
	self visitEscape: aNode
]

{ #category : #visitor }
MUDANSIVisitor >> visitColor: aNode [
	self visitEscape: aNode
]

{ #category : #visitor }
MUDANSIVisitor >> visitEscape: aNode [
]

{ #category : #visitor }
MUDANSIVisitor >> visitReset: aNode [
	self visitEscape: aNode
]

{ #category : #visitor }
MUDANSIVisitor >> visitText: aNode [
]
