Class {
	#name : #LOTJCartographerTypeBroadcast,
	#superclass : #LOTJCartographerRoomType,
	#category : 'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerTypeBroadcast >> asciiId [
	^ $b
]

{ #category : #accessing }
LOTJCartographerTypeBroadcast >> color [
	^ Color r: 16r87 g: 16rCE b: 16rFA range: 255
]

{ #category : #accessing }
LOTJCartographerTypeBroadcast >> label [
	^ 'Broadcast'
]
