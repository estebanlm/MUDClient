building
createInputMorph 
	^ RpcCommandFieldMorph new
		when: RubReturnEntered send: #dataSend: to: self;
		yourself