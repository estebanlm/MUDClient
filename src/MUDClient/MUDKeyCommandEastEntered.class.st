Class {
	#name : #MUDKeyCommandEastEntered,
	#superclass : #MUDKeyCommandEntered,
	#category : #'MUDClient-View-Morph'
}

{ #category : #accessing }
MUDKeyCommandEastEntered class >> shortcut [
	^ $l command
]

{ #category : #visiting }
MUDKeyCommandEastEntered >> acceptVisitor: aVisitor [
	^ aVisitor visitEast: self
]
