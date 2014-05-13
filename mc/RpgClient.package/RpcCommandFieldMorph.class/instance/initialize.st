initialization
initialize
	super initialize.
	self
		textColor: Smalltalk ui theme textColor;
		backgroundColor: Smalltalk ui theme backgroundColor;
		withGhostText: self class ghostText	