Class {
	#name : #MUDTextANSIFormatter,
	#superclass : #MUDANSIVisitor,
	#instVars : [
		'textColor',
		'defaultTextColor',
		'bold',
		'text'
	],
	#category : 'MUDClient-View-Text'
}

{ #category : #accessing }
MUDTextANSIFormatter >> bold: aBoolean [ 
	bold := aBoolean
]

{ #category : #accessing }
MUDTextANSIFormatter >> defaultTextColor [
	^ defaultTextColor ifNil: [ Smalltalk ui theme textColor ]
]

{ #category : #accessing }
MUDTextANSIFormatter >> defaultTextColor: anObject [
	defaultTextColor := anObject
]

{ #category : #testing }
MUDTextANSIFormatter >> isBold [ 
	^ bold ifNil: [ bold := false ]
]

{ #category : #accessing }
MUDTextANSIFormatter >> text [
	^ text
]

{ #category : #accessing }
MUDTextANSIFormatter >> text: anObject [
	text := anObject
]

{ #category : #accessing }
MUDTextANSIFormatter >> textColor [
	^ textColor ifNil: [ textColor := self defaultTextColor ]
]

{ #category : #accessing }
MUDTextANSIFormatter >> textColor: anObject [
	textColor := anObject
]

{ #category : #visitor }
MUDTextANSIFormatter >> visitAll: aCollection [
	super visitAll: aCollection.

]

{ #category : #visitor }
MUDTextANSIFormatter >> visitClear: aNode [
	aNode value = 2 ifFalse: [ ^ self ]. 
	"self text initializeContents"
]

{ #category : #visitor }
MUDTextANSIFormatter >> visitColor: aNode [
	self textColor: aNode foregroundColor.
	self bold: aNode isBold
]

{ #category : #visitor }
MUDTextANSIFormatter >> visitReset: aNode [
	self bold: false.
	self textColor: self defaultTextColor
]

{ #category : #visitor }
MUDTextANSIFormatter >> visitText: aNode [
	| textToAppend startPosition endPosition |
			
	textToAppend := aNode text.
	startPosition := text endPosition.
	endPosition := text endPosition insert: textToAppend.
	(text startPosition selectTo: (text startPosition moveRight: 100))
		applyAttribute: (TxForeColorAttribute with: self textColor).
		
	"self isBold ifTrue: [ 
		self text 
			makeBoldFrom: start + 1
			to: self text size ]"
]
