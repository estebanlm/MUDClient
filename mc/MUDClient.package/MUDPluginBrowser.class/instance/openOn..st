showing
openOn: aTerminal
	self owner: aTerminal.
	aTerminal addDependentWindow: self.
	self isMiniWindow 
		ifTrue: [ super openMiniWindow ]
		ifFalse: [ super open ]