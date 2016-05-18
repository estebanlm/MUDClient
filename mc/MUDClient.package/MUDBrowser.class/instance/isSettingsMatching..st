private settings
isSettingsMatching: aSetting
	^ aSetting game = self game 
		and: [ aSetting browserClass = self class ]