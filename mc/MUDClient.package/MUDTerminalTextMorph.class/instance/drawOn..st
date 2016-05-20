drawing
drawOn: aCanvas
	self mutex critical: [ 
		super drawOn: aCanvas ]