installing
installFullTheme
	super installFullTheme.
	RubCursor 
		cursorWithFixedColor: true;
		defaultColor: Smalltalk ui theme caretColor.