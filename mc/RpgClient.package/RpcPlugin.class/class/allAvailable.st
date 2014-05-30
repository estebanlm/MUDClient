accessing
allAvailable 
	^ ((self allSubclasses 
		reject: #isAbstract)
		select: #isVisible)
		collect: #new