"
I indicate direction north.
"
Class {
	#name : #LOTJCartographerNorth,
	#superclass : #LOTJCartographerDirection,
	#category : #'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerNorth class >> directions [
	^ #('n' 'north')
]

{ #category : #accessing }
LOTJCartographerNorth class >> label [
	^ 'North'
]

{ #category : #accessing }
LOTJCartographerNorth >> asciiConnector [
	^ $|
]

{ #category : #accessing }
LOTJCartographerNorth >> coordinateModifier [
	^ 0@ -1
]

{ #category : #accessing }
LOTJCartographerNorth >> inverse [
	^ self class south
]
