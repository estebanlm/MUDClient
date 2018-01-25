"
I'm a field area that informs when certain keys are pressed (notably, the keys to handle history) 
"
Class {
	#name : #MUDCommandFieldArea,
	#superclass : #RubTextFieldArea,
	#traits : 'TMUDAnnouncer',
	#classTraits : 'TMUDAnnouncer classTrait',
	#instVars : [
		'mutex'
	],
	#category : #'MUDClient-View-Morph'
}

{ #category : #announcing }
MUDCommandFieldArea >> announcer [ 
	^ super announcer
]

{ #category : #drawing }
MUDCommandFieldArea >> drawOnAthensCanvas: anAthensCanvas [
	self mutex critical: [ 
		super drawOnAthensCanvas: anAthensCanvas ]
]

{ #category : #initialize }
MUDCommandFieldArea >> initialize [
	super initialize.
	self initializeKeyBindings.
]

{ #category : #initialize }
MUDCommandFieldArea >> initializeKeyBindings [
	"arrows to history"
	self 
		bindKeyCombination: Character arrowUp asKeyCombination 
		toAction: [ self announce: MUDKeyUpEntered new ].
	self
		bindKeyCombination: Character arrowDown asKeyCombination 
		toAction: [ self announce: MUDKeyDownEntered new ].
	"arrows to movent"
	self 
		bindKeyCombination: Character arrowUp shift 
		toAction: [ :a :b :key | self announce: MUDCommandKeyNorthEntered new ].
	self
		bindKeyCombination: Character arrowDown shift 
		toAction: [ self announce: MUDCommandKeySouthEntered new ].
	self
		bindKeyCombination: Character arrowLeft shift 
		toAction: [ self announce: MUDCommandKeyWestEntered new ].
	self
		bindKeyCombination: Character arrowRight shift 
		toAction: [ self announce: MUDCommandKeyEastEntered new ]
]

{ #category : #accessing }
MUDCommandFieldArea >> mutex [ 
	^ mutex ifNil: [ mutex := Mutex new ]
]
