event handling
mouseDown: evt
	super mouseDown: evt.
	evt yellowButtonPressed ifTrue: [ ^self ] .
	self owner internalSelect: self room
