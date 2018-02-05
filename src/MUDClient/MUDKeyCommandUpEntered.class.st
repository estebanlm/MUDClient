Class {
	#name : #MUDKeyCommandUpEntered,
	#superclass : #MUDKeyCommandEntered,
	#category : #'MUDClient-View-Morph'
}

{ #category : #accessing }
MUDKeyCommandUpEntered class >> shortcut [
	^ Character arrowUp alt shift
]

{ #category : #visiting }
MUDKeyCommandUpEntered >> acceptVisitor: aVisitor [
	^ aVisitor visitUp: self
]
