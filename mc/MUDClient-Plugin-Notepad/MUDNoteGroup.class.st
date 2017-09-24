"
I'm a group of notes.
"
Class {
	#name : #MUDNoteGroup,
	#superclass : #MUDNoteNode,
	#instVars : [
		'children'
	],
	#category : 'MUDClient-Plugin-Notepad-Model'
}

{ #category : #accessing }
MUDNoteGroup >> add: aNoteOrGroup [
	aNoteOrGroup parent: self.
	children := children copyWith: aNoteOrGroup
]

{ #category : #accessing }
MUDNoteGroup >> children [
	^ children
]

{ #category : #accessing }
MUDNoteGroup >> closestGroup [
	^ self
]

{ #category : #testing }
MUDNoteGroup >> hasChildren [
	^ children notEmpty
]

{ #category : #initialization }
MUDNoteGroup >> initialize [
	super initialize.
	children := #()
]

{ #category : #testing }
MUDNoteGroup >> isGroup [ 
	^ true
]

{ #category : #accessing }
MUDNoteGroup >> remove: aNoteOrGroup [ 
	children := children copyWithout: aNoteOrGroup
]
