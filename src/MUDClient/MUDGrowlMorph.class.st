"
I'm a ""growl-like"" morph, used to display messages inside the terminal window.
"
Class {
	#name : #MUDGrowlMorph,
	#superclass : #GrowlMorph,
	#instVars : [
		'notifyPosition'
	],
	#category : #'MUDClient-View-Morph'
}

{ #category : #'instance creation' }
MUDGrowlMorph class >> openWithLabel: aString contents: contentString backgroundColor: aColor labelColor: aLabelColor in: aMorph [
	^ (self label: aString contents: contentString)
			backgroundColor: aColor;
			labelColor: aLabelColor;
			contentsColor: aLabelColor; 
			openOn: aMorph
]

{ #category : #'instance creation' }
MUDGrowlMorph class >> openWithLabel: aString contents: contentString position: aPosition backgroundColor: aColor labelColor: aLabelColor in: aMorph [
	^ (self label: aString contents: contentString)
			backgroundColor: aColor;
			labelColor: aLabelColor;
			contentsColor: aLabelColor;
			notifyPosition: aPosition; 
			openOn: aMorph
]

{ #category : #accessing }
MUDGrowlMorph class >> positionsAndLabels [
	^ OrderedDictionary newFromPairs: #(
	bottomLeft 		'Bottom Left'
	topRight 			'Top Right'
	bottomRight 		'Bottom Right'
	topLeft 			'Top Left' )
]

{ #category : #private }
MUDGrowlMorph >> activeGrowlMorphs [
	^ self owner submorphs select: [ :morph | morph isKindOf: GrowlMorph ].
]

{ #category : #private }
MUDGrowlMorph >> clearArea [
	^ self owner bounds insetBy: self clearAreaInset 
]

{ #category : #private }
MUDGrowlMorph >> clearAreaInset [
	#topRight == self notifyPosition ifTrue: [ ^ 5@ -8 ].
	#bottomRight == self notifyPosition ifTrue: [ ^ 0@ -8 ].
	^ -5@ -5
]

{ #category : #initialization }
MUDGrowlMorph >> initialize [
	super initialize.
	self borderWidth: 0
]

{ #category : #accessing }
MUDGrowlMorph >> notifyPosition [
	^ notifyPosition ifNil: [ self class position ]
]

{ #category : #accessing }
MUDGrowlMorph >> notifyPosition: anObject [
	notifyPosition := anObject
]

{ #category : #showing }
MUDGrowlMorph >> openOn: aMorph [
	self privateOwner: aMorph.
	self position: self unoccupiedPosition.
	aMorph addMorph: self.
	World startSteppingSubmorphsOf: self.
]

{ #category : #position }
MUDGrowlMorph >> unoccupiedPosition [
	self notifyPosition = #bottomLeft ifTrue: [ ^ self unoccupiedPositionBottomLeft ].
	self notifyPosition = #topRight ifTrue: [ ^ self unoccupiedPositionTopRight ].
	self notifyPosition = #bottomRight ifTrue: [ ^ self unoccupiedPositionBottomRight ].
	self notifyPosition = #topLeft ifTrue: [ ^ self unoccupiedPositionTopLeft ].
	^ 0@0	
	
]

{ #category : #position }
MUDGrowlMorph >> unoccupiedPositionBottomLeft [

	| startPos area rect morphs |
	
	startPos := 10 negated @ (self height + 10).
	area := self clearArea.
	rect := (area bottomLeft - startPos) extent: self extent.
	
	morphs := self activeGrowlMorphs.
	[self is: rect saneWithRespectTo: morphs] whileFalse: [
		rect := rect translateBy: 0@(-10).
		rect top < 0 ifTrue: [^ area bottomLeft - startPos]].
	^ rect origin
]

{ #category : #position }
MUDGrowlMorph >> unoccupiedPositionBottomRight [

	| startPos area rect morphs |
	
	startPos := (self width + 10 ) @ (self height + 10).
	area := self clearArea.
	rect := (area bottomRight - startPos) extent: self extent.
	
	morphs := self activeGrowlMorphs.	
	[self is: rect saneWithRespectTo: morphs] whileFalse: [
		rect := rect translateBy: 0@(-10).
		rect top < 0 ifTrue: [^ area bottomRight - startPos ]
	].
	^ rect origin
]

{ #category : #position }
MUDGrowlMorph >> unoccupiedPositionTopLeft [

	| startPos area rect morphs |
	
	startPos := 10@10.
	area := self clearArea.
	rect := area topLeft + (startPos) extent: self extent.
	
	morphs := self activeGrowlMorphs.
	[self is: rect saneWithRespectTo: morphs] whileFalse: [
		rect := rect translateBy: 0@10.
		rect bottom > area height ifTrue: [^ area topLeft + startPos ]
	].
	^ rect origin
]

{ #category : #position }
MUDGrowlMorph >> unoccupiedPositionTopRight [
	| startPos area rect morphs |
	
	startPos := (self width + 10 @ 10 negated).
	area := self clearArea.
	rect := (area topRight - startPos) extent: self extent.
	
	morphs := self activeGrowlMorphs.	
	[self is: rect saneWithRespectTo: morphs] whileFalse: [
		rect := rect translateBy: 0@10.
		rect bottom > area height ifTrue: [^ (area topRight - startPos) ] ].

	^ rect origin
]
