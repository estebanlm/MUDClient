Class {
	#name : #MUDKeyCommandSouthwestEntered,
	#superclass : #MUDKeyCommandEntered,
	#category : #'MUDClient-View-Morph'
}

{ #category : #accessing }
MUDKeyCommandSouthwestEntered class >> shortcut [
	^ Character arrowDown ctrl alt
]

{ #category : #visiting }
MUDKeyCommandSouthwestEntered >> acceptVisitor: aVisitor [
	^ aVisitor visitSouthwest: self
]
