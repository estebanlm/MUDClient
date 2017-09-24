"
I indicate direction south.
"
Class {
	#name : #LOTJCartographerSouth,
	#superclass : #LOTJCartographerDirection,
	#category : 'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerSouth class >> directions [
	^ #('s' 'south')
]

{ #category : #accessing }
LOTJCartographerSouth class >> label [
	^ 'South'
]

{ #category : #accessing }
LOTJCartographerSouth >> asciiConnector [
	^ $|
]

{ #category : #accessing }
LOTJCartographerSouth >> coordinateModifier [
	^ 0@1
]

{ #category : #accessing }
LOTJCartographerSouth >> inverse [
	^ self class north
]
