actions
addFilter 
	| filter |
	
	filter := (TkMagritteEditor object: MUDFilter new) go.
	filter ifNil: [ ^ self ].
	self plugin addFilter: filter. 
	self hardRefresh