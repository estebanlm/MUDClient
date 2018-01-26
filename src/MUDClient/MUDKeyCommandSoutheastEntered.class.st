Class {
	#name : #MUDKeyCommandSoutheastEntered,
	#superclass : #MUDKeyCommandEntered,
	#category : #'MUDClient-View-Morph'
}

{ #category : #accessing }
MUDKeyCommandSoutheastEntered class >> shortcut [
	^ $, command
]

{ #category : #visiting }
MUDKeyCommandSoutheastEntered >> acceptVisitor: aVisitor [
	^ aVisitor visitSoutheast: self
]
