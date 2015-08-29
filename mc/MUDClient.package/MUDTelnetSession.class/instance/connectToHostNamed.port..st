connection
connectToHostNamed: aString port: aNumber
	host := aString.
	port := aNumber.
	
	super connectToHostNamed: aString port: aNumber.
	self startProcess.