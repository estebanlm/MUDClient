commands
at: aString putMap: aDictionaryOrBlock 
	self 
		at: aString 
		put: [ self map: aDictionaryOrBlock ]