initialization
initialize
	super initialize.
	
	self
		withoutAdornment;
		textColor: self textColor;
		backgroundColor: self backgroundColor;
		textFont: MUDFonts terminalFont;
		withGhostText: self class ghostText.

	self textArea 
		when: RubReturnEntered send: #historyUpdate: to: self;
		when: MUDKeyUpEntered send: #historyBackward to: self;
		when: MUDKeyDownEntered send: #historyForward to: self.
