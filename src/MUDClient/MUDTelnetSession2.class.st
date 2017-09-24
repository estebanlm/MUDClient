Class {
	#name : #MUDTelnetSession2,
	#superclass : #TelnetSessionBasic,
	#instVars : [
		'host',
		'port'
	],
	#category : 'MUDClient-Model-Telnet'
}

{ #category : #connection }
MUDTelnetSession2 >> connectToHostNamed: aString port: aNumber [
	host := aString.
	port := aNumber.
	
	super connectToHostNamed: aString port: aNumber.
	self startProcess.
]

{ #category : #initialization }
MUDTelnetSession2 >> initialize [
	super initialize.
	self rawModeOn
]
