"
I'm a generic note. 
Users can take notes (and in general, they will... is better than remembering everything). 
"
Class {
	#name : #MUDNote,
	#superclass : #MUDNoteNode,
	#instVars : [
		'contents'
	],
	#category : 'MUDClient-Plugin-Notepad-Model'
}

{ #category : #accessing }
MUDNote >> closestGroup [
	^ self parent
]

{ #category : #accessing }
MUDNote >> contents [
	^ contents
]

{ #category : #accessing }
MUDNote >> contents: anObject [
	contents := anObject
]
