building
buildInputMorph 
	^ MUDCommandFieldMorph new
		textFont: StandardFonts codeFont;
		textColor: self textColor;
		backgroundColor: self backgroundColor;
		when: RubReturnEntered send: #dataSend: to: self;
		yourself