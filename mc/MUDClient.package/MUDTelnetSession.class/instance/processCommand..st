private
processCommand: aStream
	| command |
		
	command := aStream next.
	command ifNil: [  ^ nil ].
	command asInteger == IAC ifTrue: [ ^ command ].
	
	self
		processCommand: command 
		option: aStream next
		from: aStream.
			
	^ nil