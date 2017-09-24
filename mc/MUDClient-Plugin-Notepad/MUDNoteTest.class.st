Class {
	#name : #MUDNoteTest,
	#superclass : #TestCase,
	#category : 'MUDClient-Plugin-Notepad-Tests'
}

{ #category : #tests }
MUDNoteTest >> testClosestGroup [
	| group note |
	
	group := MUDNoteGroup new.
	note := MUDNote new.
	
	group add: note.
	
	self assert: note closestGroup equals: group
]

{ #category : #tests }
MUDNoteTest >> testNew [
	| newNote |
	
	newNote := MUDNote new.
	self assert: newNote title equals: MUDNote defaultTitle.
	self assert: newNote contents isEmptyOrNil.
	self deny: newNote isGroup
]
