showing
openTinyOn: aTerminal
	self owner: aTerminal.
	aTerminal addDependentWindow: self.
	super openTiny