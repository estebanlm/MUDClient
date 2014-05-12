building
createAreaMorph
	^ (RubScrolledTextModel new 
		"maxLines: self class maxLines;"
		newScrolledText)
		textColor: Smalltalk ui theme textColor;
		backgroundColor: Smalltalk ui theme backgroundColor;
		beWrapped;
		beReadOnly