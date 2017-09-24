Class {
	#name : #MUDNoteGroupTest,
	#superclass : #TestCase,
	#instVars : [
		'group'
	],
	#category : 'MUDClient-Plugin-Notepad-Tests'
}

{ #category : #running }
MUDNoteGroupTest >> setUp [ 
	super setUp.
	group := MUDNoteGroup new
]

{ #category : #tests }
MUDNoteGroupTest >> testAdd [
	self deny: group hasChildren.
	group add: MUDNote new.
	self assert: group hasChildren	
]

{ #category : #tests }
MUDNoteGroupTest >> testNew [ 
	| newGroup |
	
	newGroup := MUDNoteGroup new. 
	self assert: newGroup title equals: MUDNoteGroup defaultTitle.
	self deny: newGroup hasChildren.
	self assert: newGroup isGroup
]
