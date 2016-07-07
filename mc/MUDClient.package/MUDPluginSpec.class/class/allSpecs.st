accessing
allSpecs
	^ self allSubclasses 
		reject: #isAbstract
		thenCollect: #uniqueInstance