"
I'm a note node. I can be a group or a single note.
"
Class {
	#name : #MUDNoteNode,
	#superclass : #Object,
	#instVars : [
		'title',
		'parent'
	],
	#category : 'MUDClient-Plugin-Notepad-Model'
}

{ #category : #defaults }
MUDNoteNode class >> defaultTitle [
	^ 'Untitled'
]

{ #category : #testing }
MUDNoteNode class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
MUDNoteNode class >> title: aString [
	^ self new 
		title: aString;
		yourself
]

{ #category : #persistence }
MUDNoteNode class >> voyageCollectionName [
	^ 'plugin-notes'
]

{ #category : #persistence }
MUDNoteNode class >> voyageParent [
	<voyageDescription>
	
	^ VOTransientDescription new
		attributeName: 'parent';
		yourself 
]

{ #category : #accessing }
MUDNoteNode >> closestGroup [ 
	"Answers the closes group"
	^ self subclassResponsibility
]

{ #category : #initialization }
MUDNoteNode >> initialize [
	super initialize.
	self title: self class defaultTitle
]

{ #category : #testing }
MUDNoteNode >> isGroup [ 
	^ false
]

{ #category : #testing }
MUDNoteNode >> isRoot [
	^ self parent isNil
]

{ #category : #accessing }
MUDNoteNode >> parent [
	^ parent
]

{ #category : #accessing }
MUDNoteNode >> parent: anObject [
	parent := anObject
]

{ #category : #persistence }
MUDNoteNode >> remove [
	self isRoot 
		ifTrue: [ super remove ]
		ifFalse: [ 
			self parent remove: self.
			self root save ]
]

{ #category : #accessing }
MUDNoteNode >> root [ 
	| root |
	
	root := self.
	[ root parent isNil ]
	whileFalse: [ root := root parent ].
	
	^ root
]

{ #category : #persistence }
MUDNoteNode >> save [ 
	self isRoot 
		ifTrue: [ super save ]
		ifFalse: [ self root save ]
]

{ #category : #accessing }
MUDNoteNode >> title [
	^ title
]

{ #category : #accessing }
MUDNoteNode >> title: anObject [
	title := anObject
]
