showing
restoreOn: aTerminal
	self isOpened ifFalse: [ ^ self ].
	(self browserClass game: self game plugin: self plugin)
		openOn: aTerminal