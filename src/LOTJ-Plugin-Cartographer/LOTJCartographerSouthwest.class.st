"
I indicate direction southwest.
"
Class {
	#name : #LOTJCartographerSouthwest,
	#superclass : #LOTJCartographerDirection,
	#category : 'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerSouthwest class >> directions [
	^ #('sw' 'southwest')
]

{ #category : #accessing }
LOTJCartographerSouthwest class >> label [
	^ 'Southwest'
]

{ #category : #accessing }
LOTJCartographerSouthwest >> asciiConnector [
	^ $/
]

{ #category : #accessing }
LOTJCartographerSouthwest >> coordinateModifier [
	^ -1@1
]

{ #category : #accessing }
LOTJCartographerSouthwest >> inverse [
	^ self class northeast
]
