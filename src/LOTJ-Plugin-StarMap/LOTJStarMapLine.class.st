Class {
	#name : #LOTJStarMapLine,
	#superclass : #Object,
	#instVars : [
		'fromPoint',
		'toPoint'
	],
	#category : 'LOTJ-Plugin-StarMap-Model'
}

{ #category : #initialization }
LOTJStarMapLine class >> defaultColor [
	^ Color darkGray muchDarker darker
]

{ #category : #accessing }
LOTJStarMapLine >> color [
	^ self class defaultColor
]

{ #category : #accessing }
LOTJStarMapLine >> fromPoint [
	^ fromPoint
]

{ #category : #accessing }
LOTJStarMapLine >> fromPoint: anObject [
	fromPoint := anObject
]

{ #category : #accessing }
LOTJStarMapLine >> toPoint [
	^ toPoint
]

{ #category : #accessing }
LOTJStarMapLine >> toPoint: anObject [
	toPoint := anObject
]
