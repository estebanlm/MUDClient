Class {
	#name : #MUDGameNotepadTest,
	#superclass : #TestCase,
	#category : 'MUDClient-Plugin-Notepad-Tests'
}

{ #category : #tests }
MUDGameNotepadTest >> testGame [
	| game notepad |
	
	game := MUDGame name: 'test' host: nil port: nil.
	notepad := MUDNotepadPlugin new game: game.
	self assert: notepad game equals: game.
	self assert: notepad root children isEmpty
]
