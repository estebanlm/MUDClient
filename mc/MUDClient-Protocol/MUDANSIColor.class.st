"
I'm a color escape. 
Following ANSI definition, a color comes as much in this  format: 

[##;##;##m
	
##  = 0 to: 1 --> is  ""normal"" or ""bright""
## = 30 to:  37 --> is foreground color (see tables in class side)
## = 40 to:  47 --> is background color (see tables in class side)
"
Class {
	#name : #MUDANSIColor,
	#superclass : #MUDANSIEscape,
	#instVars : [
		'backgroundColor',
		'foregroundColor',
		'bold'
	],
	#classInstVars : [
		'normalColorMap',
		'brightColorMap'
	],
	#category : 'MUDClient-Protocol-ANSI'
}

{ #category : #accessing }
MUDANSIColor class >> brightColorMap [
	^ brightColorMap ifNil: [ brightColorMap := self createBrightColorMap ]
]

{ #category : #accessing }
MUDANSIColor class >> brightColorMapAt: aNumber [ 
	^ self brightColorMap at: aNumber.
]

{ #category : #private }
MUDANSIColor class >> createBrightColorMap [
	^ Dictionary newFromPairs: {
		0. Color lightGray.
		1. Color red. 
		2. Color green.
		3. Color yellow.
		4. Color blue.
		5. Color magenta.
		6. Color cyan.
		7. Color white.
	} 
]

{ #category : #private }
MUDANSIColor class >> createNormalColorMap [
	^ Dictionary newFromPairs: {
		0. Color black.
		1. Color red darker darker. 
		2. Color green darker darker darker.
		3. Color yellow darker darker darker.
		4. Color blue darker darker darker.
		5. Color magenta darker darker darker.
		6. Color cyan darker darker darker.
		7. Color lightGray lighter lighter lighter lighter. 
	} 
]

{ #category : #accessing }
MUDANSIColor class >> normalBlack [
	^ self normalColorMapAt: 0
]

{ #category : #accessing }
MUDANSIColor class >> normalColorMap [
	^ normalColorMap ifNil: [ normalColorMap := self createNormalColorMap ]
]

{ #category : #accessing }
MUDANSIColor class >> normalColorMapAt: aNumber [ 
	^ self normalColorMap at: aNumber.
]

{ #category : #accessing }
MUDANSIColor class >> normalWhite [
	^ self normalColorMapAt: 7
]

{ #category : #visitor }
MUDANSIColor >> acceptCollector: aCollector [
	aCollector visitColor: self.
]

{ #category : #accessing }
MUDANSIColor >> backgroundColor [
	^ backgroundColor
]

{ #category : #accessing }
MUDANSIColor >> foregroundColor [
	^ foregroundColor
]

{ #category : #initialization }
MUDANSIColor >> initialize [ 
	super initialize.
	bold := false
]

{ #category : #testing }
MUDANSIColor >> isBold [ 
	^ bold
]

{ #category : #private }
MUDANSIColor >> parse: aCollection [ 
	aCollection do: [ :each |
		each < 30 ifTrue: [ self parseIntensity: each ].
		(each between: 30 and: 37) ifTrue: [ self parseForegroundColor: each - 30 ].
		(each between: 40 and: 47) ifTrue: [ self parseBackgroundColor: each - 40 ] ]
	
]

{ #category : #private }
MUDANSIColor >> parseBackgroundColor: aNumber [ 
	backgroundColor := self isBold 
		ifTrue: [ self class brightColorMapAt: aNumber ]
		ifFalse: [ self class normalColorMapAt: aNumber ]
]

{ #category : #private }
MUDANSIColor >> parseForegroundColor: aNumber [ 
	foregroundColor := self isBold 
		ifTrue: [ self class brightColorMapAt: aNumber ]
		ifFalse: [ self class normalColorMapAt: aNumber ]
]

{ #category : #private }
MUDANSIColor >> parseIntensity: aNumber [ 
	aNumber = 0 ifTrue: [ bold := false ].	
	aNumber = 1 ifTrue: [ bold := true ].
]

{ #category : #accessing }
MUDANSIColor >> value: aCollection [ 
	super value: aCollection.
	self parse: aCollection.
]
