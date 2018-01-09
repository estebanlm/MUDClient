"
I'm an interesting point morph. 
I'm ment to be used with the star map morph.
"
Class {
	#name : #LOTJStarMapPointMorph,
	#superclass : #Morph,
	#instVars : [
		'point'
	],
	#category : #'LOTJ-Plugin-StarMap-View'
}

{ #category : #accessing }
LOTJStarMapPointMorph class >> defaultExtent [
	^ LOTJStarMapMorph sectorSize asPoint
]

{ #category : #'instance creation' }
LOTJStarMapPointMorph class >> point: aPoint [
	^ self new point: aPoint
]

{ #category : #initialization }
LOTJStarMapPointMorph >> initialize [
	super initialize.
	self extent: self class defaultExtent
]

{ #category : #accessing }
LOTJStarMapPointMorph >> point [
	^ point
]

{ #category : #accessing }
LOTJStarMapPointMorph >> point: anObject [
	point := anObject.
	self setBalloonText: point asString.
]
