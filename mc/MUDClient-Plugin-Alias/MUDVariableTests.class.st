Class {
	#name : #MUDVariableTests,
	#superclass : #TestCase,
	#category : 'MUDClient-Plugin-Alias'
}

{ #category : #tests }
MUDVariableTests >> testFilterInput [
	| terminal game session |
	
	game := MUDGameForTest new.
	
	game addPlugin: ((MUDAliasPlugin game: game) 
		addVariable: (MUDVariable name: '$var1' value: '12345');
		addVariable: (MUDVariable name: '$var2' value: 'a string');
		addVariable: (MUDVariable name: '$var3' value: '"a string"');
		addVariable: (MUDVariable name: '$var4' value: '''a string''');
		yourself).

	terminal := MUDTerminalForTest new. 
	terminal connectTo: game.
	session := terminal session.
		
	self assert: (terminal filterInput: 'look in $var1') equals: 'look in 12345'.
	self assert: (terminal filterInput: 'look in $var2') equals: 'look in a string'.
	self assert: (terminal filterInput: 'look in $var3') equals: 'look in "a string"'.		
	self assert: (terminal filterInput: 'look in $var4') equals: 'look in ''a string'''.
	
	self 
		assert: (terminal filterInput: 'look in $var1', String cr) 
		equals: 'look in 12345', String cr.
	self 
		assert: (terminal filterInput: 'look in $var2', String cr) 
		equals: 'look in a string', String cr.
	self 
		assert: (terminal filterInput: 'look in $var3', String cr) 
		equals: 'look in "a string"', String cr.
	self 
		assert: (terminal filterInput: 'look in $var4', String cr) 
		equals: 'look in ''a string''', String cr.

	self assert: (terminal filterInput: 'look $var1 all') equals: 'look 12345 all'.
	self assert: (terminal filterInput: 'look $var2 all') equals: 'look a string all'.
	self assert: (terminal filterInput: 'look $var3 all') equals: 'look "a string" all'.		
	self assert: (terminal filterInput: 'look $var4 all') equals: 'look ''a string'' all'.
]

{ #category : #tests }
MUDVariableTests >> testFilterInputCommandLine [
	| variable terminal game session |
	
	game := MUDGameForTest new.
	variable := MUDVariable name: '$var1' value: 'trigger1'.
	game addPlugin: ((MUDAliasPlugin game: game) 
		addVariable: variable;
		yourself).

	terminal := MUDTerminalForTest new. 
	terminal connectTo: game.
	session := terminal session.
		
	self 
		assert: (terminal filterInput: '$var1 TEST') 
		equals: 'trigger1 TEST'
]

{ #category : #tests }
MUDVariableTests >> testMatches [
	| variable |
	
	variable := MUDVariable name: '$var1' value: '12345'.
	self assert: (variable matches: '$var1').
	self assert: (variable matches: 'some $var1').
	self assert: (variable matches: 'some $var1 more').
]
