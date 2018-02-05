Class {
	#name : #MUDKeyCommandNorthwestEntered,
	#superclass : #MUDKeyCommandEntered,
	#category : #'MUDClient-View-Morph'
}

{ #category : #accessing }
MUDKeyCommandNorthwestEntered class >> shortcut [
	^ Character arrowLeft alt ctrl
]

{ #category : #visiting }
MUDKeyCommandNorthwestEntered >> acceptVisitor: aVisitor [
	^ aVisitor visitNorthwest: self
]
