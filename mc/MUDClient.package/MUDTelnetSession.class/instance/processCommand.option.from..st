private
processCommand: command option: option from: aStream
	option ifNil: [ ^ self ].
	
	self 
		protocolAt: option asInteger 
		ifPresent: [ :protocol | 
			protocol 
				processCommand: command asInteger 
				session: self 
				stream: aStream.
			^ self ].

	"Old fashion process"
	self processCmd: command option: option 