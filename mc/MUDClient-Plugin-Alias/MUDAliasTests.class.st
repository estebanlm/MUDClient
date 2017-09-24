Class {
	#name : #MUDAliasTests,
	#superclass : #TestCase,
	#category : 'MUDClient-Plugin-Alias'
}

{ #category : #tests }
MUDAliasTests >> testFilterInput [
	| alias terminal game session |
	
	game := MUDGameForTest new.
	alias := MUDAlias whenCommand: 'alias' send: 'trigger1
trigger2
trigger3'.
	game addPlugin: ((MUDAliasPlugin game: game) 
		addAlias: alias;
		yourself).

	terminal := MUDTerminalForTest new. 
	terminal connectTo: game.
	session := terminal session.
		
	self 
		assert: (terminal filterInput: 'alias') 
		equals: ('trigger1', String cr,'trigger2', String cr,'trigger3')
]

{ #category : #tests }
MUDAliasTests >> testMatches [
	| alias |
	
	alias := MUDAlias whenCommand: 'alias' send: 'some-trigger-command'.
	
	self assert: (alias matches: 'alias').
	self assert: (alias matches: 'alias with parameters').
	self assert: (alias matches: 'ALIAS').
	self assert: (alias matches: 'Alias').
	self assert: (alias matches: 'AlIas').
	self deny: (alias matches: 'alias1').
	self deny: (alias matches: 'aliasAsSuffix').
	self deny: (alias matches: 'aliasAsSuffix').
	self deny: (alias matches: 'prefixAsAlias').
	
]
