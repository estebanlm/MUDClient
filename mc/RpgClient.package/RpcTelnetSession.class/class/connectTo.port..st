instance creation
connectTo: aString port: aNumber 
	^ self new 
		connectToHostNamed: aString port: aNumber;
		yourself
	