"
I'm a text model for the terminal. 
I keep a maximum amount of lines in display.
I can append text, not just set/get.
I process diferent text decorations (like ANSI decoration).
"
Class {
	#name : #MUDTerminalTextModel,
	#superclass : #RubScrolledTextModel,
	#instVars : [
		'maxLines',
		'mutex',
		'parseDecoration'
	],
	#category : #'MUDClient-View-Morph'
}

{ #category : #'as yet unclassified' }
MUDTerminalTextModel class >> defaultMaxLines [
	^ 500
]

{ #category : #accessing }
MUDTerminalTextModel >> addParseDecoration: aDecoration [ 
	| last |
	
	parseDecoration ifNil: [ ^ parseDecoration := aDecoration ].
	last := parseDecoration.
	[ last next isNil ] whileFalse: [ last := last next ]. 
	last next: aDecoration
]

{ #category : #accessing }
MUDTerminalTextModel >> appendParsedText: aString [
	self basicAppendText: (self parseText: aString).
	[ self announcer announce: RubTextUpdatedInModel ]
	on: Error 
	do: [ :e | self log debug: e messageText ]
]

{ #category : #accessing }
MUDTerminalTextModel >> appendText: aStringOrText [
	self basicAppendText: aStringOrText.
	[ self announcer announce: RubTextUpdatedInModel ]
	on: Error 
	do: [ :e | self log debug: e messageText ]	
]

{ #category : #private }
MUDTerminalTextModel >> basicAppendText: aStringOrText [
	self mutex critical: [  
		self text append: aStringOrText.
		self text lineCount > self maxLines
			ifTrue: [ self removeFirstLines ] ]
]

{ #category : #accessing }
MUDTerminalTextModel >> clear [
	self  text: ''.
	self announcer announce: RubTextUpdatedInModel
]

{ #category : #initialization }
MUDTerminalTextModel >> initialize [
	mutex := Mutex new.
	super initialize.
	self addParseDecoration: MUDANSIDecoration new
]

{ #category : #accessing }
MUDTerminalTextModel >> maxLines [
	^ maxLines ifNil: [ self class defaultMaxLines ]
]

{ #category : #accessing }
MUDTerminalTextModel >> maxLines: anObject [
	maxLines := anObject
]

{ #category : #private }
MUDTerminalTextModel >> mutex [ 
	^ mutex
]

{ #category : #'view creating' }
MUDTerminalTextModel >> newScrolledText [
	^ (MUDTerminalTextMorph on: self) 
		getSelectionSelector: #primarySelectionInterval; 
		yourself
]

{ #category : #accessing }
MUDTerminalTextModel >> parseDecoration [
	^ parseDecoration
]

{ #category : #accessing }
MUDTerminalTextModel >> parseText: aString [
	^ parseDecoration parse: aString
]

{ #category : #private }
MUDTerminalTextModel >> removeFirstLines [
	| count linesToRemove size |

	size := 0.
	count := 0.
	linesToRemove := (self maxLines / 3) asInteger. "1/3"  
	self text string linesDo: [ :line |
		count := count + 1.
		size := size + line size.
		count = linesToRemove ifTrue: [ 
			self text 
				replaceFrom: 1 
				to: size 
				with: '' asText ] ]
]

{ #category : #accessing }
MUDTerminalTextModel >> text [
	self mutex critical: [ 
		^ super text ]
]

{ #category : #accessing }
MUDTerminalTextModel >> text: aString [
	| parsedText |
	parsedText := self parseText: aString.
	self mutex critical: [ 
		super text: parsedText ]
]
