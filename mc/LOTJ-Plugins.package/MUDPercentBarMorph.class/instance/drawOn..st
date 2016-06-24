drawing
drawOn: aCanvas 
	| percent origin width height x text textBounds |
	
	percent := self percent.
	percent = 0 ifTrue: [ ^ super drawOn: aCanvas ].
	
	origin := self bounds origin.
	width := self extent x.
	height := self extent y.
	x := width * percent / 100.
	
	aCanvas 
		fillRectangle: (origin extent: x@height) 
		fillStyle: (self colorFor: percent)
		borderStyle: self borderStyle.
		
	aCanvas 
		fillRectangle: ((origin x+x)@(origin y) extent: (width-x)@height) 
		fillStyle: self fillStyle
		borderStyle: self borderStyle.	
	
	text := (self isShowPercent 
		ifTrue: [ percent asString, '%' ]
		ifFalse: [ '{1}/{2}' format: { self value. self max } ]).	
	
	textBounds := (self bounds
		translateBy: (((self bounds width - (self font widthOfString: text)) / 2) rounded) @ (self bounds height - self font height / 2) rounded)
		insetBy: 0@0.
	
	aCanvas 
		drawString: text 
		in: textBounds
		font: self font
		color: Color black.