Class {
	#name : #MUDPresentationActivated,
	#superclass : #Announcement,
	#instVars : [
		'presentation'
	],
	#category : #'MUDClient-View-Glamour'
}

{ #category : #accessing }
MUDPresentationActivated >> presentation [
	^ presentation
]

{ #category : #accessing }
MUDPresentationActivated >> presentation: anObject [
	presentation := anObject
]
