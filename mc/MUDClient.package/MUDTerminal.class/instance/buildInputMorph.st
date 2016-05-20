building
buildInputMorph 
	^ MUDCommandFieldMorph new
		when: RubReturnEntered send: #dataSend: to: self;
		yourself