Class {
	#name : #MUDKeyCommandEastEntered,
	#superclass : #MUDKeyCommandEntered,
	#category : #'MUDClient-View-Morph'
}

{ #category : #accessing }
MUDKeyCommandEastEntered class >> shortcut [
	^ Character arrowRight shift
]

{ #category : #visiting }
MUDKeyCommandEastEntered >> acceptVisitor: aVisitor [
	^ aVisitor visitEast: self
]
