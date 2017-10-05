"
I keep history of commands entered. 
"
Class {
	#name : #MUDCommandHistory,
	#superclass : #Object,
	#instVars : [
		'elements',
		'currentIndex',
		'maxSize'
	],
	#category : 'MUDClient-View-Morph'
}

{ #category : #defaults }
MUDCommandHistory class >> defaultMaxSize [ 
	^ 500
]

{ #category : #accessing }
MUDCommandHistory >> add: aString [ 
	(elements notEmpty and: [ elements last = aString ]) ifTrue: [ ^ self ].
	
	elements addLast: aString.
	[ elements size > self maxSize ]
		whileTrue: [ elements removeFirst ].
	currentIndex := elements size
]

{ #category : #accessing }
MUDCommandHistory >> backward [
	elements ifEmpty: [ ^ nil ].
	currentIndex = 1 ifTrue: [ ^ elements first ].
		
	currentIndex := currentIndex - 1.
	^ self current
]

{ #category : #accessing }
MUDCommandHistory >> current [
	elements ifEmpty: [ ^ nil ].
	^ elements at: currentIndex
]

{ #category : #accessing }
MUDCommandHistory >> elements [
	^ elements
]

{ #category : #accessing }
MUDCommandHistory >> first [
	elements ifEmpty: [ ^ nil ].
	currentIndex := 1.
	^ self current
]

{ #category : #accessing }
MUDCommandHistory >> forward [ 
	elements ifEmpty: [ ^ nil ].
	currentIndex = elements size ifTrue: [ ^ elements last ].
	currentIndex := currentIndex + 1.
	^ self current
]

{ #category : #initialization }
MUDCommandHistory >> initialize [
	super initialize.
	elements := OrderedCollection new.
	currentIndex := 0
]

{ #category : #accessing }
MUDCommandHistory >> maxSize [
	^ maxSize ifNil: [ self class defaultMaxSize ]
]

{ #category : #accessing }
MUDCommandHistory >> maxSize: aNumber [
	maxSize := aNumber
]
