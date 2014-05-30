private
buttonMorph: aModel
	^ (Smalltalk ui theme
		newButtonIn: nil 
		for: aModel
		getState: nil
		action: #execute
		arguments: {}
		getEnabled: nil
		label: (AlphaImageMorph new image: aModel glamourAction icon)
		help: aModel glamourAction title trimBoth)
		valueOfProperty: #noBorder ifAbsentPut: [ true ];
		valueOfProperty: #noFill ifAbsentPut: [ true ];
		setProperty: #wantsKeyboardFocusNavigation toValue: false; 
		borderWidth: 0;
		yourself