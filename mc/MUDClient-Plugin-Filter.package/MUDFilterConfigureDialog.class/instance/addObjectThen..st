actions
addObjectThen: aBlock
	| filter |
	
	filter := (MUDMagritteGenerator for: MUDFilter new) generate.
	filter ifNil: [ ^ self ].
	self plugin addFilter: filter. 
	aBlock cull: filter