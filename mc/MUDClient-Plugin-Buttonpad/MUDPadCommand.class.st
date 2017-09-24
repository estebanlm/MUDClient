"
I define a pad command.
"
Class {
	#name : #MUDPadCommand,
	#superclass : #Object,
	#instVars : [
		'pad',
		'text',
		'keyBinding'
	],
	#category : 'MUDClient-Plugin-Buttonpad-Model'
}

{ #category : #'instance creation' }
MUDPadCommand class >> pad: aPad [
	^ self basicNew 
		initializePad: aPad;
		yourself
]

{ #category : #accessing }
MUDPadCommand >> clear [
	self text: nil
]

{ #category : #descriptions }
MUDPadCommand >> descriptionContainer [
	^ super descriptionContainer
		tkAcceptIcon: #accept asMUDIcon;
		tkCancelIcon: #cancel asMUDIcon;
		yourself
]

{ #category : #descriptions }
MUDPadCommand >> descriptionText [
	<magritteDescription>
	
	^ MAMemoDescription new 
		priority: 10;
		label: 'Definition';
		accessor: #text;
		lineCount: 10;
		beRequired;
		yourself
]

{ #category : #executing }
MUDPadCommand >> executeOn: aTerminal [
	| output |
	self isDefined ifFalse: [ ^ self ].
	output := (self pad prefix 
		ifNotNil: [ :prefix | (prefix, ' ', self text) trimBoth ]
		ifNil: [ self text ]).
	aTerminal sendFilteringInput: output
]

{ #category : #testing }
MUDPadCommand >> hasKeyBinding [
	^ self keyBinding notNil
]

{ #category : #accessing }
MUDPadCommand >> help [ 
	^ self keyBinding asString
]

{ #category : #initialization }
MUDPadCommand >> initializePad: aPad [
	self initialize.
	pad := aPad
]

{ #category : #testing }
MUDPadCommand >> isDefined [
	^ self text isEmptyOrNil not
]

{ #category : #accessing }
MUDPadCommand >> keyBinding [
	^ keyBinding
]

{ #category : #accessing }
MUDPadCommand >> keyBinding: aKeyBinding [
	keyBinding := aKeyBinding
]

{ #category : #accessing }
MUDPadCommand >> pad [
	^ pad
]

{ #category : #printing }
MUDPadCommand >> printOn: stream [ 
	stream << (self title ifEmpty: [ 'Undefined' ])
]

{ #category : #accessing }
MUDPadCommand >> text [
	^ text
]

{ #category : #accessing }
MUDPadCommand >> text: anObject [
	text := anObject
]

{ #category : #accessing }
MUDPadCommand >> title [
	^ self text ifNil: [ '' ]
]
