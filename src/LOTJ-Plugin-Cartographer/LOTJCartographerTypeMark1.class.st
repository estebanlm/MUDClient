Class {
	#name : #LOTJCartographerTypeMark1,
	#superclass : #LOTJCartographerRoomType,
	#category : #'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerTypeMark1 >> asciiId [
	^ $%
]

{ #category : #accessing }
LOTJCartographerTypeMark1 >> color [
	^ Color named: #'blue/grey'
]

{ #category : #accessing }
LOTJCartographerTypeMark1 >> label [
	^ 'Mark 1'
]
