showing
restoreOn: aTerminal
	self isOpened ifFalse: [ ^ self ].
	(self browserClass game: self game plugin: self plugin filter: self filter)
		openOn: aTerminal