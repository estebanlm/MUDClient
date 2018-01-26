Class {
	#name : #MUDKeyCommandNorthEntered,
	#superclass : #MUDKeyCommandEntered,
	#category : #'MUDClient-View-Morph'
}

{ #category : #accessing }
MUDKeyCommandNorthEntered class >> shortcut [
	^ $i command
]

{ #category : #visiting }
MUDKeyCommandNorthEntered >> acceptVisitor: aVisitor [
	^ aVisitor visitNorth: self
]
