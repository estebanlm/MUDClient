actions
addObjectThen: aBlock
	| filter |
	
	filter := (TkMagritteEditor object: self filterClass new) go.
	filter ifNil: [ ^ self ].
	self plugin addFilter: filter. 
	aBlock cull: filter