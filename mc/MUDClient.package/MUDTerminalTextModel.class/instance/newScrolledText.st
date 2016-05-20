view creating
newScrolledText
	^ (MUDTerminalTextMorph on: self) 
		getSelectionSelector: #primarySelectionInterval; 
		yourself