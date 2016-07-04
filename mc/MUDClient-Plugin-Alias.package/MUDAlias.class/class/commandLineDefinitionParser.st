accessing
commandLineDefinitionParser 
	^ CommandLineDefinitionParser ifNil: [ 
		CommandLineDefinitionParser := MUDAliasCommandLineDefinitionParser new ]
		