Class {
	#name : #LOTJCartographerTypeMailbox,
	#superclass : #LOTJCartographerRoomType,
	#category : #'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerTypeMailbox >> asciiId [
	^ $m
]

{ #category : #accessing }
LOTJCartographerTypeMailbox >> color [
	^ Color named: #pastelOrange
]

{ #category : #accessing }
LOTJCartographerTypeMailbox >> label [
	^ 'Mailbox'
]
