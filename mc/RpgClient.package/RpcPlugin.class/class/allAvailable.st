accessing
allAvailable 
	^ (self allSubclasses 
		reject: #isAbstract)
		collect: #uniqueInstance