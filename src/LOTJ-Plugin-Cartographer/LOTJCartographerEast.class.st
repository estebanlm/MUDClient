"
I indicate direction east.
"
Class {
	#name : #LOTJCartographerEast,
	#superclass : #LOTJCartographerDirection,
	#category : #'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerEast class >> directions [
	^ #('e' 'east')
]

{ #category : #accessing }
LOTJCartographerEast class >> label [
	^ 'East'
]

{ #category : #accessing }
LOTJCartographerEast >> asciiConnector [
	^ $-
]

{ #category : #accessing }
LOTJCartographerEast >> coordinateModifier [
	^ 1@0
]

{ #category : #accessing }
LOTJCartographerEast >> inverse [
	^ self class west
]
