"
I'm a morph for empty (or not charted) galaxy locations. 
"
Class {
	#name : #LOTJStarMapSpaceMorph,
	#superclass : #LOTJStarMapPointMorph,
	#category : 'LOTJ-Plugin-StarMap-View'
}

{ #category : #accessing }
LOTJStarMapSpaceMorph >> color [ 
	^ self point color
		ifNil: [ Color darkGray muchDarker ]
]

{ #category : #drawing }
LOTJStarMapSpaceMorph >> drawOn: aCanvas [
	self isVisible ifFalse: [ ^ self ].
	aCanvas 
		fillRectangle: self bounds 
		color: self color

]

{ #category : #testing }
LOTJStarMapSpaceMorph >> isVisible [
	^ self owner isShowMarkers
]
