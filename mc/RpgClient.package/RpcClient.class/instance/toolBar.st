accessing
toolBar
	^ toolBar ifNil: [ 
		toolBar := (RpcToolBar new
			when: RpcGameActivated send: #activateGame: to: self;
			yourself) ]