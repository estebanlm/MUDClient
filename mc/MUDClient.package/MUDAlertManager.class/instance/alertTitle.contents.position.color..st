alerting
alertTitle: titleString contents: aString position: aPosition color: aColor
	| parsed cleanString color bgColor |
	parsed := (self ansiParser parse: aString onError: [ {MUDANSIText new text: aString} ]).
	color := parsed detect: [ :each | each class = MUDANSIColor ] ifNone: [ nil ]. 
	cleanString := MUDANSITextCleaner visitAll: parsed.
	bgColor := aColor ifNil: [ Color veryDarkGray ].
	
	MUDGrowlMorph 
		openWithLabel: titleString
		contents: cleanString 
		position: aPosition
		backgroundColor: bgColor
		labelColor: (color ifNotNil: [ color foregroundColor ] ifNil: [ bgColor contrastingColor ])
		in: self owner