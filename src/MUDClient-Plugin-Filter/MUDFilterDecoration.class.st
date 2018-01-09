"
I'm a base decoration for text filtered. 
I add or modify text depending on behaviour desired (m children implements any of them)
"
Class {
	#name : #MUDFilterDecoration,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'MUDClient-Plugin-Filter-Model'
}

{ #category : #'instance creation' }
MUDFilterDecoration class >> fromSton: stonReader [
	^ self uniqueInstance
		fromSton: stonReader;
		yourself
]

{ #category : #'instance creation' }
MUDFilterDecoration class >> new [
	self error: 'Use #uniqueInstance'
]

{ #category : #'instance creation' }
MUDFilterDecoration class >> uniqueInstance [
	self = MUDFilterDecoration 
		ifTrue: [ self error: 'I''m abstract, use one of my children instead.' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]
]

{ #category : #decorating }
MUDFilterDecoration >> decorate: aString [
	self subclassResponsibility
]

{ #category : #accessing }
MUDFilterDecoration >> name [
	^ self subclassResponsibility
]
