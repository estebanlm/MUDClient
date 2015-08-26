instance creation
command: aCommand 
	^ self basicNew 
		initializeCommand: aCommand;
		yourself