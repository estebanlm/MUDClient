private
nextFrom: aStream
	| byte |
	
	byte := aStream next.

	byte asInteger == IAC 
		ifTrue: [ ^ self processCommand: aStream ].

	byte asInteger == 0
		ifTrue:  [ ^ nil ]. 
		
	^ byte