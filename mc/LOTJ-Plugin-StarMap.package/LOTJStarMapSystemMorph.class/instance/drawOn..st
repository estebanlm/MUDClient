drawing
drawOn: aCanvas
	aCanvas
		fillOval: self bounds
		color: self color
		borderWidth: 0
		borderColor: Color transparent.
	self isShowName 
		ifTrue: [ self drawNameOn: aCanvas ]