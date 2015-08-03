actions
activateGame: ann
	self activeGame ifNotNil: [ self deactivateGame ]. "Deactivate if active"
	activeGame := ann game.
	self lastActiveGame "Clean display of last active game"
		ifNotNil: [ (self gameDisplayConfigurationAt: self lastActiveGame) cleanUp ].
	self activeDisplayConfiguration activate. "Activate"
	self console openAndConnectTo: ann game. "Connect"
	self toolBar refresh. "Refresh to ensure toolbar icons reflect correct game"
	self announce: ann "Pump up announcement (in case someone want to do something extra)"