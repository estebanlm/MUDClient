private
parseCommandLine: aString
	^ (MUDAliasCommandLineParser 
		parse: aString
		onError: [ :e | MUDAliasCommandLine keywords: { aString } ])
		rawLine: aString;
		yourself.