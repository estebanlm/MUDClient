Class {
	#name : #MUDKeyCommandSoutheastEntered,
	#superclass : #MUDKeyCommandEntered,
	#category : #'MUDClient-View-Morph'
}

{ #category : #accessing }
MUDKeyCommandSoutheastEntered class >> shortcut [
	^ Character arrowRight alt ctrl
]

{ #category : #visiting }
MUDKeyCommandSoutheastEntered >> acceptVisitor: aVisitor [
	^ aVisitor visitSoutheast: self
]
