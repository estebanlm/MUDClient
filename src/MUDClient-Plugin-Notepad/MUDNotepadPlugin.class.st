"
I define a notepad (a place where user can take notes related to the current game)

I'm a note group related to a game. 
I keep the relation game-notes.
I'm the entry point from notes.
"
Class {
	#name : #MUDNotepadPlugin,
	#superclass : #MUDPlugin,
	#instVars : [
		'root'
	],
	#category : 'MUDClient-Plugin-Notepad-Model'
}

{ #category : #persistence }
MUDNotepadPlugin class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
MUDNotepadPlugin >> root [
	^ root ifNil: [ root := MUDNoteGroup title: 'Root' ]
]
