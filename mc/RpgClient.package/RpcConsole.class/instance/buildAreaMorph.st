building
buildAreaMorph
	^ (RpcConsoleTextModel new 
		"maxLines: self class maxLines;"
		newScrolledText)
		textFont: StandardFonts codeFont;
		textColor: Smalltalk ui theme textColor;
		backgroundColor: Smalltalk ui theme backgroundColor;
		beWrapped;
		beReadOnly