"
I'm a terminal morph. 
I implement thread-safe drawing.

"
Class {
	#name : #MUDTerminalTextMorph,
	#superclass : #RubScrolledTextMorph,
	#instVars : [
		'mutex'
	],
	#category : #'MUDClient-View-Morph'
}

{ #category : #accessing }
MUDTerminalTextMorph class >> backgroundColor [
	"The terminal background color.
	 For now hardcoded, configurable in the future."
	self flag: #todo. "Be configurable"
	^ Color black
]

{ #category : #accessing }
MUDTerminalTextMorph class >> textColor [
	"The terminal default text color (when not formated by ANSI protocol).
	 For now hardcoded, configurable in the future."
	self flag: #todo. "Be configurable"
	^ Color white
]

{ #category : #accessing }
MUDTerminalTextMorph >> backgroundColor [
	^ self class backgroundColor
]

{ #category : #private }
MUDTerminalTextMorph >> calculatePositionOf: aMorph position: aSymbol [
	| position |
	
	position := super calculatePositionOf: aMorph position: aSymbol. 
	(aSymbol == #topRight or: [ aSymbol == #bottomRight ]) 
		ifTrue: [ position := position - (14@0) ].
	 ^ position

]

{ #category : #drawing }
MUDTerminalTextMorph >> drawOn: aCanvas [
	self mutex critical: [ 
		super drawOn: aCanvas ]
]

{ #category : #drawing }
MUDTerminalTextMorph >> drawOnAthensCanvas: anAthensCanvas [
	self mutex critical: [ 
		super drawOnAthensCanvas: anAthensCanvas ]
]

{ #category : #initialization }
MUDTerminalTextMorph >> initialize [
	mutex := Mutex new.
	super initialize.
	self 
		textFont: MUDFonts terminalFont;
		textColor: self textColor;
		backgroundColor: self backgroundColor
]

{ #category : #accessing }
MUDTerminalTextMorph >> mutex [
	^ mutex
]

{ #category : #accessing }
MUDTerminalTextMorph >> textColor [
	^ self class textColor
]
