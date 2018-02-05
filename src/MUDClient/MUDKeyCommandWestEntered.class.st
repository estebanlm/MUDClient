Class {
	#name : #MUDKeyCommandWestEntered,
	#superclass : #MUDKeyCommandEntered,
	#category : #'MUDClient-View-Morph'
}

{ #category : #accessing }
MUDKeyCommandWestEntered class >> shortcut [
	^ Character arrowLeft alt
]

{ #category : #visiting }
MUDKeyCommandWestEntered >> acceptVisitor: aVisitor [
	^ aVisitor visitWest: self
]
