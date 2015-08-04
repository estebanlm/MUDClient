actions
activateGame: ann
	self activeGame ifNotNil: [ self deactivateGame ]. "Deactivate if active"
	activeGame := ann game.
	self cleanUpLastActiveGameDisplay.
	self activeDisplayConfiguration activate. "Activate"
	self console openAndConnectTo: ann game. "Connect"
	self toolBar refresh. "Refresh to ensure toolbar icons reflect correct game"
	self resetKeyBindings. "Ensure keybings correspond with current game"	
	self announce: ann "Pump up announcement (in case someone want to do something extra)"