building
buildInputField
	^ GtkEntry new
		sizeRequest: -1@30; 
		overrideBackgroundColor: Color black;
		placeHolderText: 'Command...';
		grabDefault