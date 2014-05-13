adding
addGame 
	^ games add: (RpcGame 
		name: 'New Game' 
		host: '' 
		port: 5555)