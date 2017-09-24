"
I indicate direction down.
"
Class {
	#name : #LOTJCartographerDown,
	#superclass : #LOTJCartographerDirection,
	#category : 'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerDown class >> directions [
	^ #('d' 'down')
]

{ #category : #accessing }
LOTJCartographerDown class >> label [
	^ 'Down'
]

{ #category : #accessing }
LOTJCartographerDown >> inverse [
	^ self class up
]
