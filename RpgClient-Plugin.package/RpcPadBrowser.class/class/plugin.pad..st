instance creation
plugin: aClient pad: aPad 
	^ self basicNew 
		initializePlugin: aClient pad: aPad;
		yourself