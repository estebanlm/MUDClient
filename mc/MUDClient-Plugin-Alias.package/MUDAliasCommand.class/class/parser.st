private
parser 
	^ CommandParser ifNil: [ CommandParser := MUDAliasCommandLineDefinitionParser new ]
		