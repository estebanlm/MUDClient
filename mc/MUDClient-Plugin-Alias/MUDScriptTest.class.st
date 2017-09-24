Class {
	#name : #MUDScriptTest,
	#superclass : #TestCase,
	#instVars : [
		'terminal',
		'script',
		'game'
	],
	#category : 'MUDClient-Plugin-Alias'
}

{ #category : #testing }
MUDScriptTest class >> isAbstract [
	self flag: #TODO. "Skipping"
	^ true
]

{ #category : #accessing }
MUDScriptTest >> script [
	^ script
]

{ #category : #accessing }
MUDScriptTest >> session [
	^ self terminal session
]

{ #category : #accessing }
MUDScriptTest >> setUp [
	game := MUDGameForTest new.
	terminal := MUDTerminalForTest new. 
	terminal connectTo: game.
	script := MUDScript on: terminal.
]

{ #category : #accessing }
MUDScriptTest >> terminal [
	^ terminal
]

{ #category : #tests }
MUDScriptTest >> testDoUntil [
	self script execute: [ :this |
		this 
			do: [ this send: 'test' ]
			until: 'stop' ].
	
	self terminal 
		receive: 'test outside';
		receive: 'stop'.
	
	self 
		assert: self session contents 
		equals: (
			'test', String crlf,
			'test outside', String crlf, 
			'stop', String crlf )
]

{ #category : #tests }
MUDScriptTest >> testDoUntilAnyOf [
	self script execute: [ :this |
		this 
			do: [ this send: 'test' ]
			untilAnyOf: #('stop' 'alto') ].
	
	self 
		assert: self session contents 
		equals: (
			'test', String crlf,
			'test outside', String crlf, 
			'alto', String crlf )
]

{ #category : #tests }
MUDScriptTest >> testDoWhileAnyOfUntilAnyOf [
	self script execute: [ :this |
		this 
			do: [ this send: 'test' ]
			whileAnyOf: #('pass' 'cont')
			untilAnyOf: #('stop' 'alto') ].
	
	self 
		assert: self session contents 
		equals: (
			'test', String crlf,
			'pass', String crlf, 
			'test', String crlf,
			'cont', String crlf, 
			'test', String crlf,
			'alto', String crlf )
]

{ #category : #tests }
MUDScriptTest >> testDoWhileUntil [
	self script execute: [ :this |
		this 
			do: [ this send: 'test' ]
			while: 'pass'
			until: 'stop' ].
	
	self 
		assert: self session contents 
		equals: (
			'test', String crlf,
			'pass', String crlf, 
			'test', String crlf,
			'pass', String crlf, 
			'test', String crlf,
			'stop', String crlf )
]

{ #category : #tests }
MUDScriptTest >> testSend [
	self script execute: [ :this |
		this send: 'test' ].
	
	self 
		assert: self session contents 
		equals: ('test', String crlf)
]
