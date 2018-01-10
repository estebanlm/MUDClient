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

{ #category : #persistence }
MUDNoteGroup class >> voyageChildren [
	<voyageDescription>
	
	^ VOToOneDescription new
		attributeName: 'children';
		accessor: (MAPluggableAccessor 
			read: [ :group | group children ]
			write: [ :group :children | group setChildren: children ]);
		yourself 
	
]

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

{ #category : #private }
MUDNoteGroup >> setChildren: aCollection [
	aCollection do: [ :each | each parent: self ].
	children := aCollection
]
