initialization
initializeCommands
	commands := Array new: self class padSize.
	1 to: self class padSize do: [ :index | 
		commands at: index put: (RpcPadCommand pad: self) ].
	self resetCommandBindings