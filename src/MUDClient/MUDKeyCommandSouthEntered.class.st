Class {
	#name : #MUDKeyCommandSouthEntered,
	#superclass : #MUDKeyCommandEntered,
	#category : #'MUDClient-View-Morph'
}

{ #category : #accessing }
MUDKeyCommandSouthEntered class >> shortcut [
	^ Character arrowDown alt
]

{ #category : #visiting }
MUDKeyCommandSouthEntered >> acceptVisitor: aVisitor [
	^ aVisitor visitSouth: self
]
