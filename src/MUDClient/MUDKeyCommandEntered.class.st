Class {
	#name : #MUDKeyCommandEntered,
	#superclass : #MUDKeyAnnouncement,
	#category : #'MUDClient-View-Morph'
}

{ #category : #accessing }
MUDKeyCommandEntered class >> shortcut [
	^ self subclassResponsibility
]

{ #category : #visiting }
MUDKeyCommandEntered >> acceptVisitor: aVisitor [
	^ self subclassResponsibility
]
