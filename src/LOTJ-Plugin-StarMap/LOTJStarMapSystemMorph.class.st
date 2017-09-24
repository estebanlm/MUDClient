"
I'm a morph for system/moons locations. 
"
Class {
	#name : #LOTJStarMapSystemMorph,
	#superclass : #LOTJStarMapPointMorph,
	#instVars : [
		'showName'
	],
	#category : 'LOTJ-Plugin-StarMap-View'
}

{ #category : #accessing }
LOTJStarMapSystemMorph class >> font [
	^ LogicalFont familyName: 'Consolas' pointSize: 7
]

{ #category : #accessing }
LOTJStarMapSystemMorph >> color [
	^ Color yellow
]

{ #category : #drawing }
LOTJStarMapSystemMorph >> drawNameOn: aCanvas [
	| w font |
	font := self class font.
	w := font widthOfString: self point name. 
	aCanvas 
		drawString: self point name 
		at: self bounds center + ((w / 2) asInteger negated @ 5)
		font: font
		color: self fontColor
]

{ #category : #drawing }
LOTJStarMapSystemMorph >> drawOn: aCanvas [
	aCanvas
		fillOval: self bounds
		color: self color
		borderWidth: 0
		borderColor: Color transparent.
	self isShowName 
		ifTrue: [ self drawNameOn: aCanvas ]
]

{ #category : #accessing }
LOTJStarMapSystemMorph >> fontColor [
	^ Color white
]

{ #category : #testing }
LOTJStarMapSystemMorph >> isShowName [
	^ self owner isShowNames
]
