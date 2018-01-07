"
I show a percent var. 
I have important properties as 

- max (maximum value)
- value (current value)
"
Class {
	#name : #MUDPercentBarMorph,
	#superclass : #Morph,
	#instVars : [
		'value',
		'max',
		'showPercent',
		'font',
		'colorPairs',
		'getValueSelector',
		'getMaxSelector',
		'model'
	],
	#category : #'MUDClient-View-Morph-Util'
}

{ #category : #defaults }
MUDPercentBarMorph class >> defaultColorPairs [ 
	"Default colors. 
	 This means: 
	 	up from 66: color green,
		up from 50: color yellow, 
		up from 25: color orange,
		up from  0: color red
	"
	^ { 
		65 -> Color green.
		45 -> Color yellow.
		30 -> Color orange.
		 0 -> Color red }
]

{ #category : #drawing }
MUDPercentBarMorph >> colorFor: percent [
	self colorPairs do: [ :each |
		each key <= percent ifTrue: [ ^ each value ] ].
	^ self color
]

{ #category : #accessing }
MUDPercentBarMorph >> colorPairs [ 
	"A list of colors and percents. See defaults for example"
	^ colorPairs ifNil: [ colorPairs := self class defaultColorPairs ].
]

{ #category : #accessing }
MUDPercentBarMorph >> colorPairs: aCollectionOfPairs [ 
	"A list of colors and percents. See defaults for example"
	^ colorPairs ifNil: [ colorPairs := self class defaultColorPairs ].
]

{ #category : #drawing }
MUDPercentBarMorph >> drawOn: aCanvas [ 
	| percent origin width height x text textBounds |
	
	percent := self percent.
	percent = 0 ifTrue: [ ^ super drawOn: aCanvas ].
	
	origin := self bounds origin.
	width := self extent x.
	height := self extent y.
	x := width * percent / 100.
	
	aCanvas 
		fillRectangle: (origin extent: x@height) 
		fillStyle: (self colorFor: percent)
		borderStyle: self borderStyle.
		
	aCanvas 
		fillRectangle: ((origin x+x)@(origin y) extent: (width-x)@height) 
		fillStyle: self fillStyle
		borderStyle: self borderStyle.	
	
	text := (self isShowPercent 
		ifTrue: [ percent asString, '%' ]
		ifFalse: [ '{1}/{2}' format: { self value. self max } ]).	
	
	textBounds := (self bounds
		translateBy: (((self bounds width - (self font widthOfString: text)) / 2) rounded) @ (self bounds height - self font height / 2) rounded)
		insetBy: 0@0.
	
	aCanvas 
		drawString: text 
		in: textBounds
		font: self font
		color: (percent >= 55 "trying to ensure percentage is visible"
			ifTrue: [ self colorFor: percent] 
			ifFalse: [ self color ]) contrastingColor.
]

{ #category : #accessing }
MUDPercentBarMorph >> font [
	^ font ifNil: [ self theme textFont ]
]

{ #category : #accessing }
MUDPercentBarMorph >> font: aFont [ 
	font := aFont.
]

{ #category : #accessing }
MUDPercentBarMorph >> fontColor [
	^ self theme textColor
]

{ #category : #accessing }
MUDPercentBarMorph >> getMaxSelector [
	^ getMaxSelector
]

{ #category : #accessing }
MUDPercentBarMorph >> getMaxSelector: anObject [
	getMaxSelector := anObject.
	self updateMax.
]

{ #category : #accessing }
MUDPercentBarMorph >> getValueSelector [
	^ getValueSelector
]

{ #category : #accessing }
MUDPercentBarMorph >> getValueSelector: anObject [
	getValueSelector := anObject.
	self updateValue
]

{ #category : #initialization }
MUDPercentBarMorph >> initialize [ 	
	super initialize.
	"self color: Color lightGray lighter lighter lighter."
	self color: self theme backgroundColor.
	self 
		layoutFrame: LayoutFrame identity;
		hResizing: #spaceFill; 
		vResizing: #spaceFill;
		clipSubmorphs: true.
	self showPercent.
]

{ #category : #testing }
MUDPercentBarMorph >> isShowPercent [ 
	^ showPercent 
]

{ #category : #accessing }
MUDPercentBarMorph >> max [ 
	^ max ifNil: [ max := 100 ]
]

{ #category : #accessing }
MUDPercentBarMorph >> max: aNumber [ 
	self max = aNumber ifTrue: [ ^ self ].
	max := aNumber.
	self changed.
]

{ #category : #accessing }
MUDPercentBarMorph >> model [
	^ model
]

{ #category : #accessing }
MUDPercentBarMorph >> model: anObject [
	model ifNotNil: [ model removeDependent: self ].
	anObject ifNotNil: [ anObject addDependent:self ].
	model := anObject
]

{ #category : #accessing }
MUDPercentBarMorph >> percent [ 
	(self max = 0 or: [ self value = 0 ])
		ifTrue: [ ^ 0 ].
		
	^ (self value * 100 / self max) asInteger.
]

{ #category : #accessing }
MUDPercentBarMorph >> showPercent [ 
	showPercent := true.
]

{ #category : #accessing }
MUDPercentBarMorph >> showValue [
	showPercent := false.
]

{ #category : #updating }
MUDPercentBarMorph >> update: aSymbol [ 
	"Refer to the comment in View|update:."
	aSymbol == self getValueSelector ifTrue: [ ^ self updateValue ].
	aSymbol == self getMaxSelector ifTrue: [ ^ self updateMax ]
]

{ #category : #updating }
MUDPercentBarMorph >> updateMax [
	self model ifNotNil: [
		self getMaxSelector ifNotNil: [
			self max: (self model perform: self getMaxSelector)]]	
]

{ #category : #updating }
MUDPercentBarMorph >> updateValue [
	self model ifNotNil: [
		self getValueSelector ifNotNil: [
			self value: (self model perform: self getValueSelector)]]	
]

{ #category : #accessing }
MUDPercentBarMorph >> value [ 
	^ value ifNil: [ value := 0 ]
]

{ #category : #accessing }
MUDPercentBarMorph >> value: aNumber [
	self value = aNumber ifTrue: [ ^ self ]. 
	value := aNumber.
	self changed.
]
