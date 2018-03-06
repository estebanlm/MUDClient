"
I'm an interesting point on the star map.

"
Class {
	#name : #LOTJStarMapPoint,
	#superclass : #Object,
	#instVars : [
		'owner',
		'notes',
		'origin',
		'sector'
	],
	#category : #'LOTJ-Plugin-StarMap-Model'
}

{ #category : #accessing }
LOTJStarMapPoint class >> internalOrigin [
	^ #internal
]

{ #category : #'instance creation' }
LOTJStarMapPoint class >> sector: aPoint [
	^ self new sector: aPoint
]

{ #category : #converting }
LOTJStarMapPoint >> asMorph [
	^ self subclassResponsibility
]

{ #category : #descriptions }
LOTJStarMapPoint >> descriptionSector [
	<magritteDescription>
	
	^ MAStringDescription new 
		priority: 10;
		label: 'Sector';
		accessor: #sector;
		beReadonly;
		yourself

]

{ #category : #testing }
LOTJStarMapPoint >> isEmptySpace [
	^ false
]

{ #category : #testing }
LOTJStarMapPoint >> isSystem [
	^ false
]

{ #category : #testing }
LOTJStarMapPoint >> isUnexplored [
	^ false
]

{ #category : #accessing }
LOTJStarMapPoint >> notes [
	^ notes
]

{ #category : #accessing }
LOTJStarMapPoint >> notes: anObject [
	notes := anObject
]

{ #category : #accessing }
LOTJStarMapPoint >> origin [
	^ origin
]

{ #category : #accessing }
LOTJStarMapPoint >> origin: anObject [
	origin := anObject
]

{ #category : #accessing }
LOTJStarMapPoint >> owner [
	^ owner
]

{ #category : #accessing }
LOTJStarMapPoint >> owner: anObject [
	owner := anObject
]

{ #category : #printing }
LOTJStarMapPoint >> printOn: stream [
	stream << self type << ' ' << self sector asString
]

{ #category : #accessing }
LOTJStarMapPoint >> sector [
	^ sector
]

{ #category : #accessing }
LOTJStarMapPoint >> sector: anObject [
	sector := anObject
]

{ #category : #accessing }
LOTJStarMapPoint >> type [
	^ self subclassResponsibility
]
