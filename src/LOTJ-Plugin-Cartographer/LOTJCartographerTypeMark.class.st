Class {
	#name : #LOTJCartographerTypeMark,
	#superclass : #LOTJCartographerRoomType,
	#category : #'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerTypeMark >> asciiId [
	^ $%
]

{ #category : #accessing }
LOTJCartographerTypeMark >> color [
	^ Color lightGray
]

{ #category : #accessing }
LOTJCartographerTypeMark >> label [
	^ 'Mark'
]
