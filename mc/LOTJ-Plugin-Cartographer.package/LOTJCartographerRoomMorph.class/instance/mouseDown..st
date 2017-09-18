event handling
mouseDown: evt
	super mouseDown: evt.
	evt yellowButtonPressed ifTrue: [ ^ self showMenu ] .
	self owner 
		internalSelect: self room;
		update
