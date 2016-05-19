actions
requestTextForCommand: aCommand then: aBlock 
	| command |
	
	command := (TkMagritteEditor object: aCommand) go.
	command ifNil: [ ^ self ].
	aBlock cull: command