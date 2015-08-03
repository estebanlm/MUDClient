executing
executeFor: aClient
	aClient sendCommand: (self pad prefix 
		ifNotNil: [ :prefix | prefix, ' ', self text ]
		ifNil: [ self text ])