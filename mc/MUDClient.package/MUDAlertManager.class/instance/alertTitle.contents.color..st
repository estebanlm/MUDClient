alerting
alertTitle: titleString contents: aString color: aColor
	| parsed cleanString color |
	parsed := (self ansiParser parse: aString onError: [ {MUDANSIText new text: aString} ]).
	color := parsed detect: [ :each | each class = MUDANSIColor ] ifNone: [ nil ]. 
	cleanString := MUDANSITextCleaner visitAll: parsed.
	
	MUDGrowlMorph 
		openWithLabel: titleString
		contents: cleanString 
		backgroundColor: (aColor ifNil: [ Color veryDarkGray ])
		labelColor: (color ifNotNil: [ color foregroundColor ] ifNil: [ Color white ])
		in: self owner