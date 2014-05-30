private
activateGame: ann
	activeGame ifNotNil: [ self announce: (RpcGameDeactivated game: ann game) ].
	self console openAndConnectTo: ann game.
	"trying connect will trigger a session close if there is already a game in the works. 
	 That's why is important to change the activeGame *after*: the disconnect event can 
	 cause sync problems (for example, by setting activeGame to nil again)"
	activeGame := ann game.
	self toolBar refresh.
	self announce: ann "pump up"