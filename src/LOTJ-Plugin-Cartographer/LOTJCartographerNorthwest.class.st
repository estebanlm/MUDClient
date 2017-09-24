"
I indicate direction northwest.
"
Class {
	#name : #LOTJCartographerNorthwest,
	#superclass : #LOTJCartographerDirection,
	#category : 'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerNorthwest class >> directions [
	^ #('nw' 'northwest')
]

{ #category : #accessing }
LOTJCartographerNorthwest class >> label [
	^ 'Northwest'
]

{ #category : #accessing }
LOTJCartographerNorthwest >> asciiConnector [
	^ $\
]

{ #category : #accessing }
LOTJCartographerNorthwest >> coordinateModifier [
	^ -1 @ -1
]

{ #category : #accessing }
LOTJCartographerNorthwest >> inverse [
	^ self class southeast
]
