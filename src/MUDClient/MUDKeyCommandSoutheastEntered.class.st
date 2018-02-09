Class {
	#name : #MUDKeyCommandSoutheastEntered,
	#superclass : #MUDKeyCommandEntered,
	#category : #'MUDClient-View-Morph'
}

{ #category : #accessing }
MUDKeyCommandSoutheastEntered class >> shortcut [
	^ Character arrowRight alt shift
]

{ #category : #visiting }
MUDKeyCommandSoutheastEntered >> acceptVisitor: aVisitor [
	^ aVisitor visitSoutheast: self
]
