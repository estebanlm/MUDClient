actions
addAliasThen: aBlock
	| alias |
	
	alias := (MUDMagritteGenerator for: (MUDAlias new)) generate.
	alias ifNil: [ ^ self ].
	self plugin addAlias: alias. 
	aBlock cull: alias
	
	