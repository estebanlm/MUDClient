building
buildAreaMorph
	^ (MUDTerminalTextModel new 
		"maxLines: self class maxLines;"
		newScrolledText)
		textFont: StandardFonts codeFont;
		textColor: self textColor;
		backgroundColor: self backgroundColor;
		beWrapped;
		beReadOnly