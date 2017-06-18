private
updateActualRoomIn: aTerminal
	| windows |
	windows := aTerminal dependentWindowsOf: self.
	windows do: [ :each | each selectRoom: self actualRoom ]