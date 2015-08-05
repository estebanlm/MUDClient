accessing
freeAvailableModifiers
	^ self class availableModifiers 
		reject: [ :eachModifier | 
			self pads anySatisfy: [ :each | each modifier = eachModifier ] ]