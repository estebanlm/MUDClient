initialization
initialize
	super initialize.
	
	self textArea 
		when: RubReturnEntered send: #historyUpdate: to: self;
		when: RpcKeyUpEntered send: #historyBackward to: self;
		when: RpcKeyDownEntered send: #historyForward to: self.
	
	self
		textColor: Smalltalk ui theme textColor;
		backgroundColor: Smalltalk ui theme backgroundColor;
		withGhostText: self class ghostText.