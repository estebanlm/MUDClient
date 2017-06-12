private
sendCommand: bytes
	self waitForAnswer
		ifTrue: [ self terminal addServerCommandReceiver: self ].
	self terminal sendCommand: bytes