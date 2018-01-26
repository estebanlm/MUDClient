Class {
	#name : #MUDKeyCommandSouthwestEntered,
	#superclass : #MUDKeyCommandEntered,
	#category : #'MUDClient-View-Morph'
}

{ #category : #accessing }
MUDKeyCommandSouthwestEntered class >> shortcut [
	^ $m command
]

{ #category : #visiting }
MUDKeyCommandSouthwestEntered >> acceptVisitor: aVisitor [
	^ aVisitor visitSouthwest: self
]
