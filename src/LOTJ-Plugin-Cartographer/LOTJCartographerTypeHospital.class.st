Class {
	#name : #LOTJCartographerTypeHospital,
	#superclass : #LOTJCartographerRoomType,
	#category : 'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerTypeHospital >> asciiId [
	^ $h
]

{ #category : #accessing }
LOTJCartographerTypeHospital >> color [
	^ Color purple
]

{ #category : #accessing }
LOTJCartographerTypeHospital >> label [
	^ 'Hospital'
]
