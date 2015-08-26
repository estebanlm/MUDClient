private events
refreshKeyBindings
	| category |
	category := (RpcKeyCategory named: 'RpcConsole-KEYS')
		owner: self;
		yourself.
	self installKeyBindingsOn: category.
	self dependentWindows do: [ :each | each installKeyBindingsOn: category ].
	self replaceKeyBindings: 'RpcConsole-KEYS' with: category