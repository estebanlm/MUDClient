initialization
initialize
	super initialize.
	current := false.
	self 
		extent: self class defaultExtent;
		borderWidth: 1;
		borderColor: self borderColor;
		color: self backgroundColor