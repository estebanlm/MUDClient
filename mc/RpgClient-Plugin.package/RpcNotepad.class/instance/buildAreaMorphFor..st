building
buildAreaMorphFor: aNote
	^ (RubScrolledTextModel new newScrolledText)
		textColor: Smalltalk ui theme textColor;
		backgroundColor: Smalltalk ui theme backgroundColor;
		beWrapped	