instance creation
name: aString host: urlString port: portNumber 
	^ self basicNew 
		initializeName: aString 
			host: urlString 
			port: portNumber;
		yourself