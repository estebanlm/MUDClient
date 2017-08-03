enumerating
withLevelConnectionsDo: aBlock
	self 
		withNext: { self room } 
		excluding: #()
		levelConnectionsDo: aBlock