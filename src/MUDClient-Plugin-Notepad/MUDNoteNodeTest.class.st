Class {
	#name : #MUDNoteNodeTest,
	#superclass : #TestCase,
	#category : 'MUDClient-Plugin-Notepad-Tests'
}

{ #category : #tests }
MUDNoteNodeTest >> testClosestGroup [
	| group1 group2 |
	
	group1 := MUDNoteGroup new.
	group2 := MUDNoteGroup new.
	
	group1 add: group2.
	
	self assert: group2 closestGroup equals: group2
]

{ #category : #tests }
MUDNoteNodeTest >> testRoot [ 
	| root g1 g2 note |
	
	root := MUDNoteGroup new.
	g1 := MUDNoteGroup new.
	g2 := MUDNoteGroup new.
	note := MUDNote new.
	
	root add: g1.
	g1 add: g2.
	g2 add: note. 
	
	self assert: note root equals: root
]
