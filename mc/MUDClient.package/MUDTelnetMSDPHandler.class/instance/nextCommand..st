processing
nextCommand: command
	| stream byte |
	
	byte := nil.
	stream := ByteArray new writeStream.
	"Preamble to ensure the command is complete"
	stream << IAC << SB << MSDP.		
	[ stream << (byte := self next) ]
	doWhileFalse: [ byte = SE ].
	^ stream contents.
		