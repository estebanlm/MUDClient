as yet unclassified
receive: aString
	self session announce: (MUDDataReceived data: aString)