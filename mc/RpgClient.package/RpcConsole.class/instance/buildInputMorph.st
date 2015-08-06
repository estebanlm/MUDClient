building
buildInputMorph 
	^ RpcCommandFieldMorph new
		textFont: StandardFonts codeFont;
		when: RubReturnEntered send: #dataSend: to: self;
		yourself