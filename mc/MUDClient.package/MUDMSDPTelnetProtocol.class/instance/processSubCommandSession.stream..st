processing
processSubCommandSession: aSession stream: aStream
	| cs byte  |
	
	cs := ByteArray new writeStream. 
	
	"Preamble to ensure the command is complete"
	cs << IAC << SB << MSDP.
	
	byte := nil.
	
	[[ byte == SE ] whileFalse: [
		byte := aStream next asInteger. 
		cs nextPut: byte ].
	
	"commandBlock ifNotNil: [ 
		commandBlock value: cs contents asString ]"
	]
	 on: Error do: [ :e | 
		e crLog.
		self log error: e ].