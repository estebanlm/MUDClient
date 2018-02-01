Class {
	#name : #MUDKeyCommandNortheastEntered,
	#superclass : #MUDKeyCommandEntered,
	#category : #'MUDClient-View-Morph'
}

{ #category : #accessing }
MUDKeyCommandNortheastEntered class >> shortcut [
	^ Character arrowUp alt shift
]

{ #category : #visiting }
MUDKeyCommandNortheastEntered >> acceptVisitor: aVisitor [
	^ aVisitor visitNortheast: self
]
