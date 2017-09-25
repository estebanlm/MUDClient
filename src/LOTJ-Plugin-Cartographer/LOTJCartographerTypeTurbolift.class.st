Class {
	#name : #LOTJCartographerTypeTurbolift,
	#superclass : #LOTJCartographerRoomType,
	#category : 'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerTypeTurbolift >> asciiId [
	^ $+
]

{ #category : #accessing }
LOTJCartographerTypeTurbolift >> color [
	^ Color red
]

{ #category : #testing }
LOTJCartographerTypeTurbolift >> isAreaTransition [
	^ true
]

{ #category : #testing }
LOTJCartographerTypeTurbolift >> isMultiple [
	^ true
]

{ #category : #testing }
LOTJCartographerTypeTurbolift >> isTerminal [
	^ true
]

{ #category : #accessing }
LOTJCartographerTypeTurbolift >> label [
	^ 'Turbolift'
]
