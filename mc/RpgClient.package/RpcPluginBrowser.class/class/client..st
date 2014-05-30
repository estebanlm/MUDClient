instance creation
client: aClient
	^ self basicNew 
		initializeClient: aClient;
		yourself