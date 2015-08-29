actions
requestTextForCommand: aCommand then: aBlock 
	| command |
	
	command := (MUDPadCommandDialog command: aCommand) generate.
	command ifNil: [ ^ self ].
	aBlock cull: command