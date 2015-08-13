private ui
transmitFocus
	self isConnected 
		ifTrue: [ inputMorph takeKeyboardFocus ]