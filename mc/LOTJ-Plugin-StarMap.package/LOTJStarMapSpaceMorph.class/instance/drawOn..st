drawing
drawOn: aCanvas
	self isVisible ifFalse: [ ^ self ].
	aCanvas 
		fillRectangle: self bounds 
		color: self color
