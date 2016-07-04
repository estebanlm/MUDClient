accessing
commandLineParser 
	^ CommandLineParser ifNil: [ CommandLineParser := MUDAliasCommandLineParser new ]
		