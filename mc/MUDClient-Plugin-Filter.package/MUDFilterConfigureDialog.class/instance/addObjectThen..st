actions
addObjectThen: aBlock
	| filter |
	
	filter := (TkMagritteEditor object: MUDFilter new) go.
	filter ifNil: [ ^ self ].
	self plugin addFilter: filter. 
	aBlock cull: filter