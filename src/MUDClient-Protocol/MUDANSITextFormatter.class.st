"
I'm a visitor to format ANSI documents. 
I take a Text and produce a formmated (colorized) text.
"
Class {
	#name : #MUDANSITextFormatter,
	#superclass : #MUDANSIVisitor,
	#instVars : [
		'textColor',
		'defaultTextColor',
		'bold',
		'text'
	],
	#category : 'MUDClient-Protocol-ANSI'
}

{ #category : #accessing }
MUDANSITextFormatter >> bold: aBoolean [ 
	bold := aBoolean
]

{ #category : #accessing }
MUDANSITextFormatter >> defaultTextColor [
	^ defaultTextColor ifNil: [ Smalltalk ui theme textColor ]
]

{ #category : #accessing }
MUDANSITextFormatter >> defaultTextColor: anObject [
	defaultTextColor := anObject
]

{ #category : #testing }
MUDANSITextFormatter >> isBold [ 
	^ bold ifNil: [ bold := false ]
]

{ #category : #accessing }
MUDANSITextFormatter >> text [
	^ text
]

{ #category : #accessing }
MUDANSITextFormatter >> text: anObject [
	text := anObject
]

{ #category : #accessing }
MUDANSITextFormatter >> textColor [
	^ textColor ifNil: [ textColor := self defaultTextColor ]
]

{ #category : #accessing }
MUDANSITextFormatter >> textColor: anObject [
	textColor := anObject
]

{ #category : #visitor }
MUDANSITextFormatter >> visitAll: aCollection [
	self text: '' asText.
	super visitAll: aCollection.
	^ self text
]

{ #category : #visitor }
MUDANSITextFormatter >> visitClear: aNode [
	aNode value = 2 
		ifTrue: [ 
			self text 
				replaceFrom: 1 
				to: self text size 
				with: '' asText ]
]

{ #category : #visitor }
MUDANSITextFormatter >> visitColor: aNode [
	self textColor: aNode foregroundColor.
	self bold: aNode isBold
]

{ #category : #visitor }
MUDANSITextFormatter >> visitReset: aNode [
	self bold: false.
	self textColor: self defaultTextColor.
]

{ #category : #visitor }
MUDANSITextFormatter >> visitText: aNode [
	| textToAppend start |
			
	textToAppend := aNode text copyWithout: Character cr.
	start := self text size.
		
	self text append: textToAppend.
	
	self text 
		makeColor: self textColor 
		from: start + 1
		to: self text size.
		
	self isBold ifTrue: [ 
		self text 
			makeBoldFrom: start + 1
			to: self text size ]
]
