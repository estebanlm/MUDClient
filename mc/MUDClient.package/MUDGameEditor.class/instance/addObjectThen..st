actions
addObjectThen: aBlock
	aBlock cull: ((MUDGame 
		name: 'New Game' 
		host: '' 
		port: 5555)
		save)