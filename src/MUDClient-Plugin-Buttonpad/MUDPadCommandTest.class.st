Class {
	#name : #MUDPadCommandTest,
	#superclass : #TestCase,
	#category : 'MUDClient-Plugin-Buttonpad-Tests'
}

{ #category : #tests }
MUDPadCommandTest >> testExecuteFor [
	| terminal game gamePad pad command session |
	
	game := MUDGameForTest new.
	terminal := MUDTerminalForTest new. 
	terminal connectTo: game.
	session := terminal session.
	gamePad := MUDPadPlugin game: game.
	pad := gamePad addNew.
	command := pad commandAt: 1.
	command text: 'test'.
	
	command executeOn: terminal.
	
	self assert: session contents equals: ('test', String crlf)
]

{ #category : #tests }
MUDPadCommandTest >> testExecuteForWithPrefix [
	| terminal game gamePad pad command session |
	
	terminal := MUDTerminalForTest new.
	game := MUDGameForTest new.
	terminal connectTo: game.
	session := terminal session.
	gamePad := MUDPadPlugin game: game.
	pad := gamePad addNew.
	pad prefix: 'tune'.
	command := pad commandAt: 1.
	command text: 'test'.
	
	command executeOn: terminal.
	
	self assert: session contents equals: ('tune test', String crlf)
]
