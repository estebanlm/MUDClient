building
buildInputMorph 
	^ MUDCommandFieldMorph new
		textFont: MUDFonts terminalFont;
		textColor: self textColor;
		backgroundColor: self backgroundColor;
		when: RubReturnEntered send: #dataSend: to: self;
		yourself