commands
at: aString put: anObject 
	stream 
		<< MSDP_VAR;
		<< aString asByteArray.
	self put: anObject.