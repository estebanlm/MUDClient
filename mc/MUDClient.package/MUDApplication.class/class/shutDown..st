system startup
shutDown: quitting
	quitting ifFalse: [ ^ self ].
	self saveToDisk.
	self reset.