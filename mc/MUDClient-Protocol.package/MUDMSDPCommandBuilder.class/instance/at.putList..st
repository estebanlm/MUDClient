commands
at: aString putList: aCollectionOrBlock 
	self 
		at: aString 
		put: [ self list: aCollectionOrBlock ]