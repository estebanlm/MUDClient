Class {
	#name : #MUDKeyCommandNorthwestEntered,
	#superclass : #MUDKeyCommandEntered,
	#category : #'MUDClient-View-Morph'
}

{ #category : #accessing }
MUDKeyCommandNorthwestEntered class >> shortcut [
	^ $u command
]

{ #category : #visiting }
MUDKeyCommandNorthwestEntered >> acceptVisitor: aVisitor [
	^ aVisitor visitNorthwest: self
]
