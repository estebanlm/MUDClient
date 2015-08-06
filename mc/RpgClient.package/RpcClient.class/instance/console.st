accessing
console
	^ console ifNil: [ 
		console := RpcConsole new
			when: RpcGameDisconnected send: #deactivateGame to: self;
			yourself ]