building
buildAreaMorphFor: aNote
	| morph |
	
	morph := RpcConsoleTextModel new 
		maxLines: SmallInteger maxVal;
		text: (aNote contents ifNil: [ '' ]);
		newScrolledText.
	morph
		textFont: StandardFonts codeFont;
		textColor: Smalltalk ui theme textColor;
		backgroundColor: Smalltalk ui theme backgroundColor;
		beReadOnly.
			
	^ morph