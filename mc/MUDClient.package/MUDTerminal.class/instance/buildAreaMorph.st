building
buildAreaMorph
	^ (MUDTerminalTextModel new 
		"maxLines: self class maxLines;"
		newScrolledText)
		beWrapped;
		beReadOnly