showing
openOn: aTerminal
	self owner: aTerminal.
	aTerminal addDependentWindow: self.
	super open