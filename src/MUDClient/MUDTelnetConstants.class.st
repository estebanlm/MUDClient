"
Constants for telnet commands. 
"
Class {
	#name : #MUDTelnetConstants,
	#superclass : #SharedPool,
	#classVars : [
		'ESC'
	],
	#category : #'MUDClient-Model-Telnet'
}

{ #category : #'class initialization' }
MUDTelnetConstants class >> initialize [
	ESC := 27
]
