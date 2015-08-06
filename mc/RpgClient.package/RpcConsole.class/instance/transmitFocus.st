private
transmitFocus
	self isConnected 
		ifTrue: [ inputMorph takeKeyboardFocus ]