"
I'm a field morph who keep history and navigate through it.
"
Class {
	#name : #MUDCommandFieldMorph,
	#superclass : #RubTextFieldMorph,
	#traits : 'TMUDAnnouncer',
	#classTraits : 'TMUDAnnouncer classTrait',
	#instVars : [
		'history'
	],
	#category : #'MUDClient-View-Morph'
}

{ #category : #accessing }
MUDCommandFieldMorph class >> ghostText [ 
	^ 'Command...'
]

{ #category : #announcing }
MUDCommandFieldMorph >> announcer [ 
	^ super announcer
]

{ #category : #accessing }
MUDCommandFieldMorph >> backgroundColor [
	self flag: #todo. "Not fun, but at least I have a centralized place"
	^ MUDTerminalTextMorph backgroundColor
]

{ #category : #'accessing history' }
MUDCommandFieldMorph >> history [ 
	^ history ifNil: [ history := MUDCommandHistory new ]
]

{ #category : #'accessing history' }
MUDCommandFieldMorph >> history: anOrderedCollection [
	history := anOrderedCollection
]

{ #category : #'accessing history' }
MUDCommandFieldMorph >> historyBackward [
	self history backward ifNotNil: [ :text |
		self setText: text.
		self selectAll ]
]

{ #category : #'accessing history' }
MUDCommandFieldMorph >> historyForward [
	self history forward ifNotNil: [ :text |
		self setText: text.
		self selectAll ]
]

{ #category : #'accessing history' }
MUDCommandFieldMorph >> historyUpdate: ann [
	self text asString trimBoth 
		ifNotEmpty: [ :text | self history add: text ].
	self selectAll
]

{ #category : #initialization }
MUDCommandFieldMorph >> initialize [
	super initialize.
	
	self
		withoutAdornment;
		textColor: self textColor;
		backgroundColor: self backgroundColor;
		textFont: MUDFonts terminalFont;
		withGhostText: self class ghostText.

	self textArea 
		when: RubReturnEntered send: #historyUpdate: to: self;
		when: MUDKeyUpEntered send: #historyBackward to: self;
		when: MUDKeyDownEntered send: #historyForward to: self;
		when: MUDKeyCommandEntered send: #pumpUp: to: self.

]

{ #category : #private }
MUDCommandFieldMorph >> pumpUp: ann [
	self announcer announce: ann
]

{ #category : #'accessing selection' }
MUDCommandFieldMorph >> selectAll [
	self selectFrom: 1 to: self text size
]

{ #category : #initialization }
MUDCommandFieldMorph >> textAreaClass [
	^ MUDCommandFieldArea
]

{ #category : #accessing }
MUDCommandFieldMorph >> textColor [
	self flag: #todo. "Not fun, but at least I have a centralized place"
	^ MUDTerminalTextMorph textColor
]
