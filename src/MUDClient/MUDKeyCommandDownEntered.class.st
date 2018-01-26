Class {
	#name : #MUDKeyCommandDownEntered,
	#superclass : #MUDKeyCommandEntered,
	#category : #'MUDClient-View-Morph'
}

{ #category : #accessing }
MUDKeyCommandDownEntered class >> shortcut [
	^ $k command shift
]

{ #category : #visiting }
MUDKeyCommandDownEntered >> acceptVisitor: aVisitor [
	^ aVisitor visitDown: self
]
