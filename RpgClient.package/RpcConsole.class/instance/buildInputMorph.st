building
buildInputMorph 
	^ RpcCommandFieldMorph new
		when: RubReturnEntered send: #dataSend: to: self;
		yourself