processing
processSubCommandSession: aSession stream: aStream
	| cs byte data |
	
	cs := ByteArray new writeStream. 
	
	"Preamble to ensure the command is complete"
	cs << IAC << SB << MSDP.
	
	byte := nil.
	
	[[ byte == SE ] whileFalse: [
		byte := aStream next asInteger. 
		cs nextPut: byte ].
	
		data := cs contents.
		aSession announce: (MUDMSDPCommandReceived new
			protocol: self;
			data: data;
			variable: (self parser parse: data asString);
			yourself) ]
	 on: Error do: [ :e | 
		e crLog.
		self log error: e ].