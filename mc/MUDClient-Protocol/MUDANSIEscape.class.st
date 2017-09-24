"
I'm a base escape (information that should not be directly visible by client, but formats the display).
"
Class {
	#name : #MUDANSIEscape,
	#superclass : #MUDANSINode,
	#instVars : [
		'value'
	],
	#category : 'MUDClient-Protocol-ANSI'
}

{ #category : #'instance creation' }
MUDANSIEscape class >> value: anObject [ 
	^ self new 
		value: anObject;
		yourself
]

{ #category : #testing }
MUDANSIEscape >> isEscape [
	^ true
]

{ #category : #accessing }
MUDANSIEscape >> value [
	^ value
]

{ #category : #accessing }
MUDANSIEscape >> value: anObject [
	value := anObject
]
