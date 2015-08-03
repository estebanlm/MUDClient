actions
addObject
	^ (RpcGame 
		name: 'New Game' 
		host: '' 
		port: 5555)
		save