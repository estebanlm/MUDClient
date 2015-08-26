*RpgClient
addWindowWithTitle: aString extent: aSize
	self addWindow.
	morph 
		setLabel: aString;
		extent: aSize.