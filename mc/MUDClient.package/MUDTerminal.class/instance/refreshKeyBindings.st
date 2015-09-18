private events
refreshKeyBindings
	| category |
	category := (MUDKeyCategory named: 'MUDTerminal-KEYS')
		owner: self;
		yourself.
	self installKeyBindingsOn: category.
	self dependentWindows do: [ :each | each installKeyBindingsOn: category ].
	self replaceKeyBindings: 'MUDTerminal-KEYS' with: category