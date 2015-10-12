processing
processCommand: command session: aSession stream: aStream
	| reply |

	command = WILL ifTrue: [ reply := self willDO ].
	command = DO ifTrue: [ reply := self willMSDP ].
	command = SB ifTrue: [ self processSubCommandSession: aSession stream: aStream ].
	
	reply ifNotNil: [
		aSession sendData: reply ]	