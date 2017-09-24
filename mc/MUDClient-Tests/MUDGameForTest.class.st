Class {
	#name : #MUDGameForTest,
	#superclass : #MUDGame,
	#category : 'MUDClient-Tests'
}

{ #category : #'instance creation' }
MUDGameForTest class >> new [
	^ self basicNew initialize
]

{ #category : #actions }
MUDGameForTest >> connect [ 
	^ MUDSessionForTest new
]

{ #category : #initialization }
MUDGameForTest >> initialize [ 
	super initialize.
	name := 'Game for test'
]
