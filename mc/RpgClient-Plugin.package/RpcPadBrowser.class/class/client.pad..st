instance creation
client: aClient pad: aPad 
	^ self basicNew 
		initializeClient: aClient pad: aPad;
		yourself