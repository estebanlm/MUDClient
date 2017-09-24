"
I indicate direction northeast.
"
Class {
	#name : #LOTJCartographerNortheast,
	#superclass : #LOTJCartographerDirection,
	#category : 'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerNortheast class >> directions [
	^ #('ne' 'northeast')
]

{ #category : #accessing }
LOTJCartographerNortheast class >> label [
	^ 'Northeast'
]

{ #category : #accessing }
LOTJCartographerNortheast >> asciiConnector [
	^ $/
]

{ #category : #accessing }
LOTJCartographerNortheast >> coordinateModifier [
	^ 1@ -1
]

{ #category : #accessing }
LOTJCartographerNortheast >> inverse [
	^ self class southwest
]
