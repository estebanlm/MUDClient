Class {
	#name : #MUDKeyCommandDownEntered,
	#superclass : #MUDKeyCommandEntered,
	#category : #'MUDClient-View-Morph'
}

{ #category : #accessing }
MUDKeyCommandDownEntered class >> shortcut [
	^ Character arrowDown alt
]

{ #category : #visiting }
MUDKeyCommandDownEntered >> acceptVisitor: aVisitor [
	^ aVisitor visitDown: self
]
