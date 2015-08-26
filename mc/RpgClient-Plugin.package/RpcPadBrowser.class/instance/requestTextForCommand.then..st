actions
requestTextForCommand: aCommand then: aBlock 
	| command |
	
	command := (RpcPadCommandDialog command: aCommand) generate.
	command ifNil: [ ^ self ].
	aBlock cull: command