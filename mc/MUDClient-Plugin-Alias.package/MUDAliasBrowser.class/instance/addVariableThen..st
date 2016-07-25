actions
addVariableThen: aBlock
	| variable |
	
	variable := (TkMagritteEditor object: MUDVariable new) go.
	variable ifNil: [ ^ self ].
	self plugin addVariable: variable. 
	aBlock cull: variable
	