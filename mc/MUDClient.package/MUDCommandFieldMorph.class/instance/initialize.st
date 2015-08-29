initialization
initialize
	super initialize.
	
	self textArea 
		when: RubReturnEntered send: #historyUpdate: to: self;
		when: MUDKeyUpEntered send: #historyBackward to: self;
		when: MUDKeyDownEntered send: #historyForward to: self.
	
	self
		withoutAdornment;
		textColor: Smalltalk ui theme textColor;
		backgroundColor: Smalltalk ui theme backgroundColor;
		withGhostText: self class ghostText.