Class {
	#name : #LOTJCartographerTypeNone,
	#superclass : #LOTJCartographerRoomType,
	#category : 'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerTypeNone >> asciiId [
	^ $#
]

{ #category : #testing }
LOTJCartographerTypeNone >> isNone [
	^ true
]

{ #category : #accessing }
LOTJCartographerTypeNone >> label [
	^ 'None'
]
