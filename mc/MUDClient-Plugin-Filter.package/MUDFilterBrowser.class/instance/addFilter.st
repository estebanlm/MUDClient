actions
addFilter 
	| filter |
	
	filter := (MUDMagritteGenerator for: MUDFilter new) generate.
	filter ifNil: [ ^ self ].
	self plugin addFilter: filter. 
	self hardRefresh