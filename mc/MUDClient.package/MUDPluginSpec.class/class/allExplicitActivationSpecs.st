accessing
allExplicitActivationSpecs
	^ self allSubclasses 
		collect: #uniqueInstance
		thenSelect: #needsExplicitActivation