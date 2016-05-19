actions
addAliasThen: aBlock
	| alias |
	
	alias := (TkMagritteEditor object: MUDAlias new) go.
	alias ifNil: [ ^ self ].
	self plugin addAlias: alias. 
	aBlock cull: alias
	
	