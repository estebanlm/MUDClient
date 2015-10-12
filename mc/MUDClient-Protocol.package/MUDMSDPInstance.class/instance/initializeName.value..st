initialization
initializeName: aString value: anObject 
	self initialize.
	self variable: (MUDMSDPVariable named: aString).
	self value: anObject.