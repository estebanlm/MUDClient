building
buildAreaMorph
	^ (MUDTerminalTextModel new 
		"maxLines: self class maxLines;"
		newScrolledText)
		textFont: MUDFonts terminalFont;
		textColor: self textColor;
		backgroundColor: self backgroundColor;
		beWrapped;
		beReadOnly