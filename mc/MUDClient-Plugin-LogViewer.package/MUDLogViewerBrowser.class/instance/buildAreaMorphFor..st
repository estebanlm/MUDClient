building
buildAreaMorphFor: aNote
	^ (MUDTerminalTextModel new 
		maxLines: SmallInteger maxVal;
		text: (aNote contents ifNil: [ '' ]);
		newScrolledText)
		textColor: Smalltalk ui theme textColor;
		backgroundColor: Smalltalk ui theme backgroundColor;
		beReadOnly;
		yourself
