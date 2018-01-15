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
	^ Color named: #greyishBlue
]

{ #category : #accessing }
LOTJCartographerTypeMark >> label [
	^ 'Mark'
]
