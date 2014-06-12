initialization
initialize
	super initialize.
	name := self class defaultName.
	visible := true.
	commands := Array new: self class defaultPadSize.
	1 to: self class defaultPadSize do: [ :index | 
		commands at: index put: (RpcPadCommand pad: self) ]