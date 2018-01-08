"
I indicate direction west.
"
Class {
	#name : #LOTJCartographerWest,
	#superclass : #LOTJCartographerDirection,
	#category : #'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerWest class >> directions [
	^ #('w' 'west')
]

{ #category : #accessing }
LOTJCartographerWest class >> label [
	^ 'West'
]

{ #category : #accessing }
LOTJCartographerWest >> asciiConnector [
	^ $-
]

{ #category : #accessing }
LOTJCartographerWest >> coordinateModifier [
	^ -1@0
]

{ #category : #accessing }
LOTJCartographerWest >> inverse [
	^ self class east
]
