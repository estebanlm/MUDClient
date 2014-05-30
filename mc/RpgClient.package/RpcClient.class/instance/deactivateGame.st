private
deactivateGame
	activeGame := nil.
	self toolBar refresh.
	self announce: RpcGameDisconnected new "pump up"