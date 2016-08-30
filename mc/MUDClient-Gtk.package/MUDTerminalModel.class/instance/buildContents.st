building
buildContents
	^ GtkBox newVertical 
		packStart: (textArea := self buildTextArea);
		packStart: (inputText := self buildInputField) expand: false fill: true padding: 0;
		yourself