decorating
decorate: aString
	| stream |
	stream := VTermOutputDriver on: String new writeStream.
	stream 
		light; 
		white; 
		nextPutAll: DateAndTime now asStringYMDHM;
		reset;
		space;
		nextPutAll: aString.
	^ stream outStream contents