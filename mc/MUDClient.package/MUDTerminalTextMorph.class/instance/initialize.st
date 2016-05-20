initialization
initialize
	mutex := Mutex new.
	super initialize.
	self 
		textFont: MUDFonts terminalFont;
		textColor: self textColor;
		backgroundColor: self backgroundColor