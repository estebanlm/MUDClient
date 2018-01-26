Class {
	#name : #MUDKeyCommandNortheastEntered,
	#superclass : #MUDKeyCommandEntered,
	#category : #'MUDClient-View-Morph'
}

{ #category : #accessing }
MUDKeyCommandNortheastEntered class >> shortcut [
	^ $o command
]

{ #category : #visiting }
MUDKeyCommandNortheastEntered >> acceptVisitor: aVisitor [
	^ aVisitor visitNortheast: self
]
