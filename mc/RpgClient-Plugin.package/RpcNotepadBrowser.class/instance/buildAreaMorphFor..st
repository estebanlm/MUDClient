building
buildAreaMorphFor: aNote
	| morph |
	
	morph := RubScrolledTextModel new 
		text: (aNote contents ifNil: [ '' ]);
		newScrolledText.
	morph
		textFont: StandardFonts codeFont;
		textColor: Smalltalk ui theme textColor;
		backgroundColor: Smalltalk ui theme backgroundColor;
		autoAccept: true;
		beWrapped	.

	morph announcer 
		when: RubTextAccepted do: [ :ann | aNote contents: ann text asString ].
			
	^ morph